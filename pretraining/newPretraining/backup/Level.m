classdef Level
   properties
waterGivePeriod=0.05;
timeWindow=200; %ms
NumberOfLicksPerTimeWindow=4;
successesNeeded=10;
lickThresh=0;
%stuff to be counted
%when mouse actually got water
numberofSuccess=0;
numberofFailures =0;
%everyBeamBreaking
numberOfAttemps = 0;
Valve=0;
%for training only
interTrialInterval=0;
minWindowsBeforeFirstLick
lengthOfWindow;
numberofTrials=20;
   end
end
