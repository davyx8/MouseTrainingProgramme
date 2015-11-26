function [passed data] = LevelHandler(dev,lev)
wateropen=false;
x=dev;
currTrials=0;
headIn=false;
successCount=0;
missCount=0;
trialNumber=1;
attempts=0;
firsLick=true;
firstBeam=true;
data=[];
passed=false;
while (true)
    data=x.inputSingleScan();
    if (data(1)==1 && ~headIn)
        currTrials=currTrials+1;
        headIn=true;
        firstBeam=false;
    elseif (data(1)==0 && ~firstBeam)
        headIn=false;
        if (lickCounter<lev.lickThresh)
            missCount=missCount+1;
        end
        lickCounter=0;
        dataVec=[currTrials attempts successCount missCount passed];
        data=[data;dataVec];
        attempts=0;
        
    end
    
    if (data(2)==1 && ~wateropen)
        lickCounter=lickCounter+1;
        attempts=attempts+1;
        if firsLick
            tic
            firsLick=false;
        end
        if (lickCounter>=lev.lickThresh && toc*1000<=timeWindow)
            x.outputSingleScan(1);
            pause(0.05);
            x.outputSingleScan(0);
            successCount=successCount+1;
            if (successCount>lev.successesNeeded)
                passed=true;
                dataVec=[currTrials attempts successCount missCount passed];
                data=[data;dataVec];
                return;
            end
        end
    end
    if(~firsLick)
        if (toc*1000 >timeWindow)
            firsLick=true;
            lickCounter=0;
        end
    end
end

end
