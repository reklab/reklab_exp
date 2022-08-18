function varargout = GUIcode4v2(varargin)
%GUIcode3 M-file for GUIcode3.fig
%      GUIcode3, by itself, creates a new GUIcode3 or raises the existing
%      singleton*.
%
%      H = GUIcode3 returns the handle to a new GUIcode3 or the handle to
%      the existing singleton*.
%
%      GUIcode3('Property','Value',...) creates a new GUIcode3 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUIcode3_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUIcode3('CALLBACK') and GUIcode3('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUIcode3.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIcode3

% Last Modified by GUIDE v2.5 08-Dec-2015 14:20:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUIcode3_OpeningFcn, ...
    'gui_OutputFcn',  @GUIcode3_OutputFcn, ...
    'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUIcode3 is made visible.
function GUIcode3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
global TG
Leftstat = getparam(TG,getparamid(TG,'Leftonoff','Value'));
set(handles.leftonoff,'Value',Leftstat);

Rightstat = getparam(TG,getparamid(TG,'Rightonoff','Value'));
set(handles.rightonoff,'Value',Rightstat);

Leftoffsetstat = getparam(TG, getparamid(TG,'Left Position Offset','Value'));
set(handles.leftpedaloffset,'string',Leftoffsetstat);

Rightoffsetstat = getparam(TG,getparamid(TG,'Right Position Offset','Value'));
set(handles.rightpedaloffset,'string',Rightoffsetstat);

%Plotting Axis
set(handles.leftin,'visible','off');
set(handles.rightin,'visible','off');
set(handles.plotterL,'visible','off');
set(handles.plotterR,'visible','off');

%%Get input switch value and display selected radio button

%Left Pedal
Inputleftval = getparam(TG,getparamid(TG,'InputLeft','Value'));
if Inputleftval == 1
    % 'BuffInL' is selected
    set(handles.BuffInL,'Value',1);
    
    
elseif Inputleftval == 2
    % 'ZeroInL is selected
    set(handles.ZeroInL,'Value',1);
    
elseif Inputleftval == 3
    % PulseSeqIn is selected
    set(handles.PulseInL,'Value',1);
    set(handles.PulseSeqL,'visible','on');
elseif Inputleftval == 4
    set(handles.PRBSL,'Value',1);
    set(handles.PRBSeqL,'visible','on');
elseif Inputleftval == 5
    set(handles.SineL,'Value',1);
    set(handles.SINESeqL,'visible','on');
elseif Inputleftval == 6
    set(handles.PRMSL,'Value',1);
    set(handles.PRMSSeqL,'visible','on');
elseif Inputleftval == 7
    set(handles.squarewaveL,'Value',1);
    set(handles.SquareSeqL,'visible','on');
elseif Inputleftval == 8
    set(handles.sawtoothwaveL,'Value',1);
    set(handles.SawSeqL,'visible','on');
else
    set(handles.InputpanelL,'SelectedObject',[]);
    errordlg('No inputs selected for Left Pedal','Bad Input','modal') ;
end

%Right Pedal
Inputrightval = getparam(TG, getparamid(TG,'InputRight','Value'));
if Inputrightval == 1
    % 'BuffInR' is selected
    set(handles.BuffInR,'Value',1);
    %     set(handles.OppDirection,'visible','off')
elseif Inputrightval == 2
    % Same is selected
    set(handles.Same,'Value',1)  ;
    set(handles.OppDirection,'visible','on');
elseif Inputrightval == 3
    % 'ZeroInL is selected
    set(handles.ZeroInR,'Value',1);
    %     set(handles.OppDirection,'visible','off')
elseif Inputrightval == 4
    % PulseSeqIn is selected
    set(handles.PulseInR,'Value',1);
    %     set(handles.OppDirection,'visible','off')
    set(handles.PulseSeqR,'visible','on');
elseif Inputrightval == 5
    set(handles.PRBSR,'Value',1);
    set(handles.PRBSeqR,'visible','on');
elseif Inputrightval ==6
    set(handles.SIineR,'Value',1);
    set(handles.SINESeqR,'visible','on');
elseif Inputrightval == 7
    set(handles.PRMSR,'Value',1);
    set(handles.PRMSSeqR,'visible','on');
else
    set(handles.InputpanelR,'SelectedObject',[]);
    %     set(handles.OppDirection,'visible','off')
    errordlg('No inputs selected for Right Pedal','Bad Input','modal') ;
end

% target = getparam(TG, getparamid(TG,'Targetswitch','Value'));
% if target == 1
%     set(handles.both,'Value',1);
% elseif target == 2
%     set(handles.left,'Value',1);
% elseif target == 3
%     set(handles.left,'Value',1);
% else
%     set(handles.renshaw,'SelectedObject',[]);
%     errordlg('No signal to display on Renshaw is selected','Bad Input','modal');
% end

%


% Choose default command line output for GUIcode3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIcode3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIcode3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%%%Try and get trial name from EXP_GUI
function trialname_Callback(hObject, eventdata, handles)
% hObject    handle to trialname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trialname as text
%        str2double(get(hObject,'String')) returns contents of trialname as a double


% --- Executes during object creation, after setting all properties.
function trialname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trialname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','Subject_DAMOYR');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in OppDirection.
function OppDirection_Callback(hObject, eventdata, handles)
% hObject    handle to OppDirection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG

if get(handles.Same,'Value') == get(handles.Same,'Max')
    
    if (get(hObject,'Value') == get(hObject,'Min'))
        setparam(TG, getparamid(TG, 'Actuator Inversion', 'Gain'), 1);
        set(hObject,'BackgroundColor',get(hObject,'UserData'));
        
    else
        setparam(TG,getparamid(TG,'Actuator Inversion','Gain'),-1);
        set(hObject,'BackgroundColor','magenta');
    end
else
    set(hObject,'Value',get(hObject,'Min'));
    setparam(TG,getparamid(TG,'Actuator Inversion','Gain'),1);
    errordlg('You must select same inputs for left and right pedals','Bad Input','modal') ;
    
end



%%Turn only left on
% --- Executes on button press in leftonoff.
function leftonoff_Callback(hObject, eventdata, handles)
% hObject    handle to leftonoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
if get(hObject,'Value') == get(hObject,'Max')
    setparam(TG,getparamid(TG,'Leftonoff','Value'),1);
    set(handles.meanL,'String',num2str(getsignal(TG,getsignalid(TG,'TorqueChecker/Runningmean/Left Mean'))))
else
    setparam(TG, getparamid(TG,'Leftonoff','Value'),0);
    set(handles.meanL,'String','0')
end

%%Turn right on only
% --- Executes on button press in rightonoff.
function rightonoff_Callback(hObject, eventdata, handles)
% hObject    handle to rightonoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
if get(hObject,'Value') == get(hObject,'Max')
    setparam(TG,getparamid(TG,'Rightonoff','Value'),1);
    set(handles.meanR,'String',num2str(getsignal(TG,getsignalid(TG,'TorqueChecker/Runningmean/Right Mean'))))
else
    setparam(TG,getparamid(TG,'Rightonoff','Value'),0);
    set(handles.meanR,'String','0')
end
% Hint: get(hObject,'Value') returns toggle state of rightonoff



function leftpedaloffset_Callback(hObject, eventdata, handles)
% hObject    handle to leftpedaloffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
%%Test out first
setparam(TG,getparamid(TG,'Left Position Offset','Value'),str2double(get(hObject,'string')));



function rightpedaloffset_Callback(hObject, eventdata, handles)
% hObject    handle to rightpedaloffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'Right Position Offset','Value'),str2double(get(hObject,'string')));


% Might not work


% --- Executes on button press in Lplot.
function Lplot_Callback(hObject, eventdata, handles)
% hObject    handle to Lplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG

ca = get(handles.popupmenu5,'UserData');
real = (get(handles.popupmenu6,'value'))-1;
data = ca;

