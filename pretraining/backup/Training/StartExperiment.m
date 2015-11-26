function varargout = StartExperiment(varargin)
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

% Last Modified by GUIDE v2.5 04-Mar-2015 21:51:05

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
global str
answer = inputdlg('Enter Mouse Name for experiment')
str=sprintf('%s.mat',answer{1})
try
    load(str);
catch err
    obj=levelEntry
end
mouseObj=obj;
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
ZehBest(handles)
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
closeTraining=false;
var={'hit','miss','correct','asd'}
var2=[1:10];
for i=1:100
set(handles.Trial, 'String',num2str(i));
set(handles.Valve, 'String', num2str(var2(mod(i,10)+1)));
set(handles.Result, 'String', var(mod(i,4)+1));
pause(0.01)
end
%closeOlfactometer
%close all
clear all


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


function ZehBest(handles)
global closeTraining
global mouseObj
global str
global x
closeTraining=true;
display('dudeeee')

lev=mouseObj
if (isempty(lev.randomValves))
    randomValves=generateRandOdor(lev.rewardValve,lev.noRewardValve,lev.numberofTrials);
    [a,b]=hist(randomValves,unique(randomValves));
    figure
    bar(b,a)
    valveCount=1;
else
    randomValves=lev.randomValves;
    valveCount=lev.currentValve;
end
x=daq.createSession('ni');
x.IsContinuous = true;
%Beam
x.addDigitalChannel('Dev1','port1/line0' , 'InputOnly');
%Lick
x.addDigitalChannel('Dev1','port1/line1' , 'InputOnly');
% valve 1
x.addDigitalChannel('Dev1','port0/line0' , 'OutputOnly');
% valve 2
% x.addDigitalChannel('Dev1','port0/line1' , 'InputOnly');
% valveopen=false;


% %path=sprintf('mouse1_%d_%d_%d_%d_%d_%d.csv',fix(clock()));
% lev.lickPath=sprintf('mouseTrainingLICKlog.csv');
% lev.trialPath=sprintf('mouseTrainingTRIALLog.csv');
% lev.waterPath=sprintf('mouseTrainingWATERLog.csv');
% lev.lickThresh=3;
% lev.interTrialInterval=10;
% lev.levelNumber=7;
% lev.timeWindow = 4000;
% lev.rewardValve=[1 2 3 4];
% lev.noRewardValve=[5 6 7 8];
%lev.numberOfTrials=160;
%valveOpeningTime=2;
%currTrials=0;
lickTimer=0;
valveTimer=0;
valveOpeningTime=lev.valveOpeningTime;
loggingThresh=2.5;
wateropen = false;
%x=dev;

headIn=false;
%stuff to count


