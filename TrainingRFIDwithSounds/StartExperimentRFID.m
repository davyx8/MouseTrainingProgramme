function varargout = StartExperimentRFID(varargin)
% STARTEXPERIMENT MATLAB code for StartExperiment.fig
%      STARTEXPERIMENT, by itself, creates a new STARTEXPERIMENT or raises the existing
%      singleton*.
%
%      H = STARTEXPERIMENT returns the handle to a new STARTEXPERIMENT or the handle to
%      the existing singleton*.
%
%      STARTEXPERIMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STARTEXPERIMENT.M with the given input arguments.
%
%      STARTEXPERIMENT('Property','Value',...) creates a new STARTEXPERIMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StartExperiment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StartExperiment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StartExperiment

% Last Modified by GUIDE v2.5 16-Mar-2015 07:09:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @StartExperiment_OpeningFcn, ...
    'gui_OutputFcn',  @StartExperiment_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before StartExperiment is made visible.
function StartExperiment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StartExperiment (see VARARGIN)

% Choose default command line output for StartExperiment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global mouseObj
global mouseObjects
global statsObjects
global guiTab
tmp={};
d = dir;
statsObjects=[];
mouseObjects=[]
isub = [d(:).isdir]; %# returns logical vector
nameFolds = {d(isub).name}
[idx,v] = listdlg('PromptString','Select mice','ListString',nameFolds)
for j=1:numel(idx)
    nameFolds{idx(j)}
    idx(j)
   % tabstr=sprintf('uitable%d',j)
    str=sprintf('%s/%s.mat',nameFolds{idx(j)},nameFolds{idx(j)})
    tmp(j)=nameFolds(idx(j))
    load(str);

    %load(str2);
    you = mousestats
    statsObjects=[statsObjects you]
    mouseObjects=[mouseObjects fuck]
    fuck.mouseName
    class(fuck.mouseName)
end
numel(mouseObjects)
mouseObj=fuck;
tmp
numel(tmp)
if(numel(tmp)<4)
    for y=numel(tmp)+1:4
        tmp{y}=''
    end
end
     set(handles.text15, 'String',tmp{1} );
     set(handles.text16, 'String',tmp{2} );
     set(handles.text17, 'String',tmp{3} );
     set(handles.text18, 'String',tmp{4} );
guiTab = containers.Map(tmp,{sprintf('set(handles.uitable1,%s,statsData.statsArray);','Data') ...
,sprintf('set(handles.uitable2,%s,statsData.statsArray);','''Data'''),...
sprintf('set(handles.uitable3,%s,statsData.statsArray);','''Data'''),...
sprintf('set(handles.uitable4,%s,statsData.statsArray);','''Data''')})

%save(str,'obj')
set(handles.Trial, 'String', num2str(mouseObj.currentValve));


% UIWAIT makes StartExperiment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StartExperiment_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Training
ZehBest(handles,hObject)
handles.edit1.String=553;
handles.edit1
hObject
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global closeTraining
closeTraining=false
'asd'
close(handles.gui)
% for i=1:100
% set(handles.Trial, 'String',num2str(i));
% set(handles.Valve, 'String', num2str(var2(mod(i,10)+1)));
% set(handles.Result, 'String', var(mod(i,4)+1));
% pause(0.01)
% end
%close all
global h2

closeOlfactometer
release(h2)


%close all
%clear all


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function ZehBest(handles,hObject)
global closeTraining
global mouseObj
global mouseObjects
global statsObjects
global str
global x
global h2
global rfid
global lev
global rewardCnt
global nonRewardCnt
global statsData
global hits
global miss
global FA
global CR
global guiTab
global logTimer
 hits=0;
 miss=0;
 FA=0;
 CR=0;
 lev=mouseObj;