if real>0
    
    val = get(handles.popupmenu3,'Value');
    string_list = get(handles.popupmenu3,'String');
    selected_string = string_list(val,:);
    
    if strcmp(selected_string,'L.COP ')
        L1 = data.Data(:,end-7,real);
        L2 = data.Data(:,end-6,real);
        L3 = data.Data(:,end-5,real);
        L4 = data.Data(:,end-4,real);
        Ftot = L1+L2+L3+L4;
        COPx = (50*L1 - 50*L2 -50*L3 +50*L4)./Ftot;
        COPy = (145*L1 + 145*L2 - 145*L3 - 145*L4)./Ftot;
        x = COPx;
        y = COPy;
    elseif strcmp(selected_string,'R.COP ')
        R1 = data.Data(:,end-3,real);
        R2 = data.Data(:,end-2,real);
        R3 = data.Data(:,end-1,real);
        R4 = data.Data(:,end,real);
        Ftot = R1+R2+R3+R4;
        COPx = (50*R1 - 50*R2 -50*R3 +50*R4)./Ftot;
        COPy = (145*R1 + 145*R2 - 145*R3 - 145*R4)./Ftot;
        x = COPx;
        y = COPy;
    elseif strcmp(selected_string, 'L.Velo')
        POS = nldat(data.Data(:,1));
        VEL = ddt(POS);
        x = [0.001:0.001:length(POS)/1000]';
        y = VEL.Data;
    elseif strcmp(selected_string, 'R.Velo')
        POS = nldat(data.Data(:,3));
        VEL = ddt(POS);
        x = [0.001:0.001:length(POS)/1000]';
        y = VEL.Data;
    else
        errordlg('You must select a plot type','Bad Input','modal')
    end
    
    
    
    
    % t = (0:0.001:(length(leftdes)*0.001))';
    plot(handles.leftin,x,y)
    sig = [x y];
    set(handles.leftin,'UserData',sig);
else
    errordlg('You must select a realization number','Bad Input','modal')
end





% --- Executes when selected object is changed in InputpanelL.
function InputpanelL_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in InputpanelL
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'BuffInL'
        % Code for when Buffer is selected
        setparam(TG, getparamid(TG,'InputLeft','Value'),1);
        set(handles.PulseSeqL,'visible','off');
        set(handles.PRBSeqL,'visible','off');
        set(handles.SINESeqL,'visible','off');
        set(handles.PRMSSeqL,'visible','off');
        set(handles.SquareSeqL,'visible','off');
        set(handles.SawSeqL,'visible','off');
    case 'ZeroInL'
        % Code for when Zero is selected.
        setparam(TG,getparamid(TG,'InputLeft','Value'),2);
        set(handles.PulseSeqL,'visible','off');
        set(handles.PRBSeqL,'visible','off');
        set(handles.SINESeqL,'visible','off');
        set(handles.PRMSSeqL,'visible','off');
        set(handles.SquareSeqL,'visible','off');
        set(handles.SawSeqL,'visible','off');
        
    case 'PulseInL'
        % Code for when Pulse Sequence is selected.
        setparam(TG,getparamid(TG,'InputLeft','Value'),3);
        set(handles.PulseSeqL,'visible','on');
        set(handles.PulseAmpL,'string',(getparam(TG,getparamid(TG,'PulseAmpL','Gain'))));
        set(handles.PulseWidthL,'string',(getparam(TG,getparamid(TG,'Pulse Sequence/PulseWidthL/N-Sample Enable','TARGETCNT'))));
        set(handles.MaxPulseIntL,'string',(getparam(TG,getparamid(TG,'Pulse Sequence/Pause Interval','Maximum'))));
        set(handles.PRBSeqL,'visible','off');
        set(handles.SINESeqL,'visible','off');
        set(handles.PRMSSEQL,'visible','off')
        set(handles.SquareSeqL,'visible','off');
        set(handles.SawSeqL,'visible','off');
    case 'PRBSL'
        %Code for when PRBS is selected
        setparam(TG, getparamid(TG,'InputLeft','Value'),4);
        set(handles.PulseSeqL,'visible','off');
        set(handles.PRBSeqL,'visible','on');
        set(handles.PRBSampL,'string',(getparam(TG,getparamid(TG,'Left PRBS/PRBS_Amp1','Gain'))));
        set(handles.SINESeqL,'visible','off');
        set(handles.PRMSSeqL,'visible','off');
        set(handles.SquareSeqL,'visible','off');
        set(handles.SawSeqL,'visible','off');
        %             set(handles.PRBSswitchL,'SelectedObject',[]);
        switchrate = getparam(TG,getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Minimum'));
        if switchrate == 100;
            set(handles.OneHundredL,'Value',get(handles.OneHundredL,'Max'));
        elseif switchrate == 150;
            set(handles.OneHundredFiftyL,'Value',get(handles.OneHundredFiftyL,'Max'));
        elseif switchrate == 200;
            set(handles.TwoHundredL,'Value',get(handles.TwoHundredL,'Max'));
        elseif switchrate == 300;
            set(handles.ThreeHundredL,'Value',get(handles.ThreeHundredL,'Max'));
        elseif switchrate == 400;
            set(handles.FourHundredL,'Value',get(handles.FourHundredL,'Max'));
        elseif switchrate == 500;
            set(handles.FiveHundredL,'Value',get(handles.FiveHundredL,'Max'));
        end
    case 'SineL'
        setparam(TG, getparamid(TG,'InputLeft','Value'),5);
        set(handles.PulseSeqL,'visible','off');
        set(handles.PRBSeqL,'visible','off');
        set(handles.SINESeqL,'visible','on');
        set(handles.PRMSSeqL,'visible','off');
        set(handles.SquareSeqL,'visible','off');
        set(handles.SawSeqL,'visible','off');
        set(handles.SineAmpL,'string',num2str(getparam(TG,getparamid(TG,'SineWaveL/SineAmp','Gain'))));
        freqrate = getparam(TG,getparamid(TG,'SineWaveL/SineSwitch','Value'));
        if freqrate == 1;
            set(handles.FreqLhalf,'Value',get(handles.FreqLhalf,'Max'));
        elseif freqrate == 2;
            set(handles.FreqLone,'Value',get(handles.FreqLone,'Max'));
        elseif freqrate == 3;
            set(handles.FreqLtwo,'Value',get(handles.FreqLtwo,'Max'));
        elseif freqrate == 4;
            set(handles.FreqLfive,'Value',get(handles.FreqLfive,'Max'));
        elseif freqrate == 5;
            set(handles.FreqLten,'Value',get(handles.FreqLten,'Max'));
        elseif freqrate == 6
            set(handles.FreqLtenth,'Value',get(handles.FreqLtenth,'Max'));
        end
    case 'PRMSL'
        setparam(TG, getparamid(TG,'InputLeft','Value'),6);
        set(handles.PulseSeqL,'visible','off');
        set(handles.PRBSeqL,'visible','off');
        set(handles.PRMSampL,'string',(getparam(TG,getparamid(TG,'Left PRMS/PRMS_Amp','Gain'))));
        set(handles.SINESeqL,'visible','off');
        set(handles.PRMSSeqL,'visible','on');
        set(handles.SquareSeqL,'visible','off');
        set(handles.SawSeqL,'visible','off');
        switchrate = getparam(TG,getparamid(TG,'Left PRMS/PRMS switch','Value'));
        if switchrate == 1;
            set(handles.MSOneHundredL,'Value',get(handles.MSOneHundredL,'Max'));
        elseif switchrate == 2;
            set(handles.MSOneHundredFiftyL,'Value',get(handles.MSOneHundredFiftyL,'Max'));
        elseif switchrate == 3;
            set(handles.MSTwoHundredL,'Value',get(handles.MSTwoHundredL,'Max'));
        elseif switchrate == 4;
            set(handles.MSThreeHundredL,'Value',get(handles.MSThreeHundredL,'Max'));
        elseif switchrate == 5;
            set(handles.MSFourHundredL,'Value',get(handles.MSFourHundredL,'Max'));
        elseif switchrate == 6;
            set(handles.MSFiveHundredL,'Value',get(handles.MSFiveHundredL,'Max'));
        end
    case 'squarewaveL'
        setparam(TG, getparamid(TG,'InputLeft','Value'),7);
        set(handles.PulseSeqL,'visible','off');
        set(handles.PRBSeqL,'visible','off');
        set(handles.SINESeqL,'visible','off');
        set(handles.PRMSSeqL,'visible','off');
        set(handles.SquareSeqL,'visible','on');
        set(handles.SawSeqL,'visible','off');
        set(handles.SquareAmpL,'string',num2str(getparam(TG,getparamid(TG,'L Square/SquareAmp','Gain'))));
        freqrate = getparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'));
        if freqrate == 1;
            set(handles.Lsquarefreq1,'Value',get(handles.Lsquarefreq1,'Max'));
        elseif freqrate == 2;
            set(handles.Lsquarefreq2,'Value',get(handles.Lsquarefreq2,'Max'));
        elseif freqrate == 3;
            set(handles.Lsquarefreq3,'Value',get(handles.Lsquarefreq3,'Max'));
        elseif freqrate == 4;
            set(handles.Lsquarefreq4,'Value',get(handles.Lsquarefreq4,'Max'));
        elseif freqrate == 5;
            set(handles.Lsquarefreq5,'Value',get(handles.Lsquarefreq5,'Max'));
        elseif freqrate == 6
            set(handles.Lsquarefreq6,'Value',get(handles.Lsquarefreq6,'Max'));
        elseif freqrate == 7
            set(handles.Lsquarefreq7,'Value',get(handles.Lsquarefreq7,'Max'));
        elseif freqrate == 8
            set(handles.Lsquarefreq8,'Value',get(handles.Lsquarefreq8,'Max'));
        elseif freqrate == 9
            set(handles.Lsquarefreq9,'Value',get(handles.Lsquarefreq9,'Max'));
        elseif freqrate == 10
            set(handles.Lsquarefreq10,'Value',get(handles.Lsquarefreq10,'Max'));
        end
        
    case 'sawtoothwaveL'
        setparam(TG, getparamid(TG,'InputLeft','Value'),8);
        set(handles.PulseSeqL,'visible','off');
        set(handles.PRBSeqL,'visible','off');
        set(handles.SINESeqL,'visible','off');
        set(handles.PRMSSeqL,'visible','off');
        set(handles.SquareSeqL,'visible','off');
        set(handles.SawSeqL,'visible','on');
        set(handles.SawAmpL,'string',num2str(getparam(TG,getparamid(TG,'L Sawtooth/SawtoothAmp','Gain'))));
        ramplength = getparam(TG,getparamid(TG,'L Sawtooth/SawtoothSwitch','Value'));
        if ramplength == 1;
            set(handles.Lsawlength1,'Value',get(handles.Lsawlength1,'Max'));
        elseif ramplength == 2;
            set(handles.Lsawlength2,'Value',get(handles.Lsawlength2,'Max'));
        elseif ramplength == 3;
            set(handles.Lsawlength3,'Value',get(handles.Lsawlength3,'Max'));
        elseif ramplength == 4;
            set(handles.Lsawlength4,'Value',get(handles.Lsawlength4,'Max'));
        elseif ramplength == 5;
            set(handles.Lsawlength5,'Value',get(handles.Lsawlength5,'Max'));
        end      
    otherwise
        errordlg('You must select a Left Pedal input type','Bad Input','modal')
        % Code for when there is no match
end


% --- Executes during object creation, after setting all properties.
function PulseSeqL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PulseSeqL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
if getparam(TG,getparamid(TG,'InputLeft','Value')) == 3
    set(hObject,'visible','on');
else
    set(hObject,'visible','off');
end

function PulseAmpL_Callback(hObject, eventdata, handles)
% hObject    handle to PulseAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    
    
    %elseif user_entry > 0.02
    %    errordlg('Pulse Amplitude Exceeds Maximum Limits','Bad Input','modal')
    
else
    setparam(TG,getparamid(TG,'PulseAmpL','Gain'),str2double(get(hObject,'string')))
    
end
% --- Executes during object creation, after setting all properties.
function PulseAmpL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PulseAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global TG
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject,'string', num2str(getparam(TG,getparamid(TG,'PulseAmpL','Gain'))));