insideInterTrial=false;
attempts=0;
firsLick=true;
firstBeam=true;
dataResults=[];
vopen=1;
vclose=0;
slave=1;



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
while (true & closeTraining)
    if(insideInterTrial)
        continue
    end
    % loop is broken only when successCount>=lev.successesNeeded
    if(valveCount>lev.numberOfTrials)
        break
    end
    %scanning to get data from electronic box
    data=x.inputSingleScan();
    
    dataVec=[];
    %     dataResults=[dataResults;dataVec];
    if(valveTimer~=0)
        if(toc(valveTimer)<loggingThresh)
            if(toc(samplingTimer)>=0.01)
                dataVec=[data(2); toc(valveTimer)];
                dataResults=[dataResults dataVec];
                samplingTimer=tic;
                %             else
                %                 dataVec=data(2);
                %                 dataResults=[dataResults dataVec];
                
            end
        else
            dlmwrite(lev.filePath,dataResults,'-append');
            dataResults=[];
        end
    end
    if (data(1)==1 && ~headIn)
        
        if( valveTimer==0 || toc(valveTimer)>lev.interTrialInterval)
            % we get here when beam (data(1)) is broken AND it wasnt already
            % broken before (headIn)
            %we increase the number of trials every time beam is re-broken
            currTrials=currTrials+1;
            headIn=true;
            firstBeam=false;
            time=fix(clock);
            if(~valveopen)
                % if we are in levels 7-8 we open the desired valve
                % and final valve (with specified delay)
                %notice that of the valve is alreday open we dont get in here
                set(handles.Trials, 'String', num2str(valveCount));
                valveNumber=randomValves(valveCount);
                set(handles.Valve, 'String', num2str(valveNumber));
                if(intersect(valveNumber,lev.rewardValve)==valveNumber)
                set(handles.Reward, 'String', 'Rewarded');
                else
                    set(handles.Reward, 'String', 'Not Rewarded');
                end
                olfactometerSetOder(h2, slave, logger, valveNumber, vopen);
                % activePause(delay, logger, h2, slave);
                openingTimer=tic;
                while(delay-toc(openingTimer) > 0.009)
                    [samplingTimer dataResults] =...
                        LogDataWhenPausing(x,samplingTimer,dataResults,valveTimer);
                end
                olfactometerSetFinalValve(h2, slave, logger, vopen);
                valveCount=valveCount+1;
                
                % pause(delay)
                valveTimer=tic;
                %while(toc(valveTimer)<0.2)
                samplingTimer=tic;
                %end
                valveopen=true;
            end
        end
    elseif (data(1)==0 && ~firstBeam)
        %if beam is unbroken (==0) AND beam was broken before  (first beam)
        %if we didnt give water we count it as a miss
        headIn=false;
        if (~waterWasGiven)
            if(intersect(valveNumber,lev.rewardValve)==valveNumber)
                missCount=missCount+1;
            elseif (intersect(valveNumber,lev.noRewardValve)==valveNumber)
                crCount=crCount+1;
            end
            
        end
        %we want to signal that a trial has been re-initiated
        trialInit=true;
        %   lickCounter=0;
        %we save the data from this trial to the vector
        % and add it to the data results
    end
    
    if (data(2)==1 && ~wateropen && disconn && trialInit && toc(valveTimer)<lev.interTrialInterval)
        %here we check if lick was preformed AND THAT:
        %~wateropen- water ISNT open
        %disconn -the mouse disconnected the tongue completly
        %so as not to count continous engagements as one lick
        %trial has been reinitialized after time window passed
        %see below
        
        
        
        %display(lev.levelNumber)
        disconn=false;
        lickCounter=lickCounter+1;
        time=fix(clock);
%         display(lickCounter)
%         display(sprintf('%d:%d:%d',time(4:6)))

        if firsLick
            %if this is the first lick in the trial we want to start the
            %clock for the time window (to ocunt the licks)
            
            lickTimer=tic;
            firsLick=false;
        end
        if (lickCounter>=lev.lickThresh & toc(lickTimer)<=lev.timeWindow & intersect(valveNumber,lev.rewardValve)==valveNumber)
            %%this is the stage wqe were all waitiing for
            %we check wether:
            %   A.the mouse did enough licks
            %   B. the licks were all done in the specified time window
            %giving water
            wateropen=true;
            
            
            display('water was given')
            time=fix(clock);
            display(lickCounter)
            %we open the water for the specified giving period
            x.outputSingleScan(1);
            %pause(lev.waterGivePeriod);
            waterTimer=tic;
            while(toc(waterTimer)<lev.waterGivePeriod)
                [samplingTimer dataResults] =LogDataWhenPausing(x,samplingTimer,dataResults,valveTimer)
            end
            x.outputSingleScan(0);
            successCount=successCount+1;
            lickCounter=0;
            waterWasGiven=true;
            wateropen=false;
            %at the end of water giving we have to make an inter trial
            %interval, is done with the specific function
            insideInterTrial=true;
            valveopen = pauseWithOlfactionClosing(valveTimer,h2,logger,...
                valveNumber,lev.interTrialInterval-toc(valveTimer),valveOpeningTime,lev,dataResults);
            waterWasGiven=false;
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
        clockVec=fix(clock());
        timeData=sprintf('%d:%d:%d',clockVec(4:6));
        
        attempts=0;
        
        if (toc(valveTimer)>valveOpeningTime)
            olfactometerSetOder(h2, slave, logger, valveNumber, vclose);
            olfactometerSetFinalValve(h2, slave, logger, vclose);
            valveopen=false;
            
            %we pause for two seconds after closing
            %  pause(2)
        end
    end
    if(~firsLick)
        %we want to reinit the trial in case the time window passed
        % we also want to zero the lickcounter
        %also make sure the firstlick is set to true
        if (toc(lickTimer) >lev.timeWindow)
            [waterWasGiven,firsLick,lickCounter,trialInit ] =...
                LogResultsWhenPausing(lev,valveCount,valveNumber,lickCounter,waterWasGiven);
        end
    end
