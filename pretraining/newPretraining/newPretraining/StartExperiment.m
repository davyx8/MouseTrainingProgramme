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

% Last Modified by GUIDE v2.5 23-Feb-2015 17:56:52

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

newPretraining
%ZehBest(handles)
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
closeOlfactometer
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

currLevel=Level;
%path=sprintf('mouse1_%d_%d_%d_%d_%d_%d.csv',fix(clock()));
path=sprintf('mouse1.csv');
%% level 1
%% lickthreshold is zero
%% mouse gets water immideatly

currLevel.successesNeeded=2;
pass=false;
currLevel.timeWindow=inf;
% while(~pass)
%     display( 'Mouse is still on level one');
%     [pass data]=LevelHandler(x,currLevel);
%     level1=ones(size(data,1),1);
%     data=[level1 data];
%     dlmwrite(path,data,'-append');
% end
% 
% 
% % level 2
% % lickthreshold is 2
% % mouse gets water after than
% pass=false;
% currLevel.lickThresh=2;
% currLevel.levelNumber=2;
% while(~pass)
%     display( 'Mouse is still on level two');
%     [pass data]=LevelHandler(x,currLevel);
%     level2=2*ones(size(data,1),1);
%     data=[level2 data];
%     dlmwrite(path,data,'-append');
% end
% 
% % level 3
% % lickthreshold is 3
% 
% 
% currLevel.successesNeeded=5;
% pass=false;
% currLevel.lickThresh=3;
% currLevel.levelNumber=3;
% while(~pass)
%     display( 'Mouse is still on level three');
%     [pass data]=LevelHandler(x,currLevel);
%     level3=3*ones(size(data,1),1);
%     data=[level3 data];
%     dlmwrite(path,data,'-append');
% end

% level 4
% lickthreshold is 4
currLevel.successesNeeded=2;
pass=false;
currLevel.lickThresh=4;
currLevel.interTrialInterval=10;
currLevel.levelNumber=4;
currLevel.timeWindow = 4000;
while(~pass)
    display( 'Mouse is still on level four');
    [pass data]=LevelHandler(x,currLevel);
    level4=4*ones(size(data,1),1);
    data=[level4 data];
    dlmwrite(path,data,'-append');
end


%% level 5
%% lickthreshold is 4
%% odor stimuli is presented in each trial
%% see details in LevelHnadler
% 
% %level 7 starting stimuli
% pass=false;
% currLevel.lickThresh=3;
% currLevel.interTrialInterval=10;
% currLevel.levelNumber=7;
% currLevel.timeWindow = 4000;
% curr.Valve=2;
% pass=false;
% 
% currLevel.successesNeeded=5;
% while(~pass)
%     display( 'Mouse is still on level seven');
%     [pass data]=LevelHandler(x,currLevel);
%         level7=5*ones(size(data,1),1);
%         data=[level7 data];
%         dlmwrite(path,data,'-append');
% end

display('the end')
function [passed dataResults] = LevelHandler(dev,lev)
wateropen = false;
x=dev;
currTrials=0;
headIn=false;
successCount=0;
missCount=0;
insideInterTrial=false;
trialNumber=1;
attempts=0;
firsLick=true;
firstBeam=true;
dataResults=[];
vopen=1;
vclose=0;
slave=1;

passed=false;
valves=[2];
randomValves=valves(randperm(length(valves)));
valveNumber=randomValves(1);
valveCount=1;
delay=0.5;
lickCounter=0;
disconn=true;
trialInit=true;
valveopen=false;
breaking=false;
waterWasGiven=false;
if(lev.levelNumber>3)
    %%only in levels 7-8 we want to initialize olfactometer
    %% we are opening and closing just proper initialization
    %%so olf. will be ready for action
    traileID=sprintf('pelegLOG_%d_%d_%d_%d_%d_%d.csv',fix(clock()));
    logger = Logger(traileID,...
        @(h2) invoke(h2, 'SetDigOut', 1 ,1 ,0),...
        @(h2) invoke(h2, 'SetDigOut', 1 ,0 ,0));
    [ h2, resultOpen, resultLastError, resultID]= olfactometerConnect(logger);
    olfactometerSetOder(h2, slave, logger, 2, vopen);
    olfactometerSetFinalValve(h2, slave, logger, vopen);
    olfactometerSetOder(h2, slave, logger, 2, vclose);
    olfactometerSetFinalValve(h2, slave, logger, vclose);
end
while (true)
    if(insideInterTrial)
        continue
    end
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
        display('beam was broken')
        time=fix(clock);
        display(lickCounter)
        if (lev.levelNumber>6 && ~valveopen)
            % if we are in levels 7-8 we open the desired valve
            % and final valve (with specified delay)
            %notice that of the valve is alreday open we dont get in here
            olfactometerSetOder(h2, slave, logger, valveNumber, vopen);
            activePause(delay, logger, h2, slave);
            olfactometerSetFinalValve(h2, slave, logger, vopen);
            valveCount=valveCount+1;
    
            if(valveCount>=length(valves))
            valveCount=1;
            randomValves=valves(randperm(length(valves)));
            end
            valveNumber=randomValves(valveCount);
            % pause(delay)
            valveTimer=tic;
            valveopen=true;
        elseif (lev.levelNumber==4 )
            olfactometerSetFinalValve(h2, slave, logger, vopen);
            pause(0.3)
            olfactometerSetFinalValve(h2, slave, logger, vclose);
        end
    elseif (data(1)==0 && ~firstBeam)
        %if beam is unbroken (==0) AND beam was broken before  (first beam)
        %if we didnt give water we count it as a miss
        headIn=false;
        if (~waterWasGiven)
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
        waterWasGiven=false;
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
        time=fix(clock);
        display(lickCounter)
        display(sprintf('%d:%d:%d',time(4:6)))
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
            time=fix(clock);
            display(lickCounter)
            %we open the water for the specified giving period
            x.outputSingleScan(1);
            pause(lev.waterGivePeriod);
            %pause(lev.waterGivePeriod)
            x.outputSingleScan(0);
            successCount=successCount+1;
            lickCounter=0;
            waterWasGiven=true;
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
                insideInterTrial=true;
                valveopen = pauseWithOlfactionClosing(valveTimer,h2,logger,valveNumber,lev.interTrialInterval);
                insideInterTrial=false;
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



function valveopen = pauseWithOlfactionClosing(valveTimer,h2,logger,valveNumber,interTrialInterval)
%%this function is an artifical delay in order to close olfactometer during
%%intertrial interval
loopTic=tic;
tmp=true;
while (toc(loopTic)<interTrialInterval)
    
    if (toc(valveTimer)>1 && tmp)
        olfactometerSetOder(h2, 1, logger, valveNumber, 0);
        olfactometerSetFinalValve(h2, 1, logger, 0);
        valveopen=false;
        tmp=false;
    end
end