function PulseWidthL_Callback(hObject, eventdata, handles)
% hObject    handle to PulseWidthL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
oldwidth = get(hObject,'UserData');
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
else
    NewPulseWidth = str2double(get(hObject,'string'));
    setparam(TG,getparamid(TG,'Pulse Sequence/PulseWidthL/N-Sample Enable','TARGETCNT'),NewPulseWidth);
    setparam(TG,getparamid(TG,'Pulse Sequence/Pause Interval','Minimum'),5000+NewPulseWidth);
    oldmax = getparam(TG,getparamid(TG,'Pulse Sequence/Pause Interval','Maximum'));
    %setparam(TG,getparamid(TG,'Pulse Sequence/Pause Interval','Maximum'),(abs(oldmax-oldwidth)+ NewPulseWidth));
end
set(hObject,'UserData',NewPulseWidth);

% --- Executes during object creation, after setting all properties.
function PulseWidthL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PulseWidthL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
PulseWidth = num2str(getparam(TG, getparamid(TG,'Pulse Sequence/PulseWidthL/N-Sample Enable','TARGETCNT')));
set(hObject,'string',PulseWidth)
set(hObject,'UserData',get(hObject,'string'))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MaxPulseIntL_Callback(hObject, eventdata, handles)
% hObject    handle to MaxPulseIntL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
else
    setparam(TG,getparamid(TG,'Pulse Sequence/Pause Interval','Maximum'),str2double(get(hObject,'string')))
end


% --- Executes during object creation, after setting all properties.
function MaxPulseIntL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxPulseIntL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global TG
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

MaxPulseInt = num2str(getparam(TG,getparamid(TG,'Pulse Sequence/Pause Interval','Maximum')));
set(hObject,'string',MaxPulseInt)




%%Doesn't work yet
% --- Executes on button press in Rplot.
function Rplot_Callback(hObject, eventdata, handles)
% hObject    handle to Rplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG

ca = get(handles.popupmenu8,'UserData');
real = (get(handles.popupmenu7,'value'))-1;
data = ca;

if real>0
    
    val = get(handles.popupmenu4,'Value');
    string_list = get(handles.popupmenu3,'String');
    selected_string = string_list(val,:);
    
    if strcmp(selected_string,'L.COP ')
        L1 = data.Data(:,end-7,real)*4.536;
        L2 = data.Data(:,end-6,real)*4.536;
        L3 = data.Data(:,end-5,real)*4.536;
        L4 = data.Data(:,end-4,real)*4.536;
        Ftot = L1+L2+L3+L4;
        COPx = (50*L1 - 50*L2 -50*L3 +50*L4)./Ftot;
        COPy = (145*L1 + 145*L2 - 145*L3 - 145*L4)./Ftot;
        x = COPx;
        y = COPy;
    elseif strcmp(selected_string,'R.COP ')
        R1 = data.Data(:,end-3,real);
        R2 = data.Data(:,end-2,real);
        R3 = data.Data(:,end-1,real);
        R4 = data.Data(:,end,real);
        Ftot = R1+R2+R3+R4;
        COPx = (50*R1 - 50*R2 -50*R3 +50*R4)./Ftot;
        COPy = (145*R1 + 145*R2 - 145*R3 - 145*R4)./Ftot;
        x = COPx;
        y = COPy;
    elseif strcmp(selected_string, 'L.Velo')
        POS = nldat(data.Data(:,1));
        VEL = ddt(POS);
        x = [0.001:0.001:length(POS)/1000]';
        y = VEL.Data;
    elseif strcmp(selected_string, 'R.Velo')
        POS = nldat(data.Data(:,3));
        VEL = ddt(POS);
        x = [0.001:0.001:length(POS)/1000]';
        y = VEL.Data;
    else
        errordlg('You must select a plot type','Bad Input','modal')
    end
    
    % t = (0:0.001:(length(leftdes)*0.001))';
    plot(handles.rightin,x,y)
    sig = [x y];
    set(handles.rightin,'UserData',sig);
else
    errordlg('You must select a realization number','Bad Input','modal')
end





