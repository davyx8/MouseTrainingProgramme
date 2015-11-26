classdef Level
    properties
        
        levelNumber=1;
        
        waterGivePeriod=0.05; %seconds
        
        %in order to determine if consecutive licks are counted
        %together for threshold satistfaction timewindow is defined
        timeWindow=200; %ms
       
        %number of successes needed to pass to next level
        successesNeeded=10;
        %nubmer of licks needed in order to consoder it a reall "lick"
        lickThresh=0;
        %odor valve to open
        Valve=0;
        %how long ot waut between each trial
        interTrialInterval=0;
        numberofTrials=20;
        
        
        %for training only
        NumberOfLicksPerTimeWindow=4;
        
        minWindowsBeforeFirstLick
        lengthOfWindow;
        
    end
end