end
lev.currentValve=valveCount;
obj=lev;
save('%s.mat',str);
helpdlg('Thanks for Your participation!')
helpdlg(sprintf('mouse reached trial number: %d out of %d trials',valveCount,lev.numberofTrials));


function valveopen = pauseWithOlfactionClosing(valveTimer,h2,logger,valveNumber,...
    interTrialInterval,valveOpeningTime,lev,dataResults,lickTimer,valveCount);
%%this function is an artifical delay in order to close olfactometer during
%%intertrial interval
loopTic=tic;
tmp=true;

while (toc(loopTic)<interTrialInterval)
    if (toc(valveTimer)>valveOpeningTime && tmp)
        olfactometerSetOder(h2, 1, logger, valveNumber, 0);
        olfactometerSetFinalValve(h2, 1, logger, 0);
        valveopen=false;
        dlmwrite(lev.filePath,dataResults,'-append');
        tmp=false;
    end
    
    if (toc(lickTimer) >lev.timeWindow)
        [waterWasGiven,firsLick,lickCounter,trialInit ] =...
            LogResultsWhenPausing(lev,valveCount,valveNumber,lev.lickThresh,true);
    end
end

function [samplingTimer dataResults] =LogDataWhenPausing(x,samplingTimer,dataResults,valveTimer)
data=x.inputSingleScan();
if(toc(samplingTimer)>=0.01)
    dataVec=[data(2); toc(valveTimer)];
    dataResults=[dataResults dataVec];
    samplingTimer=tic;
end

function[waterWasGiven,firsLick...
    lickCounter,trialInit ] =...
    LogResultsWhenPausing(lev,valveCount,valveNumber,lickCounter,waterWasGiven)

display('lickcounter zerored')
if (lickCounter>=lev.lickThresh)
    if(intersect(valveNumber,lev.rewardValve)==valveNumber)
        set(handles.Result, 'String', 'HIT');
        dlmwrite(lev.filePath,[valveCount,valveNumber,1,0,0,0],'-append');
    elseif (intersect(valveNumber,lev.noRewardValve)==valveNumber)
        set(handles.Result, 'String', 'FALSE ALARM');
        dlmwrite(lev.filePath,[valveCount,valveNumber,0,0,1,0],'-append');
    end
else
    if(intersect(valveNumber,lev.rewardValve)==valveNumber)
        dlmwrite(lev.filePath,[valveCount,valveNumber,0,1,0,0],'-append');
        set(handles.Result, 'String', 'MISS');
    elseif (intersect(valveNumber,lev.noRewardValve)==valveNumber)
        set(handles.Result, 'String', 'CORRECT REJECT ');
        dlmwrite(lev.filePath,[valveCount,valveNumber,0,0,0,1],'-append');
    end
end
if(waterWasGiven)
    dlmwrite(lev.waterPath,[valveCount 1],'-append');
else
    dlmwrite(lev.waterPath,[valveCount 0],'-append');
end
waterWasGiven=false;
firsLick=true;
lickCounter=0;
trialInit=false;


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