% --- Executes when selected object is changed in InputpanelR.
function InputpanelR_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in InputpanelR
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'BuffInR'
        % Code for when Buffer is selected
        setparam(TG,getparamid(TG,'InputRight','Value'),1);
        set(handles.PulseSeqR,'visible','off');
        set(handles.OppDirection,'visible','off');
        set(handles.PRBSeqR,'visible','off');
        set(handles.SINESeqR,'visible','off');
        set(handles.PRMSSeqR,'visible','off');
    case 'Same'
        % Code for when Same is selected.
        setparam(TG,getparamid(TG,'InputRight','Value'),2);
        set(handles.OppDirection,'visible','on');
        set(handles.PRBSeqR,'visible','off') ;   %Look at set-up on left
        set(handles.PulseSeqR,'visible','off');  %Look at set-up on left
        set(handles.SINESeqR,'visible','off');   %Look at set-up on left
        set(handles.PRMSSeqR,'visible','off');
    case 'ZeroInR'
        % Code for when Zero is selected.
        setparam(TG,getparamid(TG,'InputRight','Value'),3);
        set(handles.PulseSeqR,'visible','off');
        set(handles.OppDirection,'visible','off');
        set(handles.PRBSeqR,'visible','off');
        set(handles.SINESeqR,'visible','off');
        set(handles.PRMSSeqR,'visible','off');
    case 'PulseInR'
        % Code for when Pulse is selected.
        setparam(TG,getparamid(TG,'InputRight','Value'),4);
        set(handles.PulseSeqR,'visible','on');
        set(handles.PulseAmpR,'string',(getparam(TG,getparamid(TG,'PulseAmpR','Gain'))));
        set(handles.PulseWidthR,'string',(getparam(TG,getparamid(TG,'Pulse Sequence1/PulseWidthR/N-Sample Enable','TARGETCNT'))));
        set(handles.MaxPulseIntR,'string',(getparam(TG,getparamid(TG,'Pulse Sequence1/Pause Interval','Maximum'))));
        set(handles.OppDirection,'visible','off');
        set(handles.PRBSeqR,'visible','off');
        set(handles.SINESeqR,'visible','off');
        set(handles.PRMSSeqR,'visible','off');
    case 'PRBSR'
        %Code for when PRBS is selected
        setparam(TG, getparamid(TG,'InputRight','Value'),5);
        set(handles.PRBSeqR,'visible','on');
        set(handles.OppDirection,'visible','off');
        set(handles.PulseSeqR,'visible','off');
        set(handles.PRBSampR,'string',(getparam(TG,getparamid(TG,'Right PRBS/PRBS_Amp2','Gain'))));
        set(handles.SINESeqR,'visible','off');
        set(handles.PRMSSeqR,'visible','off');
        
        switchrate = getparam(TG,getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Minimum'));
        if switchrate == 100;
            set(handles.OneHundredR,'Value',get(handles.OneHundredR,'Max'));
        elseif switchrate == 150;
            set(handles.OneHundredFiftyR,'Value',get(handles.OneHundredFiftyR,'Max'));
        elseif switchrate == 200;
            set(handles.TwoHundredR,'Value',get(handles.TwoHundredR,'Max'));
        elseif switchrate == 300;
            set(handles.ThreeHundredR,'Value',get(handles.ThreeHundredR,'Max'));
        elseif switchrate == 400;
            set(handles.FourHundredR,'Value',get(handles.FourHundredR,'Max'));
        elseif switchrate == 500;
            set(handles.FiveHundredR,'Value',get(handles.FiveHundredR,'Max'));
        end
    case 'SineR'
        setparam(TG, getparamid(TG,'InputRight','Value'),6);
        set(handles.PulseSeqR,'visible','off');
        set(handles.PRBSeqR,'visible','off');
        set(handles.SINESeqR,'visible','on');
        set(handles.PRMSSeqR,'visible','off');
        set(handles.SineAmpR,'string',num2str(getparam(TG,getparamid(TG,'SineWaveR/SineAmp','Gain'))));
        
        freqrate = getparam(TG,getparamid(TG,'SineWaveR/SineSwitch','Value'));
        if freqrate == 1;
            set(handles.FreqRhalf,'Value',get(handles.FreqRhalf,'Max'));
        elseif freqrate == 2;
            set(handles.FreqRone,'Value',get(handles.FreqRone,'Max'));
        elseif freqrate == 3;
            set(handles.FreqRtwo,'Value',get(handles.FreqRtwo,'Max'));
        elseif freqrate == 4;
            set(handles.FreqRfive,'Value',get(handles.FreqRfive,'Max'));
        elseif freqrate == 5;
            set(handles.FreqRten,'Value',get(handles.FreqRten,'Max'));
        elseif freqrate == 6
            set(handles.FreqRtenth,'Value',get(handles.FreqRtenth,'Max'));
        end
    case 'PRMSR'
        setparam(TG, getparamid(TG,'InputRight','Value'),7);
        set(handles.PulseSeqR,'visible','off');
        set(handles.PRBSeqR,'visible','off');
        set(handles.PRMSampR,'string',(getparam(TG,getparamid(TG,'Right PRMS/PRMS_Amp','Gain'))));
        set(handles.SINESeqR,'visible','off');
        set(handles.PRMSSeqR,'visible','on');
        
        switchrate = getparam(TG,getparamid(TG,'Right PRMS/PRMS switch','Value'));
        if switchrate == 1;
            set(handles.MSOneHundredR,'Value',get(handles.MSOneHundredR,'Max'));
        elseif switchrate == 2;
            set(handles.MSOneHundredFiftyR,'Value',get(handles.MSOneHundredFiftyR,'Max'));
        elseif switchrate == 3;
            set(handles.MSTwoHundredR,'Value',get(handles.MSTwoHundredR,'Max'));
        elseif switchrate == 4;
            set(handles.MSThreeHundredR,'Value',get(handles.MSThreeHundredR,'Max'));
        elseif switchrate == 5;
            set(handles.MSFourHundredR,'Value',get(handles.MSFourHundredR,'Max'));
        elseif switchrate == 6;
            set(handles.MSFiveHundredR,'Value',get(handles.MSFiveHundredR,'Max'));
        end
       
    otherwise
        errordlg('You must select a Right Pedal input type','Bad Input','modal')
        % Code for when there is no match
end




% --- Executes during object creation, after setting all properties.
function PulseSeqR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PulseSeqR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
if getparam(TG,getparamid(TG,'InputRight','Value')) == 4
    set(hObject,'visible','on');
else
    set(hObject,'visible','off');
end


function PulseAmpR_Callback(hObject, eventdata, handles)
% hObject    handle to PulseAmpR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    
    
    % elseif user_entry > 0.02
    %    errordlg('Pulse Amplitude Exceeds Maximum Limits','Bad Input','modal')
    
else
    setparam(TG,getparamid(TG,'PulseAmpR','Gain'),str2double(get(hObject,'string')));
    
end
% Hints: get(hObject,'String') returns contents of PulseAmpR as text
%        str2double(get(hObject,'String')) returns contents of PulseAmpR as a double


% --- Executes during object creation, after setting all properties.
function PulseAmpR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PulseAmpR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global TG
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string', num2str(getparam(TG,getparamid(TG,'PulseAmpR','Gain'))));


function PulseWidthR_Callback(hObject, eventdata, handles)
% hObject    handle to PulseWidthR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
oldwidth = get(hObject,'UserData');

user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
else
    NewPulseWidth = str2double(get(hObject,'string'));
    setparam(TG,getparamid(TG,'Pulse Sequence1/PulseWidthR/N-Sample Enable','TARGETCNT'),NewPulseWidth);
    setparam(TG,getparamid(TG,'Pulse Sequence1/Pause Interval','Minimum'),5000+NewPulseWidth);
    oldmax = getparam(TG,getparamid(TG,'Pulse Sequence1/Pause Interval','Maximum'));
    setparam(TG,getparamid(TG,'Pulse Sequence1/Pause Interval','Maximum'),(oldmax-oldwidth)+ NewPulseWidth);
end
set(hObject,'UserData',NewPulseWidth)

% Hints: get(hObject,'String') returns contents of PulseWidthR as text
%        str2double(get(hObject,'String')) returns contents of PulseWidthR as a double


% --- Executes during object creation, after setting all properties.
function PulseWidthR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PulseWidthR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
PulseWidth = num2str(getparam(TG,getparamid(TG,'Pulse Sequence1/PulseWidthR/N-Sample Enable','TARGETCNT')));
set(hObject,'string',PulseWidth)
set(hObject,'UserData',PulseWidth)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function MaxPulseIntR_Callback(hObject, eventdata, handles)
% hObject    handle to MaxPulseIntR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
else
    setparam(TG,getparamid(TG,'Pulse Sequence1/Pause Interval','Maximum'),str2double(get(hObject,'string')))
end
% Hints: get(hObject,'String') returns contents of MaxPulseIntR as text
%        str2double(get(hObject,'String')) returns contents of MaxPulseIntR as a double

% --- Executes during object creation, after setting all properties.
function MaxPulseIntR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxPulseIntR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global TG
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
MaxPulseInt = num2str(getparam(TG,getparamid(TG,'Pulse Sequence1/Pause Interval','Maximum')));
set(hObject,'string',MaxPulseInt)




% --- Executes on button press in refreshtg.
function refreshtg_Callback(hObject, eventdata, handles)
% hObject    handle to refreshtg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG

%refresh on/off
if getparam(TG,getparamid(TG,'Leftonoff','Value')) == 0
    set(handles.leftonoff,'Value',get(handles.leftonoff,'Min'));
elseif getparam(TG, getparamid(TG,'Leftonoff','Value')) == 1
    set(handles.leftonoff,'Value',get(handles.leftonoff,'Max'));
else
    errordlg('Left ON/OFF Switch Model Error, Left Pedal Turned Off ','Bad Input','modal')
    setparam(TG,getparamid(TG,'Leftonoff'),0)
end

if getparam(TG,getparamid(TG,'Rightonoff','Value')) == 0
    set(handles.rightonoff,'Value',get(handles.rightonoff,'Min'));
elseif getparam(TG, getparamid(TG,'Rightonoff','Value')) == 1
    set(handles.rightonoff,'Value',get(handles.rightonoff,'Max'));
else
    errordlg('Right ON/OFF Switch Model Error, Right Pedal Input Turned Off ','Bad Input','modal')
    setparam(TG,getparamid(TG,'Rightonoff','Value'),0);
end

%refresh offset
set(handles.leftpedaloffset,'string',getparam(TG,getparamid(TG,'Left Position Offset','Value')));
set(handles.rightpedaloffset,'string',(getparam(TG,getparamid(TG,'Right Position Offset','Value'))));



%refresh input selection
leftselect = getparam(TG,getparamid(TG,'InputLeft','Value'));

if leftselect == 1  %Buffer
    set(handles.BuffInL,'Value',1);
    set(handles.ZeroInL,'Value',0);
    set(handles.PulseInL,'Value',0);
    set(handles.PRBSL,'Value',0);
    set(handles.squarewaveL,'Value',0);
    set(handles.sawtoothwaveL,'Value',0);
    set(handles.PulseSeqL,'visible','off');
    set(handles.PRBSeqL,'visible','off');
    set(handles.SINESeqL,'visible','off');
    set(handles.SquareSeqL,'visible','off');
    set(handles.SawSeqL,'visible','off');
elseif leftselect ==2   %Zero
    set(handles.BuffInL,'Value',0);
    set(handles.ZeroInL,'Value',1);
    set(handles.PulseInL,'Value',0);
    set(handles.PRBSL,'Value',0)
    set(handles.squarewaveL,'Value',0);
    set(handles.sawtoothwaveL,'Value',0);
    set(handles.PulseSeqL,'visible','off');
    set(handles.PRBSeqL,'visible','off');
    set(handles.SINESeqL,'visible','off');
    set(handles.SquareSeqL,'visible','off');
    set(handles.SawSeqL,'visible','off');
elseif leftselect == 3  %Pulse
    set(handles.BuffInL,'Value',0);
    set(handles.ZeroInL,'Value',0);
    set(handles.PulseInL,'Value',1);
    set(handles.PRBSL,'Value',0);
    set(handles.squarewaveL,'Value',0);
    set(handles.sawtoothwaveL,'Value',0);
    set(handles.SINESeqL,'visible','off');
    set(handles.PulseSeqL,'visible','on');
    set(handles.PRBSeqL,'visible','off');
    set(handles.PulseAmpL,'string',getparam(TG,getparamid(TG,'PulseAmpL','Gain')));
    set(handles.PulseWidthL,'string',(getparam(TG,getparamid(TG,'Pulse Sequence/PulseWidthL/N-Sample Enable','TARGETCNT'))));
    set(handles.MaxPulseIntL,'string',(getparam(TG,getparamid(TG,'Pulse Sequence/Pause Interval','Maximum'))));
    set(handles.SquareSeqL,'visible','off');
    set(handles.SawSeqL,'visible','off');
    
elseif leftselect == 4  %PRBS
    set(handles.BuffInL,'Value',0);
    set(handles.ZeroInL,'Value',0);
    set(handles.PulseInL,'Value',0);
    set(handles.PRBSL,'Value',1);
    set(handles.squarewaveL,'Value',0);
    set(handles.sawtoothwaveL,'Value',0);
    set(handles.SINESeqL,'visible','off');
    set(handles.PulseSeqL,'visible','off');
    set(handles.SquareSeqL,'visible','off');
    set(handles.SawSeqL,'visible','off');
    set(handles.PRBSeqL,'visible','on');
    set(handles.PRBSampL,'string',getparam(TG,getparamid(TG,'Left PRBS/PRBS_Amp','Gain')));
    switchrateL = getparam(TG,getparamid(TG,'Left PRBS/PRBS switch','Value'));
    if switchrateL == 1;
        set(handles.OneHundredL,'Value',get(handles.OneHundredL,'Max'));
    elseif switchrateL == 2;
        set(handles.OneHundredFiftyL,'Value',get(handles.OneHundredFiftyL,'Max'));
    elseif switchrateL == 3;
        set(handles.TwoHundredL,'Value',get(handles.TwoHundredL,'Max'));
    elseif switchrateL == 4;
        set(handles.ThreeHundredL,'Value',get(handles.ThreeHundredL,'Max'));
    elseif switchrateL == 5;
        set(handles.FourHundredL,'Value',get(handles.FourHundredL,'Max'));
    elseif switchrateL == 6;
        set(handles.FiveHundredL,'Value',get(handles.FiveHundredL,'Max'));
    end
elseif leftselect ==7  % Square Wave
    set(handles.BuffInL,'Value',0);
    set(handles.ZeroInL,'Value',0);
    set(handles.PulseInL,'Value',0);
    set(handles.PRBSL,'Value',0);
    set(handles.squarewaveL,'Value',1);
    set(handles.sawtoothwaveL,'Value',0);
    set(handles.SINESeqL,'visible','off');
    set(handles.PulseSeqL,'visible','off');
    set(handles.SquareSeqL,'visible','on');
    set(handles.SawSeqL,'visible','off');
    set(handles.PRBSeqL,'visible','off');
    set(handles.SquareAmpL,'string',getparam(TG,getparamid(TG,'L Square/SquareAmp','Gain')));
    frequencyL = getparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'));
    if frequencyL == 1;
        set(handles.Lsquarefreq1,'Value',get(handles.Lsquarefreq1,'Max'));
    elseif frequencyL == 2;
        set(handles.Lsquarefreq2,'Value',get(handles.Lsquarefreq2,'Max'));
    elseif frequencyL == 3;
        set(handles.Lsquarefreq3,'Value',get(handles.Lsquarefreq3,'Max'));
    elseif frequencyL == 4;
        set(handles.Lsquarefreq4,'Value',get(handles.Lsquarefreq4,'Max'));
    elseif frequencyL == 5;
        set(handles.Lsquarefreq5,'Value',get(handles.Lsquarefreq5,'Max'));
    elseif frequencyL == 6;
        set(handles.Lsquarefreq6,'Value',get(handles.Lsquarefreq6,'Max'));
    elseif frequencyL == 7;
        set(handles.Lsquarefreq7,'Value',get(handles.Lsquarefreq7,'Max'));
    elseif frequencyL == 8;
        set(handles.Lsquarefreq8,'Value',get(handles.Lsquarefreq8,'Max'));
    elseif frequencyL == 9;
        set(handles.Lsquarefreq9,'Value',get(handles.Lsquarefreq9,'Max'));
    elseif frequencyL == 10;
        set(handles.Lsquarefreq10,'Value',get(handles.Lsquarefreq10,'Max'));
    end
    
elseif leftselect == 8  % Sawtooth Wave
    set(handles.BuffInL,'Value',0);
    set(handles.ZeroInL,'Value',0);
    set(handles.PulseInL,'Value',0);
    set(handles.PRBSL,'Value',0);
    set(handles.squarewaveL,'Value',0);
    set(handles.sawtoothwaveL,'Value',1);
    set(handles.SINESeqL,'visible','off');
    set(handles.PulseSeqL,'visible','off');
    set(handles.SquareSeqL,'visible','off');
    set(handles.SawSeqL,'visible','on');
    set(handles.PRBSeqL,'visible','off');
    set(handles.SawAmpL,'string',getparam(TG,getparamid(TG,'L Sawtooth/SawtoothAmp','Gain')));
    ramplengthL = getparam(TG,getparamid(TG,'L Sawtooth/SawtoothSwitch','Value'));
    if ramplengthL == 1;
        set(handles.Lsawlength1,'Value',get(handles.Lsawlength1,'Max'));
    elseif ramplengthL == 2;
        set(handles.Lsawlength2,'Value',get(handles.Lsawlength2,'Max'));
    elseif ramplengthL == 3;
        set(handles.Lsawlength3,'Value',get(handles.Lsawlength3,'Max'));
    elseif ramplengthL == 4;
        set(handles.Lsawlength4,'Value',get(handles.Lsawlength4,'Max'));
    elseif ramplengthL == 5;
        set(handles.Lsawlength5,'Value',get(handles.Lsawlength5,'Max'));
    end
    
    
else
    errordlg('Error with Left Input Selection. Should close and reload model','Bad Input','modal')
end

rightselect = getparam(TG,getparamid(TG,'InputRight','Value'));

if rightselect == 1 %Buffer
    set(handles.BuffInR,'Value',1);
    set(handles.Same,'Value',0);
    set(handles.ZeroInR,'Value',0);
    set(handles.PulseInR,'Value',0);
    set(handles.OppDirection,'visible','off');
    set(handles.PRBSR,'Value',0);
    set(handles.SINESeqR,'visible','off');
    set(handles.PulseSeqR,'visible','off');
    set(handles.PRBSeqR,'visible','off');
    
elseif rightselect ==2  %Same
    set(handles.BuffInR,'Value',0);
    set(handles.Same,'Value',1);
    set(handles.ZeroInR,'Value',0);
    set(handles.PulseInR,'Value',0);
    set(handles.OppDirection,'visible','on');
    set(handles.PRBSR,'Value',0);
    set(handles.PulseSeqR,'visible','off');
    set(handles.PRBSeqR,'visible','off');
    set(handles.SINESeqR,'visible','off');
    
elseif rightselect == 3 %Zero
    set(handles.BuffInR,'Value',0);
    set(handles.Same,'Value',0);
    set(handles.ZeroInR,'Value',1);
    set(handles.PulseInR,'Value',0);
    set(handles.OppDirection,'visible','off');
    set(handles.PRBSR,'Value',0);
    set(handles.PulseSeqR,'visible','off');
    set(handles.PRBSeqR,'visible','off');
    set(handles.SINESeqR,'visible','off');
elseif rightselect == 4     %Pulse
    set(handles.BuffInR,'Value',0);
    set(handles.Same,'Value',0);
    set(handles.ZeroInR,'Value',0);
    set(handles.PulseInR,'Value',1);
    set(handles.OppDirection,'visible','off');
    set(handles.PRBSR,'Value',0);
    set(handles.SINESeqR,'visible','off');
    
    set(handles.PulseSeqR,'visible','on');
    set(handles.PRBSeqR,'visible','off');
    set(handles.PulseAmpR,'string',(getparam(TG,getparamid(TG,'PulseAmpR','Gain'))));
    set(handles.PulseWidthR,'string',(getparam(TG,getparamid(TG,'Pulse Sequence1/PulseWidthR/N-Sample Enable','TARGETCNT'))));
    set(handles.MaxPulseIntR,'string',(getparam(TG,getparamid(TG,'Pulse Sequence1/Pause Interval','Maximum'))));
    
elseif rightselect == 5 %PRBS
    set(handles.BuffInR,'Value',0);
    set(handles.Same,'Value',0);
    set(handles.ZeroInR,'Value',0);
    set(handles.PulseInR,'Value',0);
    set(handles.OppDirection,'visible','off');
    set(handles.PRBSR,'Value',1);
    set(handles.SINESeqR,'visible','off');
    set(handles.PulseSeqR,'visible','off');
    set(handles.PRBSeqR,'visible','on');
    set(handles.PRBSampR,'string',getparam(TG,getparamid(TG,'Right PRBS/PRBS_Amp','Gain')));
    
    switchrateR = getparam(TG,getparamid(TG,'Right PRBS/PRBS switch','Value'));
    
    if switchrateR == 1;
        set(handles.OneHundredR,'Value',get(handles.OneHundredR,'Max'));
    elseif switchrateR == 2;
        set(handles.OneHundredFiftyR,'Value',get(handles.OneHundredFiftyR,'Max'));
    elseif switchrateR == 3;
        set(handles.TwoHundredR,'Value',get(handles.TwoHundredR,'Max'));
    elseif switchrateR == 4;
        set(handles.ThreeHundredR,'Value',get(handles.ThreeHundredR,'Max'));
    elseif switchrateR == 5;
        set(handles.FourHundredR,'Value',get(handles.FourHundredR,'Max'));
    elseif switchrateR == 6;
        set(handles.FiveHundredR,'Value',get(handles.FiveHundredR,'Max'));
    end
else
    errordlg('Error with Right Input Selection. Should close and reload model','Bad Input','modal')
end


if getparam(TG, getparamid(TG, 'Actuator Inversion', 'Gain')) == 1
    set(handles.OppDirection,'Value',get(handles.OppDirection,'Min'));
    set(handles.OppDirection,'BackgroundColor',get(handles.OppDirection,'UserData'));
elseif setparam(TG, getparamid(TG, 'Actuator Inversion', 'Gain')) == -1
    set(handles.OppDirection,'Value',get(handles.OPpDirection,'Max'));
    set(handles.OppDirection,'BackgroundColor','magenta')
else
    errordlg('Opposite Direction Switch Model Error, Left & Right Pedal Turned Off ','Bad Input','modal')
    setparam(TG,getparamid(TG,'Leftonoff'),0);
    setparam(TG,getparamid(TG,'Rightonoff'),0);
end

% Refresh RENSHAW scope
% set(handles.renshaw,'Value',getparam(TG,getparamid(TG,'Targetswitch','Value')));

% --- Executes during object creation, after setting all properties.
function OppDirection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OppDirection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'visible','off')
set(hObject,'UserData',get(hObject,'BackgroundColor'))


