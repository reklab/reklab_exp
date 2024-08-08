function varargout = Perturbation_generator(varargin)
% PERTURBATION_GENERATOR MATLAB code for Perturbation_generator.fig
%      PERTURBATION_GENERATOR, by itself, creates a new PERTURBATION_GENERATOR or raises the existing
%      singleton*.
%
%      H = PERTURBATION_GENERATOR returns the handle to a new PERTURBATION_GENERATOR or the handle to
%      the existing singleton*.
%
%      PERTURBATION_GENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERTURBATION_GENERATOR.M with the given input arguments.
%
%      PERTURBATION_GENERATOR('Property','Value',...) creates a new PERTURBATION_GENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Perturbation_generator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Perturbation_generator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Perturbation_generator

% Last Modified by GUIDE v2.5 30-Jul-2019 17:10:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Perturbation_generator_OpeningFcn, ...
                   'gui_OutputFcn',  @Perturbation_generator_OutputFcn, ...
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


% --- Executes just before Perturbation_generator is made visible.
function Perturbation_generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Perturbation_generator (see VARARGIN)

% Choose default command line output for Perturbation_generator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Perturbation_generator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Perturbation_generator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

set(handles.uipanel1, 'visible','on');
set(handles.uipanel2, 'visible','off');


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

si=str2double(get(handles.edit1,'string'));
amp=2*str2double(get(handles.edit2,'string'));
duration=200;
fs=1000;
amp_prbs=gen_prbs(si,amp,duration,fs);
real_duration=size(amp_prbs,2)/fs;
Ts=1/fs;
time = (0:Ts:(duration*fs-1)*Ts)';
prbs_signal=[amp_prbs];

if amp>0.1
    set(handles.error,'visible','on')
    amp_pralds=0;
    set(handles.edit2,'String','ERROR')
end

plot(time,amp_prbs,'Parent',handles.axes1);
set(handles.axes1,'XLim',[0,10],'YLim',[-0.1,0.1]);
xlabel('Time (s)','Parent',handles.axes1);
ylabel('Amplitude (rad)','Parent',handles.axes1);
saved_prbs=struct('Sig',prbs_signal,'Pulse_width',si,'Amplitude',amp,'Duration',duration,'Time',time);

setappdata(0,'saved_prbs',saved_prbs);

p_1=num2str(si);
p_2=num2str(amp);

prefix=['prbs__' p_1 '__' p_2 '__'];
prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');
setappdata(0,'prbs_prefix',prefix);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

saved_prbs=getappdata(0,'saved_prbs');

name=get(handles.file_name_prbs,'string');

prbs_prefix=char(getappdata(0,'pralds_prefix'));
name=char(name);
name=[prbs_prefix name];

save(strcat('D:\Users\Ali_R\GUI_draft\saved\prbs\',name),'saved_prbs');

set(handles.uipanel4,'visible','on');

set(handles.text12,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\prbs\',name));


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function pralds_min_Callback(hObject, eventdata, handles)
% hObject    handle to pralds_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pralds_min as text
%        str2double(get(hObject,'String')) returns contents of pralds_min as a double


% --- Executes during object creation, after setting all properties.
function pralds_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pralds_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pralds_amp_Callback(hObject, eventdata, handles)
% hObject    handle to pralds_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pralds_amp as text
%        str2double(get(hObject,'String')) returns contents of pralds_amp as a double


% --- Executes during object creation, after setting all properties.
function pralds_amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pralds_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

min_duration=str2double(get(handles.pralds_min,'string'));
max_duration=str2double(get(handles.pralds_max,'string'));
amp=str2double(get(handles.pralds_amp,'string'));

fs = 1000;
Ts = 0.001;
Nxdot = 200000;
Nr = 1;
nSwitch = 1;
Npdf = 100000;         
Nbins = 200;

[xPertData,xdotPertData]=gen_pralds(min_duration,max_duration,Nr,Ts,Nxdot,nSwitch,'exponential_2',Npdf,Nbins,'');
time = (0:Ts:(Nxdot-1)*Ts)';

amp_pralds = amp * xPertData;


plot(time,amp_pralds,'Parent',handles.pralds_axes);
set(handles.pralds_axes,'XLim',[0 , 10],'YLim',[-0.1,0.1]);

xlabel('Time (s)','Parent',handles.pralds_axes);
ylabel('Amplitude (rad)','Parent',handles.pralds_axes);

if amp>0.1
    set(handles.error,'visible','on')
    amp_pralds=0;
    set(handles.pralds_amp,'String','ERROR')
end

    
saved_pralds=struct('Sig',amp_pralds,'Max_duration',max_duration,'Min_duration',min_duration,'Amp',amp,'Duration',Nxdot,'Time',time);

setappdata(0,'saved_pralds',saved_pralds);

p_1=num2str(min_duration);
p_2=num2str(max_duration);
p_3=num2str(amp);


prefix=['pralds__' p_1 '__' p_2 '__' p_3 '__'];
prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');
setappdata(0,'pralds_prefix',prefix);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)

saved_pralds=getappdata(0,'saved_pralds');

name=get(handles.file_name_pralds,'string');

pralds_prefix=char(getappdata(0,'pralds_prefix'));
name=char(name);
name=[pralds_prefix name];

save(strcat('D:\Users\Ali_R\GUI_draft\saved\pralds\',name),'saved_pralds');

set(handles.uipanel4,'visible','on');
set(handles.text12,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\pralds\',name));


function pralds_max_Callback(hObject, eventdata, handles)
% hObject    handle to pralds_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pralds_max as text
%        str2double(get(hObject,'String')) returns contents of pralds_max as a double


% --- Executes during object creation, after setting all properties.
function pralds_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pralds_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
set(handles.uipanel1, 'visible','off');
set(handles.uipanel2, 'visible','on');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)

set(handles.error,'visible','off');



function file_name_pralds_Callback(hObject, eventdata, handles)
% hObject    handle to file_name_pralds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name_pralds as text
%        str2double(get(hObject,'String')) returns contents of file_name_pralds as a double


% --- Executes during object creation, after setting all properties.
function file_name_pralds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name_pralds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

set(handles.uipanel4,'visible','off');



function file_name_prbs_Callback(hObject, eventdata, handles)
% hObject    handle to file_name_prbs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name_prbs as text
%        str2double(get(hObject,'String')) returns contents of file_name_prbs as a double


% --- Executes during object creation, after setting all properties.
function file_name_prbs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name_prbs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
