function varargout = AimIII(varargin)
% AIMIII MATLAB code for AimIII.fig
%      AIMIII, by itself, creates a new AIMIII or raises the existing
%      singleton*.
%
%      H = AIMIII returns the handle to a new AIMIII or the handle to
%      the existing singleton*.
%
%      AIMIII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AIMIII.M with the given input arguments.
%
%      AIMIII('Property','Value',...) creates a new AIMIII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AimIII_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AimIII_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AimIII

% Last Modified by GUIDE v2.5 24-Sep-2013 14:24:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AimIII_OpeningFcn, ...
                   'gui_OutputFcn',  @AimIII_OutputFcn, ...
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


% --- Executes just before AimIII is made visible.
function AimIII_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AimIII (see VARARGIN)

% Choose default command line output for AimIII
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AimIII wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AimIII_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pos_file_name_Callback(hObject, eventdata, handles)
% hObject    handle to pos_file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_file_name as text
%        str2double(get(hObject,'String')) returns contents of pos_file_name as a double


% --- Executes during object creation, after setting all properties.
function pos_file_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function pos_amp_Callback(hObject, eventdata, handles)
% hObject    handle to pos_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_amp as text
%        str2double(get(hObject,'String')) returns contents of pos_amp as a double


% --- Executes during object creation, after setting all properties.
function pos_amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in go_ext_input.
function go_ext_input_Callback(hObject, eventdata, handles)
% hObject    handle to go_ext_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function tq_file_name_Callback(hObject, eventdata, handles)
% hObject    handle to tq_file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tq_file_name as text
%        str2double(get(hObject,'String')) returns contents of tq_file_name as a double


% --- Executes during object creation, after setting all properties.
function tq_file_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tq_file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function buf_len_Callback(hObject, eventdata, handles)
% hObject    handle to buf_len (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buf_len as text
%        str2double(get(hObject,'String')) returns contents of buf_len as a double


% --- Executes during object creation, after setting all properties.
function buf_len_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buf_len (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