% --- Executes during object creation, after setting all properties.
function plotterL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotterL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'visible','off')


% --- Executes on button press in plotopen.
function plotopen_Callback(hObject, eventdata, handles)
% hObject    handle to plotopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

file = get(handles.trialname,'string');

file = sprintf('%s.flb',file);

if exist(file,'file')
    set(handles.leftin,'visible','on');
    set(handles.rightin,'visible','on');
    set(handles.plotterL,'visible','on');
    set(handles.plotterR,'visible','on');
    
    %Set up cases
    ca = sprintf('%s.flb',get(handles.trialname,'string'));
    numcases = flb2mat(ca,'length');
    cases = 0:numcases;
    set(handles.popupmenu5,'string',cases);
    set(handles.popupmenu8,'string',cases);
else
    errordlg('The flb does not exist. Verify trial name and that at least one case has been recorded.','Bad Input','modal')
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
plots = ['Select';'L.COP ';'R.COP ';'L.Velo';'R.Velo'];
set(hObject,'String',plots);

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')>1
    
    c = sprintf('%s.flb',get(handles.trialname,'string'));
    sel = (get(hObject,'value'))-1;
    ca = flb2mat(c,'read_case',sel);
    set(hObject,'UserData',ca);
    nreal = ca.nReal;
    
    set(handles.popupmenu6,'string',0:nreal);
