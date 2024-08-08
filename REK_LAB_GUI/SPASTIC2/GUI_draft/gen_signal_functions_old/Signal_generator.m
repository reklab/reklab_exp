function varargout = Signal_generator(varargin)
% SIGNAL_GENERATOR MATLAB code for Signal_generator.fig
%      SIGNAL_GENERATOR, by itself, creates a new SIGNAL_GENERATOR or raises the existing
%      singleton*.
%
%      H = SIGNAL_GENERATOR returns the handle to a new SIGNAL_GENERATOR or the handle to
%      the existing singleton*.
%
%      SIGNAL_GENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGNAL_GENERATOR.M with the given input arguments.
%
%      SIGNAL_GENERATOR('Property','Value',...) creates a new SIGNAL_GENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Signal_generator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Signal_generator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Signal_generator

% Last Modified by GUIDE v2.5 16-Aug-2019 14:49:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Signal_generator_OpeningFcn, ...
                   'gui_OutputFcn',  @Signal_generator_OutputFcn, ...
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


% --- Executes just before Signal_generator is made visible.
function Signal_generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Signal_generator (see VARARGIN)

% Choose default command line output for Signal_generator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Signal_generator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Signal_generator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

set(handles.piecewise_panel, 'visible','off');
set(handles.uipanel1, 'visible','on');
set(handles.uipanel2, 'visible','off');
set(handles.uipanel3, 'visible','off');
set(handles.p_ramp_PANEL, 'visible','off');
set(handles.random_delay_ramp_panel, 'visible','off');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1, 'visible','off');
set(handles.uipanel2, 'visible','on');
set(handles.uipanel3, 'visible','off');
set(handles.p_ramp_PANEL, 'visible','off');
set(handles.piecewise_panel, 'visible','off');
set(handles.random_delay_ramp_panel, 'visible','off');
% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.piecewise_panel, 'visible','off');
set(handles.uipanel1, 'visible','off');
set(handles.uipanel2, 'visible','off');
set(handles.uipanel3, 'visible','on');
set(handles.p_ramp_PANEL, 'visible','off');
set(handles.random_delay_ramp_panel, 'visible','off');


function sin_freq_Callback(hObject, eventdata, handles)
% hObject    handle to sin_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sin_freq as text
%        str2double(get(hObject,'String')) returns contents of sin_freq as a double


% --- Executes during object creation, after setting all properties.
function sin_freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sin_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sin_amp_Callback(hObject, eventdata, handles)
% hObject    handle to sin_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sin_amp as text
%        str2double(get(hObject,'String')) returns contents of sin_amp as a double


% --- Executes during object creation, after setting all properties.
function sin_amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sin_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sin_generate.
function sin_generate_Callback(hObject, eventdata, handles)
sin_amp_val=str2double(get(handles.sin_amp,'string'));
sin_freq_val=str2double(get(handles.sin_freq,'string'));
sin_duration_val=str2double(get(handles.sin_duration,'string'));

sin_ans=gen_sinousoidal(sin_freq_val,sin_amp_val,sin_duration_val);
sin_amp=sin_ans(2,:);
sin_time=sin_ans(1,:);
plot(sin_time,sin_amp,'Linewidth',2,'Parent',handles.axes1);
xlabel('Time (s)','Parent',handles.axes1);
ylabel('Position (rad)','Parent',handles.axes1);

if sin_duration_val > 10
    
set(handles.axes1,'XLim',[0,10]);

end

set(gca,'FontSize',20);

saved_sin=struct('Sig',sin_ans,'sin_freq',sin_freq_val,'sin_amp',sin_amp_val,'Duration',sin_duration_val);


setappdata(0,'saved_sin',saved_sin);

p_1=num2str(sin_amp_val);
p_2=num2str(sin_freq_val);
p_3=num2str(sin_duration_val);
prefix=['sin__' p_1 '__' p_2 '__' p_3 '__' ];

prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');
setappdata(0,'sin_prefix',prefix);


% --- Executes on button press in sin_save.
function sin_save_Callback(hObject, eventdata, handles)

saved_sin=getappdata(0,'saved_sin');