str=[pwd,'\wavFiles'];
soundmat={}
lev.soundfiles
for i=1:numel(lev.soundfiles)
    strp=[str,'\']
    strp=[strp,lev.soundfiles{i}]
    try
    [soundmat{i} Fs]=wavread(strp)
    %figure,plot(soundmat{i});
    z.Rate=Fs
    x.Rate=Fs
    catch
        'error'
    end
end
rewardCnt=0;
nonRewardCnt=0;
rfidmatch=false
closeTraining=true;

closeserials
finalValveLickDelay=0.25;
s = serial('COM1');
set(s, 'Timeout',1);
nextValve=-1;
fopen(s);
for k=1:numel(mouseObjects)
    if (isempty(mouseObjects(k).randomValves))
        randomValves=generateRandOdor2(mouseObjects(k).noRewardValve,mouseObjects(k).rewardValve,mouseObjects(k).numberofTrials);
        [a,b]=hist(randomValves,unique(randomValves));
        valveCount=1;
        mouseObjects(k).randomValves=randomValves;
        dlmwrite(mouseObjects(k).valveSequencePath,randomValves');
        lev=mouseObjects(k)
        statsData= statsObjects(k)
    else
        % randomValves=mouseObjects(k).randomValves;
        valveCount=mouseObjects(k).currentValve;
    end
end
x=daq.createSession('ni');
x.IsContinuous = true;
%Beam
x.addDigitalChannel('Dev2','port0/line0' , 'InputOnly');
%Lick
x.addDigitalChannel('Dev2','port0/line1' , 'InputOnly');
% valve 1
x.addDigitalChannel('Dev2','port0/line2' , 'OutputOnly');
x.addDigitalChannel('Dev2','port1/line6' , 'OutputOnly');
% valve 2
% x.addDigitalChannel('Dev1','port0/line1' , 'InputOnly');
% valveopen=false;

z=daq.createSession('ni');
z.IsContinuous = true;
z.addAnalogOutputChannel('Dev2','ao0','Voltage');
addTriggerConnection(z,'external','Dev2/PFI1','StartTrigger')
lickTimer=0;
valveTimer=0;
valveOpeningTime=lev.valveOpeningTime;
loggingThresh=lev.timeWindow;
wateropen = false;
%x=dev;

headIn=false;
%stuff to count


insideInterTrial=false;
attempts=0;
firsLick=true;
firstBeam=true;
dataResults=[valveCount;valveCount;valveCount];
if(valveCount==0)
    dataResults=ones(3,1);
end
vopen=1;
vclose=0;
slave=1;
loopVar=true;
notWrriten=true;
wasntLogged=true;
%diffrence=diff([a' ones(length(a),1)*max(a)]')

delay=lev.delay;
lickCounter=0;
disconn=true;
trialInit=true;
valveopen=false;
breaking=false;
waterWasGiven=false;
samplingTimer=tic;

%olf init
traileID=sprintf('pelegLOG_%d_%d_%d_%d_%d_%d.csv',fix(clock()));
logger = Logger(traileID,...
    @(h2) invoke(h2, 'SetDigOut', 1 ,1 ,0),...
    @(h2) invoke(h2, 'SetDigOut', 1 ,0 ,0));
[ h2, resultOpen, resultLastError, resultID]= olfactometerConnect(logger);
olfactometerSetOder(h2, slave, logger, 2, vopen);
olfactometerSetFinalValve(h2, slave, logger, vopen);
olfactometerSetOder(h2, slave, logger, 2, vclose);
olfactometerSetFinalValve(h2, slave, logger, vclose);
logTimer=tic 
while (true & closeTraining)
    if(insideInterTrial)
        continue
    end
    
    % loop is broken only when successCount>=lev.successesNeeded
    if(valveCount>lev.numberofTrials)
        closeEvs(h2);
        
        obj=lev;
        save(str,'obj');
        return
    end
    %scanning to get data from electronic box
    
    data=x.inputSingleScan();
    
    dataVec=[];
    
    if(valveTimer~=0)
        
        if(toc(valveTimer)<loggingThresh)
            notWrriten=true;
            if(toc(samplingTimer)>=0.01)
                dataVec=[data(2); toc(valveTimer) ; data(1)];
                dataResults=[dataResults dataVec];
                samplingTimer=tic;
            end
            
            if (get(handles.pushbutton3,'Value')==1)
                pushbutton3_Callback(hObject,[],handles);
            end
        else
           
            if(notWrriten) 
try
    trash=(fscanf(s,'%c',s.BytesAvailable+1))
                                flushinput(s)
catch
end
                if(intersect(valveNumber,lev.rewardValve)==valveNumber)
                    lev.lickRewardedPath
                    dlmwrite(lev.lickRewardedPath,dataResults(1,:),'-append');
                    dlmwrite(lev.beamRewardedPath,dataResults(3,:),'-append');
                else
                    dlmwrite(lev.lickUnrewardedPath,dataResults(1,:),'-append');
                    dlmwrite(lev.beamUnrewardedPath,dataResults(3,:),'-append');
                end
                dlmwrite(lev.timePath,dataResults(2,:),'-append');
                LogResultsWhenPausing(valveCount,valveNumber,lickCounter,waterWasGiven,handles);
                
                lickCounter=0;
                dataResults=[valveCount+1;valveCount+1; valveCount+1];
                notWrriten=false;
                if (valveCount>lev.numberofTrials)
                    closeEvs(h2);
                    if(notWrriten)
                        LogResultsWhenPausing(lev,valveCount,valveNumber,lickCounter,waterWasGiven,handles);
                    end
                    return;
                end
                valveNumber=lev.randomValves(valveCount);
               
                if(valveCount+1<=numel(lev.randomValves))
                    nextValve=lev.randomValves(valveCount+1);
                else
                    nextValve=999;
                end
           
            else
                %  guidata()
                pause(0.001);
            end
        end
        
    end
    
    
    
    if (data(1)==1 && ~headIn)
        
        if( valveTimer==0 || toc(valveTimer)>lev.interTrialInterval)
            % we get here when beam (data(1)) is broken AND it wasnt already
            % broken before (headIn)
            %we increase the number of trials every time beam is re-broken
            %currTrials=currTrials+1;
            headIn=true;
            firstBeam=false;
            lickCounter=0;
            firsLick=true;
            time=fix(clock);
            if(~valveopen)
                valveNumber=lev.randomValves(valveCount);
                tic
                loopVar=true;
                while(loopVar | ~rfidmatch)
                    try
                    if(s.BytesAvailable>10)
                        rfid=(fscanf(s,'%c',s.BytesAvailable));
                    end
                    catch
                    rfid=''    
                    end
                    if (numel(rfid)>10)
                        rfid=rfid(1:10);
                        for i=1:numel(mouseObjects)
                            display(mouseObjects(i).mouseName)
                            display(num2str(rfid))
                            if(strcmp(mouseObjects(i).mouseName,num2str(rfid)))
                                if(~strcmp(lev.mouseName,num2str(rfid)) & valveTimer~=0)
                                    display('switch happened')
                                    LogResultsWhenPausing(valveCount,valveNumber,lickCounter,waterWasGiven,handles);
                                end
                                set(handles.mouseid, 'String', num2str(rfid));
                                mouseObjects(i).currentValve=mouseObjects(i).currentValve+1;
                                lev=mouseObjects(i);
                                statsData=statsObjects(i);
                                
                                valveCount=lev.currentValve
                               
                                rfidmatch=true;
                                
                            end
                        end
                        loopVar=false;
                    end
                end
                toc
                waterWasGiven=false;
                rfid
                rfidmatch=false;
                
                 
                queueOutputData(z,soundmat{valveNumber});
                z.Rate=500000;
                pause(soundDelay-toc(soundtimer));
                startBackground(z)
                x.outputSingleScan([0 1]);
                pause(0.01)
                x.outputSingleScan([0 0]);
                olfactometerSetOder(h2, slave, logger, valveNumber, vopen);
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%GUI UPDATING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                set(handles.Trial, 'String', num2str(valveCount));
                set(handles.Valve, 'String', num2str(valveNumber));
                set(handles.nextValve, 'String', num2str(nextValve));
    
                if(intersect(valveNumber,lev.rewardValve)==valveNumber)
                    set(handles.Reward, 'String', 'Rewarded');
                    statsData.rewardCnt=statsData.rewardCnt+1
                    
                    if(mod(statsData.rewardCnt,10)==0)
                     statsData.statsArray(statsData.rewardCnt/10,1)=statsData.hits/statsData.rewardCnt
                   %  set(handles.tableTag,'Data',statsData.statsArray);
                      guiTab
                    lev.mouseName  
                   eval(guiTab(lev.mouseName))
                    end
                else
                    set(handles.Reward, 'String', 'Not Rewarded');
                    statsData.nonRewardCnt=statsData.nonRewardCnt+1;
                    if(mod(statsData.nonRewardCnt,10)==0)
                     statsData.statsArray(statsData.nonRewardCnt/10,2)=statsData.CR/statsData.nonRewardCnt
                    % set(handles.tableTag,'Data',statsData.statsArray);
                 guiTab
                    lev.mouseName 
                    eval(guiTab(lev.mouseName))
                    end
                end
                if(intersect(nextValve,lev.rewardValve)==nextValve)
                    set(handles.nextRewarded, 'String', 'Rewarded');
                else
                    set(handles.nextRewarded, 'String', 'Not Rewarded');
                end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%GUI UPDATING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                openingTimer=tic;
                
                while(delay-toc(openingTimer) > 0.01)
                    
                end
                olfactometerSetFinalValve(h2, slave, logger, vopen);
                valveTimer=tic;
                samplingTimer=tic;
                valveopen=true;
            end
        end
    elseif (data(1)==0 && ~firstBeam)
        %if beam is unbroken (==0) AND beam was broken before  (first beam)
        %if we didnt give water we count it as a miss
        headIn=false;
        %we want to signal that a trial has been re-initiated
        trialInit=true;
        %   lickCounter=0;
        %we save the data from this trial to the vector
        % and add it to the data results
    end
    
    if (data(2)==1 && ~wateropen && disconn && trialInit && ...
            toc(valveTimer)<lev.interTrialInterval & ~waterWasGiven & toc(valveTimer)>finalValveLickDelay)
        %here we check if lick was preformed AND THAT:
        %~wateropen- water ISNT open
        %disconn -the mouse disconnected the tongue completly
        %so as not to count continous engagements as one lick
        %trial has been reinitialized after time window passed
        %see below
        disconn=false;
        
        if firsLick
            %if this is the first lick in the trial we want to start the
            %clock for the time window (to ocunt the licks)
            display('licktimer has been reinit')
            lickTimer=tic;
            wasntLogged=true;
            firsLick=false;
        end
        if toc(lickTimer)<=lev.timeWindow
            lickCounter=lickCounter+1;
        end
        set(handles.Licks, 'String', num2str(lickCounter));
        guidata(hObject, handles);
        if (lickCounter>=lev.lickThresh & intersect(valveNumber,lev.rewardValve)==valveNumber & ~waterWasGiven)
            %%this is the stage wqe were all waitiing for
            %we check wether:
            %   A.the mouse did enough licks
            %   B. the licks were all done in the specified time window
            %giving water
            wateropen=true;
            
            
            display('water was given')
            time=fix(clock);
            %we open the water for the specified giving period
            x.outputSingleScan([1 0]);
            %pause(lev.waterGivePeriod);
            waterTimer=tic;
            while(toc(waterTimer)<lev.waterGivePeriod && toc(valveTimer)<loggingThresh )
                [samplingTimer dataResults] =LogDataWhenPausing(x,samplingTimer,dataResults,valveTimer);
            end
            x.outputSingleScan([0 0]);
            
            waterWasGiven=true;
            wateropen=false;
            %at the end of water giving we have to make an inter trial
            %interval, is done with the specific function
            insideInterTrial=true;
            %lickCounter=0;
            firsLick=true;
            
            trialInit=false;
            %dataResults=[]
            insideInterTrial=false;
            
        end
    elseif (data(2)==0)
        disconn=true;
    end
    if (valveopen)
        %%here we want to close the olfactometer after 1sec
        
        
        if (toc(valveTimer)>valveOpeningTime)
            olfactometerSetOder(h2, slave, logger, valveNumber, vclose);
            olfactometerSetFinalValve(h2, slave, logger, vclose);
            valveopen=false;
            pause(lev.interTrialInterval/2)
        end
    end
 %   guidata(hObject, handles);
end
lev.currentValve=valveCount
%fuck=lev
%save(str,'fuck');
helpdlg('Thanks for Your participation!')
helpdlg(sprintf('mouse reached trial number: %d out of %d trials',valveCount,lev.numberofTrials));


function [samplingTimer dataResults] =LogDataWhenPausing(x,samplingTimer,dataResults,valveTimer)
data=x.inputSingleScan();
if(toc(samplingTimer)>=0.01)
    dataVec=[data(2); toc(valveTimer) ;data(1)];
    dataResults=[dataResults dataVec];
    samplingTimer=tic;
end

function[waterWasGiven,firsLick...
    lickCounter,trialInit ] =...
    LogResultsWhenPausing(valveCount,valveNumber,lickCounter,waterWasGiven,handles)
global rfid
global lev
global mouseObjects
global str
global statsObjects
global statsData
global logTimer
clck=fix(clock());
timeStamp=sprintf('%d',clck(4:6))
relativeTime=toc(logTimer)
relativeTime=int16(relativeTime)
display('lickcounter zerored')
timeStamp2= str2num(timeStamp)
class(timeStamp2)
if (lickCounter>=lev.lickThresh)
    if(intersect(valveNumber,lev.rewardValve)==valveNumber)
        statsData.hits=statsData.hits+1;
        set(handles.Result, 'String', 'HIT');
        dlmwrite(lev.trialPath,[valveCount,valveNumber,1,0,0,0,timeStamp2,relativeTime],'-append');
    elseif (intersect(valveNumber,lev.noRewardValve)==valveNumber)
        statsData.FA=statsData.FA+1;
        set(handles.Result, 'String', 'FALSE ALARM');
        dlmwrite(lev.trialPath,[valveCount,valveNumber,0,0,1,0,timeStamp2,relativeTime],'-append');
    end
else
    if(intersect(valveNumber,lev.rewardValve)==valveNumber)
       statsData.miss=statsData.miss+1;
        dlmwrite(lev.trialPath,[valveCount,valveNumber,0,1,0,0,timeStamp2,relativeTime],'-append');
        set(handles.Result, 'String', 'MISS');
    elseif (intersect(valveNumber,lev.noRewardValve)==valveNumber)
        statsData.CR=statsData.CR+1;
        set(handles.Result, 'String', 'CORRECT REJECT ');
        dlmwrite(lev.trialPath,[valveCount,valveNumber,0,0,0,1,timeStamp2,relativeTime],'-append');
    end
end
if(waterWasGiven)
    dlmwrite(lev.waterPath,[valveCount 1],'-append');
else
    dlmwrite(lev.waterPath,[valveCount 0],'-append');
end
str=sprintf('%s/%s.mat',lev.mouseName,lev.mouseName)
str2=sprintf('%s/%sStats.mat',lev.mouseName,lev.mouseName)
fuck=lev;
you=statsData;
for k=1:numel(mouseObjects)
    if(strcmp(mouseObjects(k).mouseName,lev.mouseName))
%         display('asdddddddddddddddddddddddddddddddd')
%         k
        mouseObjects(k)=fuck;
         
       statsObjects(k)=you;
        save(str,'fuck')
        save(str2,'you')
    end
end
% save(str,'fuck')

waterWasGiven=false;
firsLick=true;
lickCounter=0;
trialInit=false;

function closeEvs(h2)
for i=2:10
    invoke(h2, 'SetOdorValve', 1, i, 0);
end
invoke(h2, 'SetGateValve2', 1, 31, 0, 0);


% --- Executes during object creation, after setting all properties.
function Licks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Licks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x
x.outputSingleScan(1);
pause(0.3)
x.outputSingleScan(0);