else
    errordlg('You must select a case number','Bad Input','modal')
end


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','Choose Case #')
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

set(hObject,'string', 'Choose Realization #')

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

plots = ['Select';'L.COP ';'R.COP ';'L.Velo';'R.Velo'];
set(hObject,'String',plots);

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string', 'Choose Realization #')
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')>1
    
    c = sprintf('%s.flb',get(handles.trialname,'string'));
    sel = (get(hObject,'value'))-1;
    ca = flb2mat(c,'read_case',sel);
    set(hObject,'UserData',ca);
    nreal = ca.nReal;
    
    set(handles.popupmenu7,'string',0:nreal);
else
    errordlg('You must select a case number','Bad Input','modal')
end

% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','Choose Case #')
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function PRBSampL_Callback(hObject, eventdata, handles)
% hObject    handle to PRBSampL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
%set model parameter gain to what user enters for peak to peak amplitude
setparam(TG,getparamid(TG,'Left PRBS/PRBS_Amp1','Gain'),str2double(get(hObject,'string')));
% Hints: get(hObject,'String') returns contents of PRBSampL as text
%        str2double(get(hObject,'String')) returns contents of PRBSampL as a double

% --- Executes during object creation, after setting all properties.
function PRBSampL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PRBSampL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
%set value in box upon creation to whaever is specified in model
amp = getparam(TG,getparamid(TG,'Left PRBS/PRBS_Amp1','Gain'));
set(hObject,'string',num2str(amp))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PRBSampR_Callback(hObject, eventdata, handles)
% hObject    handle to PRBSampR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
%set model parameter gain to what user enters for peak to peak amplitude
setparam(TG,getparamid(TG,'Right PRBS/PRBS_Amp2','Gain'),str2double(get(hObject,'string')));
% Hints: get(hObject,'String') returns contents of PRBSampL as text
%        str2double(get(hObject,'String')) returns contents of PRBSampL as a double% --- Executes on button press in TOQtrigR.

% --- Executes during object creation, after setting all properties.
function PRBSampR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PRBSampR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
%set value in box upon creation to whaever is specified in model
amp = getparam(TG,getparamid(TG,'Right PRBS/PRBS_Amp2','Gain'));
set(hObject,'string',num2str(amp))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected object is changed in PRBSswitchL.
function PRBSswitchL_SelectionChangeFcn(hObject, eventdata,handles)
% hObject    handle to the selected object in PRBSswitchL
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'OneHundredL'
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Minimum'),100);
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Maximum'),150);
    case 'OneHundredFiftyL'
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Minimum'),150);
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Maximum'),200);
    case 'TwoHundredL'
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Minimum'),200);
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Maximum'),250);
    case 'ThreeHundredL'
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Minimum'),300);
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Maximum'),350);
    case 'FourHundredL'
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Minimum'),400);
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Maximum'),450);
    case 'FiveHundredL'
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Minimum'),500);
        setparam(TG, getparamid(TG,'Left PRBS/Subsystem/Pause Interval','Maximum'),550);
    otherwise
        errordlg('You must select a switching rate','Bad Input','modal')
        % Code for when there is no match
