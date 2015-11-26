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
    data=x.inputSingleScan();
    if (data(1)==1 && ~headIn )
        currTrials=currTrials+1;
        headIn=true;
        firstBeam=false;
        if (lev.levelNumber>6 && ~valveopen)
            olfactometerSetOder(h2, slave, logger, valveNumber, vopen);
            activePause(delay, logger, h2, slave);
            olfactometerSetFinalValve(h2, slave, logger, vopen);
            % pause(delay)
            valveTimer=tic
            valveopen=true;
        end
    elseif (data(1)==0 && ~firstBeam)
        headIn=false;
        if (lickCounter<lev.lickThresh)
            missCount=missCount+1;
        end
        trialInit=true;
        %   lickCounter=0;
        dataVec=[currTrials attempts successCount missCount passed];
        dataResults=[dataResults;dataVec];
        attempts=0;
        
    end
    
    if (data(2)==1 && ~wateropen && disconn && trialInit)
        
        %display(lev.levelNumber)
        disconn=false;
        lickCounter=lickCounter+1;
        display(lickCounter)
        attempts=attempts+1;
        if firsLick
            tic
            firsLick=false;
        end
        if (lickCounter>=lev.lickThresh && toc*1000<=lev.timeWindow)
            %giving water
            wateropen=true;
            display('water was given')
            x.outputSingleScan(1);
            pause(0.05);
            x.outputSingleScan(0);
            successCount=successCount+1;
            lickCounter=0;
            if (successCount>=lev.successesNeeded)
                passed=true;
                dataVec=[currTrials attempts successCount missCount passed];
                dataResults=[dataResults;dataVec];
                if (lev.levelNumber>6)
                    olfactometerSetOder(h2, slave, logger, valveNumber, vclose);
                    olfactometerSetFinalValve(h2, slave, logger, vclose);
                end
                return;
            end
            wateropen=false;
            pause(0.05);
            pause(lev.interTrialInterval)
        end
    elseif (data(2)==0)
        disconn=true;
    end
    if (lev.levelNumber>6 && valveopen)
        if (toc(valveTimer)>1)
            olfactometerSetOder(h2, slave, logger, valveNumber, vclose);
            olfactometerSetFinalValve(h2, slave, logger, vclose);
            valveopen=false;
            pause(2)
        end
    end
    if(~firsLick)
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
