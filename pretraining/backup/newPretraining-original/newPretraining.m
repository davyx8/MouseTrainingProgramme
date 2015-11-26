x=daq.createSession('ni');
x.IsContinuous = true;
%Beam
x.addDigitalChannel('Dev1','port1/line0' , 'InputOnly');
%Lick
x.addDigitalChannel('Dev1','port1/line1' , 'InputOnly');
%valve 1
x.addDigitalChannel('Dev1','port0/line0' , 'OutputOnly');
%valve 2
%x.addDigitalChannel('Dev1','port0/line1' , 'InputOnly');
%valveopen=false;
currLevel=Level;
path=sprintf('pretraining_%d_%d_%d_%d_%d_%d.csv',fix(clock()));

%level 1
currLevel.successesNeeded=10;
currLevel.numberofTrials=10;
pass=false;
currLevel.timeWindow=inf;
while(~pass)
    display( 'Mouse is still on level one');
    [pass data]=LevelHandler(x,currLevel);
    level1=ones(size(data,1),1);
    data=[level1 data];
    dlmwrite(path,data,'-append');
end


% 
% pass=false;
% currLevel.lickThresh=2;
% while(~pass)
%     display( 'Mouse is still on level two');
%     [pass data]=LevelHandler(x,currLevel);
%     level2=2*ones(size(data,1),1);
%     data=[level2 data];
%     dlmwrite(path,data,'-append');
% end
% 
% 
% pass=false;
% currLevel.lickThresh=3;
% while(~pass)
%     display( 'Mouse is still on level three');
%     [pass data]=LevelHandler(x,currLevel);
%     level3=3*ones(size(data,1),1);
%     data=[level3 data];
%     dlmwrite(path,data,'-append');
% end
% 
% 
% %level 4
% pass=false;
% currLevel.lickThresh=4;
% while(~pass)
%     display( 'Mouse is still on level four');
%     [pass data]=LevelHandler(x,currLevel);
%     level4=4*ones(size(data,1));
%     data=[level3 data];
%     dlmwrite(path,data,'-append');
% end
% 
% %level 7 starting stimuli
% pass=false;
% currLevel.lickThresh=4;
% while(~pass)
%     display( 'Mouse is still on level seven');
%     [pass data]=LevelHandler(x,currLevel);
%      level7=7*ones(size(data,1));
%     data=[level3 data];
%     dlmwrite(path,data,'-append');
% end
% 