end

% --- Executes when selected object is changed in PRBSswitchR.
function PRBSswitchR_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in PRBSswitchR
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'OneHundredR'
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Minimum'),100);
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Maximum'),150);
    case 'OneHundredFiftyR'
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Minimum'),150);
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Maximum'),200);
    case 'TwoHundredR'
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Minimum'),200);
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Maximum'),250);
    case 'ThreeHundredR'
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Minimum'),300);
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Maximum'),350);
    case 'FourHundredR'
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Minimum'),400);
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Maximum'),450);
    case 'FiveHundredR'
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Minimum'),500);
        setparam(TG, getparamid(TG,'Right PRBS/Subsystem1/Pause Interval','Maximum'),550);
    otherwise
        errordlg('You must select a switching rate','Bad Input','modal')
        % Code for when there is no match
end


% --- Executes on button press in Updatethresh.
function Updatethresh_Callback(hObject, eventdata, handles)
% hObject    handle to Updatethresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG

if get(hObject,'Value') == get(hObject,'Max')
    setparam(TG,getparamid(TG,'TorqueChecker/Updatethreshold','Value'),1);
else
    setparam(TG,getparamid(TG,'TorqueChecker/Updatethreshold','Value'),0);
end



% --- Executes on button press in AcqMean.
function AcqMean_Callback(hObject, eventdata, handles)
% hObject    handle to AcqMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG

if get(hObject,'Value') == get(hObject,'Max')
    setparam(TG, getparamid(TG,'TorqueChecker/acqmean','Value'),1);
else
    setparam(TG,getparamid(TG,'TorqueChecker/acqmean','Value'),0);
    setparam(TG,getparamid(TG,'Leftonoff','Value'),0);
    setparam(TG,getparamid(TG,'Rightonoff','Value'),0);
    set(handles.leftonoff,'Value',get(handles.leftonoff,'Min'))
    set(handles.rightonoff,'Value',get(handles.rightonoff,'Min'))
end
% Hint: get(hObject,'Value') returns toggle state of AcqMean



function TolerL_Callback(hObject, eventdata, handles)
% hObject    handle to TolerL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TolerL as text
%        str2double(get(hObject,'String')) returns contents of TolerL as a double


% --- Executes during object creation, after setting all properties.
function TolerL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TolerL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
tol = getparam(TG,getparamid(TG,'TorqueChecker/Torqueanalysis/LeftTolerance','Gain'));
set(hObject,'string',num2str(tol));

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TolerR_Callback(hObject, eventdata, handles)
% hObject    handle to TolerR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TolerR as text
%        str2double(get(hObject,'String')) returns contents of TolerR as a double


% --- Executes during object creation, after setting all properties.
function TolerR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TolerR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
tol = getparam(TG,getparamid(TG,'TorqueChecker/Torqueanalysis/RightTolerance','Gain'));
set(hObject,'string',num2str(tol));

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in TolConfirm.
function TolConfirm_Callback(hObject, eventdata, handles)
% hObject    handle to TolConfirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
tolL = get(handles.TolerL,'String');
tolR = get(handles.TolerR,'String');
setparam(TG,getparamid(TG,'TorqueChecker/Torqueanalysis/LeftTolerance','Gain'),str2num(tolL));
setparam(TG,getparamid(TG,'TorqueChecker/Torqueanalysis/RightTolerance','Gain'),str2num(tolR));
% --- Executes on button press in torquecheck.





function torquecheck_Callback(hObject, eventdata, handles)
% hObject    handle to torquecheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
%
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

if get(hObject,'Value') == get(hObject,'Max')
    setparam(TG,getparamid(TG,'TOQTrigger','Value'),1);
    setparam(TG,getparamid(TG,'Treset','Value'),0);
    
else
    setparam(TG,getparamid(TG,'TOQTrigger','Value'),-1);
    setparam(TG,getparamid(TG,'Treset','Value'),1);
    
end
%

function meanL_Callback(hObject, eventdata, handles)
% hObject    handle to meanL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meanL as text
%        str2double(get(hObject,'String')) returns contents of meanL as a double


% --- Executes during object creation, after setting all properties.
function meanL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meanL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% global TG
% while (get(handles.leftonoff,'Value'))== 1
%     set(hObject,'Value',getsignal(TG,getsignalid(TG,'TorqueChecker/Runningmean/Left Mean')))
% end
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



function meanR_Callback(hObject, eventdata, handles)
% hObject    handle to meanR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meanR as text
%        str2double(get(hObject,'String')) returns contents of meanR as a double


% --- Executes during object creation, after setting all properties.
function meanR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meanR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% global TG
% while (get(handles.leftonoff,'Value')) == 1
%     set(hObject,'String',num2str(getsignal(TG,getsignalid(TG,'TorqueChecker/Runningmean/Right Mean'))))
% end
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in toqoverride.
function toqoverride_Callback(hObject, eventdata, handles)
% hObject    handle to toqoverride (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
%
if get(hObject,'Value') == get(hObject,'Max')
    setparam(TG,getparamid(TG,'TOQoverride','Value'),0)   %If don't want torque check ,set override to zero, so it passes a 1
    
elseif get(hObject,'Value') == get(hObject,'Min')
    setparam(TG,getparamid(TG,'TOQoverride','Value'),1)
end
% Hint: get(hObject,'Value') returns toggle state of toqoverride











% --- Executes during object creation, after setting all properties.
function SINESeqR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SINESeqR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG

if getparam(TG,getparamid(TG,'InputRight','Value')) == 6
    set(hObject,'visible','on');
else
    set(hObject,'visible','off');
end


% --- Executes during object creation, after setting all properties.
function SINESeqL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SINESeqL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
if getparam(TG,getparamid(TG,'InputLeft','Value')) == 5
    set(hObject,'visible','on');
else
    set(hObject,'visible','off');
end



function SineAmpL_Callback(hObject, eventdata, handles)
% hObject    handle to SineAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = 10*str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'SineWaveL/SineAmp','Gain'),user_entry);
% Hints: get(hObject,'String') returns contents of SineAmpL as text
%        str2double(get(hObject,'String')) returns contents of SineAmpL as a double


% --- Executes during object creation, after setting all properties.
function SineAmpL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SineAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
%set value in box upon creation to whaever is specified in model
amp = getparam(TG,getparamid(TG,'SineWaveL/SineAmp','Gain'));
set(hObject,'string',num2str(amp))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function SineAmpR_Callback(hObject, eventdata, handles)
% hObject    handle to SineAmpR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = 10*str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'SineWaveR/SineAmp','Gain'),user_entry);
% Hints: get(hObject,'String') returns contents of SineAmpR as text
%        str2double(get(hObject,'String')) returns contents of SineAmpR as a double


% --- Executes during object creation, after setting all properties.
function SineAmpR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SineAmpR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
%set value in box upon creation to whaever is specified in model
amp = getparam(TG,getparamid(TG,'SineWaveR/SineAmp','Gain'));
set(hObject,'string',num2str(amp))
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes when selected object is changed in sinefreqL.
function sinefreqL_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in sinefreqL
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'FreqLhalf'
        setparam(TG, getparamid(TG,'SineWaveL/SineSwitch','Value'),1);
    case 'FreqLone'
        setparam(TG, getparamid(TG,'SineWaveL/SineSwitch','Value'),2);
    case 'FreqLtwo'
        setparam(TG, getparamid(TG,'SineWaveL/SineSwitch','Value'),3);
    case 'FreqLfive'
        setparam(TG, getparamid(TG,'SineWaveL/SineSwitch','Value'),4);
    case 'FreqLten'
        setparam(TG, getparamid(TG,'SineWaveL/SineSwitch','Value'),5);
    case 'FreqLtenth'
        setparam(TG,getparamid(TG,'SineWaveL/SineSwitch','Value'),6);
    otherwise
        errordlg('You must select a switching rate','Bad Input','modal')
        % Code for when there is no match
end