name=get(handles.file_name_sin,'string');
sin_prefix=char(getappdata(0,'sin_prefix'));
name=char(name);
name=[sin_prefix name];
save(strcat('D:\Users\Ali_R\GUI_draft\saved\sin\',name),'saved_sin');

set(handles.uipanel9,'visible','on');
set(handles.text51,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\sin\',name));




function sin_duration_Callback(hObject, eventdata, handles)
% hObject    handle to sin_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sin_duration as text
%        str2double(get(hObject,'String')) returns contents of sin_duration as a double


% --- Executes during object creation, after setting all properties.
function sin_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sin_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ramp_and_hold_initial_value_Callback(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_initial_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ramp_and_hold_initial_value as text
%        str2double(get(hObject,'String')) returns contents of ramp_and_hold_initial_value as a double


% --- Executes during object creation, after setting all properties.
function ramp_and_hold_initial_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_initial_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ramp_and_hold_final_value_Callback(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_final_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ramp_and_hold_final_value as text
%        str2double(get(hObject,'String')) returns contents of ramp_and_hold_final_value as a double


% --- Executes during object creation, after setting all properties.
function ramp_and_hold_final_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_final_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ramp_and_hold_slope_Callback(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_slope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ramp_and_hold_slope as text
%        str2double(get(hObject,'String')) returns contents of ramp_and_hold_slope as a double


% --- Executes during object creation, after setting all properties.
function ramp_and_hold_slope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_slope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ramp_and_hold_initial_hold_duration_Callback(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_initial_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ramp_and_hold_initial_hold_duration as text
%        str2double(get(hObject,'String')) returns contents of ramp_and_hold_initial_hold_duration as a double


% --- Executes during object creation, after setting all properties.
function ramp_and_hold_initial_hold_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_initial_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ramp_and_hold_final_hold_duration_Callback(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_final_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ramp_and_hold_final_hold_duration as text
%        str2double(get(hObject,'String')) returns contents of ramp_and_hold_final_hold_duration as a double


% --- Executes during object creation, after setting all properties.
function ramp_and_hold_final_hold_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ramp_and_hold_final_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ramp_and_hold_generate.
function ramp_and_hold_generate_Callback(hObject, eventdata, handles)
fs=1000;
initial_value_val=str2double(get(handles.ramp_and_hold_initial_value,'string'));
final_value_val=str2double(get(handles.ramp_and_hold_final_value,'string'));
slope_val=str2double(get(handles.ramp_and_hold_slope,'string'));
ramp_and_hold_initial_hold_duration_val=str2double(get(handles.ramp_and_hold_initial_hold_duration,'string'));
ramp_and_hold_final_hold_duration_val=str2double(get(handles.ramp_and_hold_final_hold_duration,'string'));

if initial_value_val>final_value_val
    if slope_val>0
      slope_val=slope_val.*-1;
    end
end

if initial_value_val~=final_value_val
    
        ramp_ans=gen_ramp_and_hold(initial_value_val,final_value_val,slope_val,ramp_and_hold_initial_hold_duration_val,ramp_and_hold_final_hold_duration_val);
else
        ramp_ans=zeros(1,10000);
        time_f=(0:1/1000:10-1/1000);
        ramp_ans=[time_f;ramp_ans];
end

    
ramp_amp=ramp_ans(2,:);
ramp_time=ramp_ans(1,:);
duration=size(ramp_amp,2)/fs;






grid on
plot(ramp_time,ramp_amp,'Linewidth',2,'Parent',handles.axes2);

if duration > 10
    
set(handles.axes2,'XLim',[0,10]);

end
max_l=max(abs(final_value_val),abs(initial_value_val))*1.5;
xlabel('Time (s)','Parent',handles.axes2);
ylabel('Position (rad)','Parent',handles.axes2);

ramp_saved=struct('Sig',ramp_ans,'Initial_value',initial_value_val,'Final_value',final_value_val,'Slope',slope_val,'Initial_hold',ramp_and_hold_initial_hold_duration_val,'Final_hold',ramp_and_hold_final_hold_duration_val,'Duration',duration);
setappdata(0,'ramp_saved',ramp_saved);

p_1=num2str(initial_value_val);
p_2=num2str(final_value_val);
p_3=num2str(slope_val);
p_4=num2str(ramp_and_hold_initial_hold_duration_val);
p_5=num2str(ramp_and_hold_final_hold_duration_val);
p_6=num2str(duration);

prefix=['ramp&hold__' p_1 '__' p_2 '__' p_3 '__' p_4 '__' p_5 '__' p_6 '__'];

prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');
setappdata(0,'ramp_prefix',prefix);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)

ramp_saved=getappdata(0,'ramp_saved');


name=get(handles.file_name_ramp,'string');
ramp_prefix=char(getappdata(0,'ramp_prefix'));
name=char(name);
name=[ramp_prefix name];
save(strcat('D:\Users\Ali_R\GUI_draft\saved\ramp\',name),'ramp_saved');

set(handles.uipanel9,'visible','on');
set(handles.text51,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\ramp_saved\',name));





function walking_trajectory_ROM_low_Callback(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_ROM_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of walking_trajectory_ROM_low as text
%        str2double(get(hObject,'String')) returns contents of walking_trajectory_ROM_low as a double


% --- Executes during object creation, after setting all properties.
function walking_trajectory_ROM_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_ROM_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function walking_trajectory_frequency_Callback(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of walking_trajectory_frequency as text
%        str2double(get(hObject,'String')) returns contents of walking_trajectory_frequency as a double


% --- Executes during object creation, after setting all properties.
function walking_trajectory_frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function walking_trajectory_duration_Callback(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of walking_trajectory_duration as text
%        str2double(get(hObject,'String')) returns contents of walking_trajectory_duration as a double


% --- Executes during object creation, after setting all properties.
function walking_trajectory_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function walking_trajectory_ROM_high_Callback(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_ROM_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of walking_trajectory_ROM_high as text
%        str2double(get(hObject,'String')) returns contents of walking_trajectory_ROM_high as a double


% --- Executes during object creation, after setting all properties.
function walking_trajectory_ROM_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to walking_trajectory_ROM_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in walking_trajectory_generate.
function walking_trajectory_generate_Callback(hObject, eventdata, handles)
ROM_low=str2double(get(handles.walking_trajectory_ROM_low,'string'));
ROM_high=str2double(get(handles.walking_trajectory_ROM_high,'string'));
walking_trajectory_period_val=str2double(get(handles.walking_trajectory_frequency,'string'));
walking_trajectory_duration_val=str2double(get(handles.walking_trajectory_duration,'string'));
walk_ans=gen_walking_trajectory(ROM_low,ROM_high,walking_trajectory_period_val,walking_trajectory_duration_val);
walk_amp=walk_ans(2,:);
walk_time=walk_ans(1,:);
plot(walk_time,walk_amp,'Linewidth',2,'Parent',handles.axes4);

if walking_trajectory_duration_val > 10
    
set(handles.axes4,'XLim',[0,10]);

end

xlabel('Time (s)','Parent',handles.axes4);
ylabel('Position (rad)','Parent',handles.axes4);


walk_saved=struct('Sig',walk_ans,'walk_ROM_low',ROM_low,'walk_ROM_high',ROM_high,'walk_period',walking_trajectory_period_val,'Duration',walking_trajectory_duration_val);
setappdata(0,'walk_saved',walk_saved);

p_1=num2str(ROM_low);
p_2=num2str(ROM_high);
p_3=num2str(walking_trajectory_period_val);
p_4=num2str(walking_trajectory_duration_val);
prefix=['walk__' p_1 '__' p_2 '__' p_3 '__' p_4 '__'];

prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');
setappdata(0,'walk_prefix',prefix);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)



walk_saved=getappdata(0,'walk_saved');


name=get(handles.file_name_walk,'string');
walk_prefix=char(getappdata(0,'walk_prefix'));
name=char(name);
name=[walk_prefix name];

save(strcat('D:\Users\Ali_R\GUI_draft\saved\walk\',name),'walk_saved');

set(handles.uipanel9,'visible','on');
set(handles.text51,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\walk\',name));

% --- Executes on button press in p_ramp_TAB.
function p_ramp_TAB_Callback(hObject, eventdata, handles)
set(handles.piecewise_panel, 'visible','off');
set(handles.uipanel1, 'visible','off');
set(handles.uipanel2, 'visible','off');
set(handles.uipanel3, 'visible','off');
set(handles.p_ramp_PANEL, 'visible','on');
set(handles.random_delay_ramp_panel, 'visible','off');
% --- Executes on button press in radiobutton1
% --- Executes on button press in p_ramp_GENERATE.

function p_ramp_GENERATE_Callback(hObject, eventdata, handles)

initial_value_val=str2double(get(handles.p_ramp_initial_value,'string'));
final_value_val=str2double(get(handles.p_ramp_final_value,'string'));
slope_val=str2double(get(handles.p_ramp_slope,'string'));
period=str2double(get(handles.p_ramp_period,'string'));
duration=str2double(get(handles.p_ramp_duration,'string'));

[periodic_ramp_ans min_period]=gen_periodic_ramp_and_hold(initial_value_val,final_value_val,slope_val,period,duration);

periodic_ramp_amp=periodic_ramp_ans(2,:);
periodic_ramp_time=periodic_ramp_ans(1,:);

plot(periodic_ramp_time,periodic_ramp_amp,'Linewidth',2,'Parent',handles.p_ramp_AXES);

xlabel('Time (s)','Parent',handles.p_ramp_AXES);
ylabel('Position (rad)','Parent',handles.p_ramp_AXES);


if duration > 10
    
set(handles.p_ramp_AXES,'XLim',[0,10]);


end


min_period_str=num2str(min_period);
min_period_str=[min_period_str ' (s)'];

set(handles.text41,'String',min_period_str);

if period < min_period
set(handles.error, 'visible','on');

end

periodic_ramp_saved=struct('Sig',periodic_ramp_ans,'Initial_value',initial_value_val,'Final_value',final_value_val,'Slope',slope_val,'Period',period,'Duration',duration);

setappdata(0,'periodic_ramp_saved',periodic_ramp_saved);

p_1=num2str(initial_value_val);
p_2=num2str(final_value_val);
p_3=num2str(slope_val);
p_4=num2str(period);
p_5=num2str(duration);
prefix=['p_ramp__' p_1 '__' p_2 '__' p_3 '__' p_4 '__' p_5 '__'];
prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');
setappdata(0,'p_ramp_prefix',prefix);


function p_ramp_SAVE_Callback(hObject, eventdata, handles)

periodic_ramp_saved=getappdata(0,'periodic_ramp_saved');

name=get(handles.file_name_p_ramp,'string');
p_ramp_prefix=char(getappdata(0,'p_ramp_prefix'));
name=char(name);
name=[p_ramp_prefix name];

save(strcat('D:\Users\Ali_R\GUI_draft\saved\periodic_ramp\',name),'periodic_ramp_saved');

set(handles.uipanel9,'visible','on');
set(handles.text51,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\periodic_ramp\',name));



function p_ramp_duration_Callback(hObject, eventdata, handles)
% hObject    handle to p_ramp_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_ramp_duration as text
%        str2double(get(hObject,'String')) returns contents of p_ramp_duration as a double


% --- Executes during object creation, after setting all properties.
function p_ramp_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_ramp_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_ramp_period_Callback(hObject, eventdata, handles)
% hObject    handle to p_ramp_period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_ramp_period as text
%        str2double(get(hObject,'String')) returns contents of p_ramp_period as a double


% --- Executes during object creation, after setting all properties.
function p_ramp_period_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_ramp_period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_ramp_initial_value_Callback(hObject, eventdata, handles)
% hObject    handle to p_ramp_initial_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_ramp_initial_value as text
%        str2double(get(hObject,'String')) returns contents of p_ramp_initial_value as a double


% --- Executes during object creation, after setting all properties.
function p_ramp_initial_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_ramp_initial_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_ramp_final_value_Callback(hObject, eventdata, handles)
% hObject    handle to p_ramp_final_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_ramp_final_value as text
%        str2double(get(hObject,'String')) returns contents of p_ramp_final_value as a double


% --- Executes during object creation, after setting all properties.
function p_ramp_final_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_ramp_final_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_ramp_slope_Callback(hObject, eventdata, handles)
% hObject    handle to p_ramp_slope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_ramp_slope as text
%        str2double(get(hObject,'String')) returns contents of p_ramp_slope as a double


% --- Executes during object creation, after setting all properties.
function p_ramp_slope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_ramp_slope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
set(handles.error, 'visible','off');



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in piecewise.
function piecewise_Callback(hObject, eventdata, handles)

set(handles.uipanel1, 'visible','off');
set(handles.uipanel2, 'visible','off');
set(handles.uipanel3, 'visible','off');
set(handles.p_ramp_PANEL, 'visible','off');
set(handles.piecewise_panel, 'visible','on');
set(handles.random_delay_ramp_panel, 'visible','off');



% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
max_pf=str2double(get(handles.maxpf,'string'));
max_df=str2double(get(handles.maxdf,'string'));
min_hold_duration=str2double(get(handles.min_hold_duration,'string'));
max_hold_duration=str2double(get(handles.max_hold_duration,'string'));
duration=str2double(get(handles.duration,'string'));

piecewise_sig=gen_piecewise_const(max_pf,max_df,min_hold_duration,max_hold_duration,duration);

piecewise_sig_amp=piecewise_sig(2,:);
piecewise_sig_time=piecewise_sig(1,:);

plot(piecewise_sig_time,piecewise_sig_amp,'Linewidth',2,'Parent',handles.axes7);

piecewise_saved=struct('Sig',piecewise_sig,'max_pf',max_pf,'max_df',max_df,'min_hold_duration',min_hold_duration,'max_hold_duration',max_hold_duration,'Duration',duration);

setappdata(0,'piecewise_saved',piecewise_saved);

p_1=num2str(max_pf);
p_2=num2str(max_df);
p_3=num2str(min_hold_duration);
p_4=num2str(max_hold_duration);
p_5=num2str(duration);
prefix=['piecewise__' p_1 '__' p_2 '__' p_3 '__' p_4 '__' p_5 '__'];
prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');

setappdata(0,'piecewise_prefix',prefix);



% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)

piecewise_saved=getappdata(0,'piecewise_saved');


name=get(handles.file_name,'string');
piecewise_prefix=char(getappdata(0,'piecewise_prefix'));
name=char(name);
name=[piecewise_prefix name];

save(strcat('D:\Users\Ali_R\GUI_draft\saved\piecewise_const\',name),'piecewise_saved');

set(handles.uipanel9,'visible','on');
set(handles.text51,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\piecewise_const\',name));


function max_hold_duration_Callback(hObject, eventdata, handles)
% hObject    handle to max_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_hold_duration as text
%        str2double(get(hObject,'String')) returns contents of max_hold_duration as a double


% --- Executes during object creation, after setting all properties.
function max_hold_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function duration_Callback(hObject, eventdata, handles)
% hObject    handle to duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duration as text
%        str2double(get(hObject,'String')) returns contents of duration as a double


% --- Executes during object creation, after setting all properties.
function duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxpf_Callback(hObject, eventdata, handles)
% hObject    handle to maxpf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxpf as text
%        str2double(get(hObject,'String')) returns contents of maxpf as a double


% --- Executes during object creation, after setting all properties.
function maxpf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxpf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxdf_Callback(hObject, eventdata, handles)
% hObject    handle to maxdf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxdf as text
%        str2double(get(hObject,'String')) returns contents of maxdf as a double


% --- Executes during object creation, after setting all properties.
function maxdf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxdf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_hold_duration_Callback(hObject, eventdata, handles)
% hObject    handle to min_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_hold_duration as text
%        str2double(get(hObject,'String')) returns contents of min_hold_duration as a double


% --- Executes during object creation, after setting all properties.
function min_hold_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_hold_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_name_Callback(hObject, eventdata, handles)
% hObject    handle to file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name as text
%        str2double(get(hObject,'String')) returns contents of file_name as a double


% --- Executes during object creation, after setting all properties.
function file_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)

set(handles.uipanel9,'visible','off');



function file_name_sin_Callback(hObject, eventdata, handles)
% hObject    handle to file_name_sin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name_sin as text
%        str2double(get(hObject,'String')) returns contents of file_name_sin as a double


% --- Executes during object creation, after setting all properties.
function file_name_sin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name_sin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_name_p_ramp_Callback(hObject, eventdata, handles)
% hObject    handle to file_name_p_ramp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name_p_ramp as text
%        str2double(get(hObject,'String')) returns contents of file_name_p_ramp as a double


% --- Executes during object creation, after setting all properties.
function file_name_p_ramp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name_p_ramp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_name_walk_Callback(hObject, eventdata, handles)
% hObject    handle to file_name_walk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name_walk as text
%        str2double(get(hObject,'String')) returns contents of file_name_walk as a double


% --- Executes during object creation, after setting all properties.
function file_name_walk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name_walk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_name_ramp_Callback(hObject, eventdata, handles)
% hObject    handle to file_name_ramp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name_ramp as text
%        str2double(get(hObject,'String')) returns contents of file_name_ramp as a double


% --- Executes during object creation, after setting all properties.
function file_name_ramp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name_ramp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)

set(handles.uipanel1, 'visible','off');
set(handles.uipanel2, 'visible','off');
set(handles.uipanel3, 'visible','off');
set(handles.p_ramp_PANEL, 'visible','off');
set(handles.piecewise_panel, 'visible','off');
set(handles.random_delay_ramp_panel, 'visible','on');


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)

initial_value=str2double(get(handles.edit47,'string'));
final_value=str2double(get(handles.edit48,'string'));
slope=str2double(get(handles.edit49,'string'));

if initial_value>final_value
    if slope>0
      slope=slope.*-1;
    end
end

duration=str2double(get(handles.edit45,'string'));
min_delay=str2double(get(handles.edit51,'string'));
max_delay=str2double(get(handles.edit52,'string'));

random_delay_ramp_and_hold=gen_random_delay_ramp(initial_value,final_value,slope,min_delay,max_delay,duration);
size(random_delay_ramp_and_hold)
random_delay_ramp_amp=random_delay_ramp_and_hold(2,:);
random_delay_ramp_time=random_delay_ramp_and_hold(1,:);

plot(random_delay_ramp_time,random_delay_ramp_amp,'Linewidth',2,'Parent',handles.axes8);
xlabel('Time (s)','Parent',handles.axes8);
ylabel('Position (rad)','Parent',handles.axes8);
random_delay_ramp_saved=struct('Sig',random_delay_ramp_and_hold,'Initial_value',initial_value,'Final_value',final_value,'Slope',slope,'Min_delay',min_delay,'Max_delay',max_delay,'Duration',duration);

setappdata(0,'random_delay_ramp_saved',random_delay_ramp_saved);

p_1=num2str(initial_value);
p_2=num2str(final_value);
p_3=num2str(slope);
p_4=num2str(min_delay);
p_5=num2str(max_delay);
p_6=num2str(duration);

prefix=['r_ramp__' p_1 '__' p_2 '__' p_3 '__' p_4 '__' p_5 '__'];
prefix=strrep(prefix,'.','_');
prefix=strrep(prefix,'-','N');
setappdata(0,'r_ramp_prefix',prefix);

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)

random_delay_ramp=getappdata(0,'random_delay_ramp_saved');

name=get(handles.file_name_dramp,'string');

r_ramp_prefix=char(getappdata(0,'r_ramp_prefix'));
name=char(name);
name=[r_ramp_prefix name];

save(strcat('D:\Users\Ali_R\GUI_draft\saved\random_delay_ramp_and_hold\',name),'random_delay_ramp');

set(handles.uipanel9,'visible','on');
set(handles.text51,'string',strcat('D:\Users\Ali_R\GUI_draft\saved\random_delay_ramp_and_hold\',name));



function edit45_Callback(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit45 as text
%        str2double(get(hObject,'String')) returns contents of edit45 as a double


% --- Executes during object creation, after setting all properties.
function edit45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit46_Callback(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit46 as text
%        str2double(get(hObject,'String')) returns contents of edit46 as a double


% --- Executes during object creation, after setting all properties.
function edit46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit47_Callback(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit47 as text
%        str2double(get(hObject,'String')) returns contents of edit47 as a double


% --- Executes during object creation, after setting all properties.
function edit47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit48_Callback(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit48 as text
%        str2double(get(hObject,'String')) returns contents of edit48 as a double


% --- Executes during object creation, after setting all properties.
function edit48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit49 as text
%        str2double(get(hObject,'String')) returns contents of edit49 as a double


% --- Executes during object creation, after setting all properties.
function edit49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_name_dramp_Callback(hObject, eventdata, handles)
% hObject    handle to file_name_dramp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name_dramp as text
%        str2double(get(hObject,'String')) returns contents of file_name_dramp as a double


% --- Executes during object creation, after setting all properties.
function file_name_dramp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name_dramp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit51_Callback(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit51 as text
%        str2double(get(hObject,'String')) returns contents of edit51 as a double


% --- Executes during object creation, after setting all properties.
function edit51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function p_ramp_AXES_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_ramp_AXES (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate p_ramp_AXES


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)

set(handles.a, 'visible','off');


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function a_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
