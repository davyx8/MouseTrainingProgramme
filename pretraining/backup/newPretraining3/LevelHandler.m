function [passed dataResults] = LevelHandler(dev,lev)
wateropen = false;
x=dev;
currTrials=0;
headIn=false;
successCount=0;
missCount=0;

trialNumber=1;
attempts=0;
firsLick=true;
firstBeam=true;
dataResults=[];
vopen=1;
vclose=0;
slave=1;
valveNumber=2;
passed=false;

delay=0.5;
lickCounter=0;
disconn=true;
trialInit=true;
valveopen=false;

if(lev.levelNumber>6)
    %%only in levels 7-8 we want to initialize olfactometer
    %% we are opening and closing just proper initialization
    %%so olf. will be ready for action
    traileID=sprintf('pelegLOG_%d_%d_%d_%d_%d_%d.csv',fix(clock()));
    logger = Logger(traileID,...
        @(h2) invoke(h2, 'SetDigOut', 1 ,1 ,0),...
        @(h2) invoke(h2, 'SetDigOut', 1 ,0 ,0));
    [ h2, resultOpen, resultLastError, resultID]= olfactometerConnect(logger);
    olfactometerSetOder(h2, slave, logger, valveNumber, vopen);
    olfactometerSetFinalValve(h2, slave, logger, vopen);
    olfactometerSetOder(h2, slave, logger, valveNumber, vclose);
    olfactometerSetFinalValve(h2, slave, logger, vclose);
end
while (true)
    % loop is broken only when successCount>=lev.successesNeeded
    
    %scanning to get data from electronic box
    data=x.inputSingleScan();
    
    if (data(1)==1 && ~headIn )
        % we get here when beam (data(1)) is broken AND it wasnt already
        % broken before (headIn)
        %we increase the number of trials every time beam is re-broken
        currTrials=currTrials+1;
        headIn=true;
        firstBeam=false;
        if (lev.levelNumber>6 && ~valveopen)
            % if we are in levels 7-8 we open the desired valve
            % and final valve (with specified delay)
            %notice that of the valve is alreday open we dont get in here
            olfactometerSetOder(h2, slave, logger, valveNumber, vopen);
            activePause(delay, logger, h2, slave);
            olfactometerSetFinalValve(h2, slave, logger, vopen);
            % pause(delay)
            valveTimer=tic
            valveopen=true;
        end
    elseif (data(1)==0 && ~firstBeam)
        %if beam is unbroken (==0) AND beam was broken before  (first beam)
        %if we didnt give water we count it as a miss
        headIn=false;
        if (lickCounter<lev.lickThresh)
            missCount=missCount+1;
        end
        %we want to signal that a trial has been re-initiated
        trialInit=true;
        %   lickCounter=0;
        %we save the data from this trial to the vector
        % and add it to the data results
        dataVec=[currTrials attempts successCount missCount passed];
        dataResults=[dataResults;dataVec];
        attempts=0;
        
    end
    
    if (data(2)==1 && ~wateropen && disconn && trialInit)
        %here we check if lick was preformed AND THAT:
        %~wateropen- water ISNT open
        %disconn -the mouse disconnected the tongue completly
        %so as not to count continous engagements as one lick
        %trial has been reinitialized after time window passed
        %see below
        
        
        
        %display(lev.levelNumber)
        disconn=false;
        lickCounter=lickCounter+1;
        display(lickCounter)
        attempts=attempts+1;
        if firsLick
            %if this is the first lick in the trial we want to start the
            %clock for the time window (to ocunt the licks)
            
            tic
            firsLick=false;
        end
        if (lickCounter>=lev.lickThresh && toc*1000<=lev.timeWindow)
            %%this is the stage wqe were all waitiing for
            %we check wether:
            %   A.the mouse did enough licks
            %   B. the licks were all done in the specified time window
            %giving water
            wateropen=true;
            display('water was given')
            %we open the water for the specified giving period
            x.outputSingleScan(1);
            pause(0.05);
            %pause(lev.waterGivePeriod)
            x.outputSingleScan(0);
            successCount=successCount+1;
            lickCounter=0;
            if (successCount>=lev.successesNeeded)
                %this is the loop breaking condition
                % we ereach here if mouse succceeded enough times to move
                % to next level
                passed=true;
                dataVec=[currTrials attempts successCount missCount passed];
                dataResults=[dataResults;dataVec];
                if (lev.levelNumber>6)
                    %it ok that mouse is finished but we still need to
                    %close olfactometer
                    olfactometerSetOder(h2, slave, logger, valveNumber, vclose);
                    olfactometerSetFinalValve(h2, slave, logger, vclose);
                end
                return;
            end
            
            wateropen=false;
            pause(0.05);
            
            %at the end of water giving we have to make an inter trial
            %interval, is done with the specific function
            if (lev.levelNumber>6)
                valveopen = pauseWithOlfactionClosing(valveTimer,h2,logger,valveNumber,interTrialInterval);
            else
                pause(lev.interTrialInterval)
            end
        end
    elseif (data(2)==0)
        disconn=true;
    end
    if (lev.levelNumber>6 && valveopen)
        %%here we want to close the olfactometer after 1sec
        if (toc(valveTimer)>1)
            olfactometerSetOder(h2, slave, logger, valveNumber, vclose);
            olfactometerSetFinalValve(h2, slave, logger, vclose);
            valveopen=false;
            %we pause for two seconds after closing
            pause(2)
        end
    end
    if(~firsLick)
        %we want to reinit the trial in case the time window passed
        % we also want to zero the lickcounter
        %also make sure the firstlick is set to true
        if (toc*1000 >lev.timeWindow)
            display('lickcounter zerored')
            toc*1000
            firsLick=true;
            lickCounter=0;
            trialInit=false;
        end
    end
end

end

function valveopen = pauseWithOlfactionClosing(valveTimer,h2,logger,valveNumber,interTrialInterval)
%%this function is an artifical delay in order to close olfactometer during
%%intertrial interval
loopTic=tic
while (toc(looptic)<interTrialInterval)
    if (lev.levelNumber>6 && valveopen)
        if (toc(valveTimer)>1)
            olfactometerSetOder(h2, 1, logger, valveNumber, 0);
            olfactometerSetFinalValve(h2, 1, logger, 0);
            valveopen=false;
        end
    end
end

end