% --- Executes when selected object is changed in sinefreqR.
function sinefreqR_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in sinefreqR
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'FreqRhalf'
        setparam(TG, getparamid(TG,'SineWaveR/SineSwitch','Value'),1);
    case 'FreqRone'
        setparam(TG, getparamid(TG,'SineWaveR/SineSwitch','Value'),2);
    case 'FreqRtwo'
        setparam(TG, getparamid(TG,'SineWaveR/SineSwitch','Value'),3);
    case 'FreqRfive'
        setparam(TG, getparamid(TG,'SineWaveR/SineSwitch','Value'),4);
    case 'FreqRten'
        setparam(TG, getparamid(TG,'SineWaveR/SineSwitch','Value'),5);
    case 'FreqRtenth'
        setparam(TG,getparamid(TG,'SineWaveR/SineSwitch','Value'),6);
    otherwise
        errordlg('You must select a switching rate','Bad Input','modal')
        % Code for when there is no match
end



function PRMSampL_Callback(hObject, eventdata, handles)
% hObject    handle to PRMSampL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = 10*str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'Left PRMS/PRMS_Amp','Gain'),user_entry);
% Hints: get(hObject,'String') returns contents of PRMSampL as text
%        str2double(get(hObject,'String')) returns contents of PRMSampL as a double


% --- Executes during object creation, after setting all properties.
function PRMSampL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PRMSampL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
%set value in box upon creation to whaever is specified in model
amp = getparam(TG,getparamid(TG,'Left PRMS/PRMS_Amp','Gain'));
set(hObject,'string',num2str(amp))
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PRMSampR_Callback(hObject, eventdata, handles)
% hObject    handle to PRMSampR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = 10*str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'Right PRMS/PRMS_Amp','Gain'),user_entry);
% Hints: get(hObject,'String') returns contents of PRMSampR as text
%        str2double(get(hObject,'String')) returns contents of PRMSampR as a double


% --- Executes during object creation, after setting all properties.
function PRMSampR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PRMSampR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
%set value in box upon creation to whaever is specified in model
amp = getparam(TG,getparamid(TG,'Right PRMS/PRMS_Amp','Gain'));
set(hObject,'string',num2str(amp))
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in PRMSswitchL.
function PRMSswitchL_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in PRMSswitchL
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'MSOneHundredL'
        setparam(TG, getparamid(TG,'Left PRMS/PRMS switch','Value'),1);
    case 'MSOneHundredFiftyL'
        setparam(TG, getparamid(TG,'Left PRMS/PRMS switch','Value'),2);
    case 'MSTwoHundredL'
        setparam(TG, getparamid(TG,'Left PRMS/PRMS switch','Value'),3);
    case 'MSThreeHundredL'
        setparam(TG, getparamid(TG,'Left PRMS/PRMS switch','Value'),4);
    case 'MSFourHundredL'
        setparam(TG, getparamid(TG,'Left PRMS/PRMS switch','Value'),5);
    case 'MSFiveHundredL'
        setparam(TG, getparamid(TG,'Left PRMS/PRMS switch','Value'),6);
    otherwise
        errordlg('You must select a switching rate','Bad Input','modal')
        % Code for when there is no match
end


% --- Executes when selected object is changed in PRMSswitchR.
function PRMSswitchR_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in PRMSswitchR
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'MSOneHundredR'
        setparam(TG, getparamid(TG,'Right PRMS/PRMS switch','Value'),1);
    case 'MSOneHundredFiftyR'
        setparam(TG, getparamid(TG,'Right PRMS/PRMS switch','Value'),2);
    case 'MSTwoHundredR'
        setparam(TG, getparamid(TG,'Right PRMS/PRMS switch','Value'),3);
    case 'MSThreeHundredR'
        setparam(TG, getparamid(TG,'Right PRMS/PRMS switch','Value'),4);
    case 'MSFourHundredR'
        setparam(TG, getparamid(TG,'Right PRMS/PRMS switch','Value'),5);
    case 'MSFiveHundredR'
        setparam(TG, getparamid(TG,'Right PRMS/PRMS switch','Value'),6);
    otherwise
        errordlg('You must select a switching rate','Bad Input','modal')
        % Code for when there is no match
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over BuffInL.
function BuffInL_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to BuffInL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function PulseSeqL_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to PulseSeqL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% -------------------------------------------------------------------

% --- Executes during object creation, after setting all properties.
function SquareSeqL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SquareSeqL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
if getparam(TG,getparamid(TG,'InputLeft','Value')) == 7
    set(hObject,'visible','on');
else
    set(hObject,'visible','off');
end

function SquareAmpL_Callback(hObject, eventdata, handles)
% hObject    handle to SquareAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'L Square/SquareAmp','Gain'),user_entry);
% Hints: get(hObject,'String') returns contents of SquareAmpL as text
%        str2double(get(hObject,'String')) returns contents of SquareAmpL as a double


% --- Executes during object creation, after setting all properties.
function SquareAmpL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SquareAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
amp = getparam(TG,getparamid(TG,'L Square/SquareAmp','Gain'));
set(hObject,'string',num2str(amp))

%set value in box upon creation to whatever is specified in model
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected object is changed in squarefreqL.
function squarefreqL_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in squarefreqL
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') %Get Tag of selected object.
    case 'Lsquarefreq1'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),1);
    case 'Lsquarefreq2'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),2);
    case 'Lsquarefreq3'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),3);
    case 'Lsquarefreq4'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),4);
    case 'Lsquarefreq5'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),5);
    case 'Lsquarefreq6'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),6);
    case 'Lsquarefreq7'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),7);
    case 'Lsquarefreq8'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),8);
    case 'Lsquarefreq9'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),9);
    case 'Lsquarefreq10'
        setparam(TG,getparamid(TG,'L Square/SquareSwitch','Value'),10);
    otherwise
        errordlg('You must select a frequency','Bad Input','modal')
end

% -------------------------------------------------------------------
% --- Executes during object creation, after setting all properties.
function SawSeqL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SawSeqL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG

if getparam(TG,getparamid(TG,'InputLeft','Value')) == 8
    set(hObject,'visible','on');
else
    set(hObject,'visible','off');
end

function SawAmpL_Callback(hObject, eventdata, handles)
% hObject    handle to SawAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'L Sawtooth/SawtoothAmp','Gain'),user_entry);
% Hints: get(hObject,'String') returns contents of SawAmpL as text
%        str2double(get(hObject,'String')) returns contents of SawAmpL as a double

% --- Executes during object creation, after setting all properties.
function SawAmpL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SawAmpL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global TG
amp = getparam(TG,getparamid(TG,'L Sawtooth/SawtoothAmp','Gain'));
set(hObject,'string',num2str(amp))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in SawLengthL.
function SawLengthL_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in SawLengthL
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global TG
switch get(eventdata.NewValue,'Tag') % Get tag of selected object
    case 'Lsawlength1'
        setparam(TG,getparamid(TG,'L Sawtooth/SawtoothSwitch','Value'),1);
    case 'Lsawlength2'
        setparam(TG,getparamid(TG,'L Sawtooth/SawtoothSwitch','Value'),2);
    case 'Lsawlength3'
        setparam(TG,getparamid(TG,'L Sawtooth/SawtoothSwitch','Value'),3);
    case 'Lsawlength4'
        setparam(TG,getparamid(TG,'L Sawtooth/SawtoothSwitch','Value'),4);
    case 'Lsawlength5'
        setparam(TG,getparamid(TG,'L Sawtooth/SawtoothSwitch','Value'),5);
    otherwise
        errordlg('You must select a ramp length','Bad Input','modal')
end


% --- Executes on button press in buffrefresh.
function buffrefresh_Callback(hObject, eventdata, handles)
% hObject    handle to buffrefresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


PRALDSprep();



function Lbuffgain_Callback(hObject, eventdata, handles)
% hObject    handle to Lbuffgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lbuffgain as text
%        str2double(get(hObject,'String')) returns contents of Lbuffgain as a double
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'Lbuffergain','Value'),user_entry);

% --- Executes during object creation, after setting all properties.
function Lbuffgain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lbuffgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

buffamp = getparam(TG,getparamid(TG,'Lbuffergain','Value'));
set(hObject,'string',num2str(buffamp))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over BuffInR.
function BuffInR_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to BuffInR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Rbuffgain_Callback(hObject, eventdata, handles)
% hObject    handle to Rbuffgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rbuffgain as text
%        str2double(get(hObject,'String')) returns contents of Rbuffgain as a double
global TG
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    errordlg('You must enter a numeric value','Bad Input','modal')
    uicontrol(hObject)
    return
end
setparam(TG,getparamid(TG,'Rbuffergain','Value'),user_entry);


% --- Executes during object creation, after setting all properties.
function Rbuffgain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rbuffgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
buffamp = getparam(TG,getparamid(TG,'Rbuffergain','Value'));
set(hObject,'string',num2str(buffamp))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
