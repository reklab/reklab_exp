function varargout = FatigueTest(varargin)
% FATIGUETEST M-file for FatigueTest.fig
%      FATIGUETEST, by itself, creates a new FATIGUETEST or raises the existing
%      singleton*.
%
%      H = FATIGUETEST returns the handle to a new FATIGUETEST or the handle to
%      the existing singleton*.
%
%      FATIGUETEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FATIGUETEST.M with the given input arguments.
%
%      FATIGUETEST('Property','Value',...) creates a new FATIGUETEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FatigueTest_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FatigueTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FatigueTest

% Last Modified by GUIDE v2.5 06-Dec-2006 13:57:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FatigueTest_OpeningFcn, ...
                   'gui_OutputFcn',  @FatigueTest_OutputFcn, ...
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


% --- Executes just before FatigueTest is made visible.
function FatigueTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FatigueTest (see VARARGIN)

% Choose default command line output for FatigueTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FatigueTest wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FatigueTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% varargout{1} = handles.fileREF;
% varargout{2} = handles.fileNEW;
% varargout{3} = handles.len;
% guidata(hObject,handles);

delete(handles.figure1);



function TrialPath_REFERENCE_Callback(hObject, eventdata, handles)
% hObject    handle to TrialPath_REFERENCE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TrialPath_REFERENCE as text
%        str2double(get(hObject,'String')) returns contents of TrialPath_REFERENCE as a double




% --- Executes during object creation, after setting all properties.
function TrialPath_REFERENCE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TrialPath_REFERENCE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FilePath_NEW_Callback(hObject, eventdata, handles)
% hObject    handle to FilePath_NEW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FilePath_NEW as text
%        str2double(get(hObject,'String')) returns contents of FilePath_NEW as a double





% --- Executes during object creation, after setting all properties.
function FilePath_NEW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FilePath_NEW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RealizationLength_Callback(hObject, eventdata, handles)
% hObject    handle to RealizationLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RealizationLength as text
%        str2double(get(hObject,'String')) returns contents of RealizationLength as a double


len = get(hObject,'String');
handles.len = len;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function RealizationLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RealizationLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.FileNew = get(handles.FilePath_NEW, 'String');
handles.FileRef = get(handles.TrialPath_REFERENCE, 'String');

handles.output = {handles.FileRef handles.FileNew handles.len}; 
guidata(hObject,handles);
uiresume(handles.figure1);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);




% --- Executes on button press in GetFileRef_Push.
function GetFileRef_Push_Callback(hObject, eventdata, handles)
% hObject    handle to GetFileRef_Push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FileFilter = '.mat';
% DefaultPath = ['S:\Biomed\REKLAB\REKLAB_Share\Heidi\Data\'];
DefaultPath = ['D:\Users\Heidi\Data\'];

[ strName, strPath ] = uigetfile( FileFilter , 'Reference File', DefaultPath );

if strName ~= 0
    strFullPath = [strPath, strName];
else
    strFullPath = [];
end
set(handles.TrialPath_REFERENCE, 'String', strFullPath)

guidata(hObject,handles)

% --- Executes on button press in GetFileNew_Push.
function GetFileNew_Push_Callback(hObject, eventdata, handles)
% hObject    handle to GetFileNew_Push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% DefaultPath = ['S:\Biomed\REKLAB\REKLAB_Share\Heidi\Data\'];
DefaultPath = ['D:\Users\Heidi\Data\'];
FileFilter = '.mat';

[ strName, strPath ] = uigetfile( FileFilter , 'New File', DefaultPath );
strFullPath = [strPath, strName];

if strName ~= 0
    strFullPath = [strPath, strName];
else
    strFullPath = [];
end
set(handles.FilePath_NEW, 'String', strFullPath)


guidata(hObject,handles)
