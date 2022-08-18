function varargout = CUID_PreferencesManager(varargin)
% CUID_PREFERENCESMANAGER M-file for CUID_PreferencesManager.fig
%      CUID_PREFERENCESMANAGER, by itself, creates a new CUID_PREFERENCESMANAGER or raises the existing
%      singleton*.
%
%      H = CUID_PREFERENCESMANAGER returns the handle to a new CUID_PREFERENCESMANAGER or the handle to
%      the existing singleton*.
%
%      CUID_PREFERENCESMANAGER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_PREFERENCESMANAGER.M with the given input arguments.
%
%      CUID_PREFERENCESMANAGER('Property','Value',...) creates a new CUID_PREFERENCESMANAGER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_PreferencesManager_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_PreferencesManager_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_PreferencesManager

% Last Modified by GUIDE v2.5 17-Mar-2009 14:55:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_PreferencesManager_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_PreferencesManager_OutputFcn, ...
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


% --- Executes just before CUID_PreferencesManager is made visible.
function CUID_PreferencesManager_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CUID_PreferencesManager (see VARARGIN)

% Choose default command line output for CUID_PreferencesManager
handles.output = hObject;

% Create NiNoCal property in handles
handles.NiNoCal = 'No';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CUID_PreferencesManager wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CUID_PreferencesManager_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

varargout{1} = hObject;
varargout{2} = handles.output;
varargout{3} = handles.NiNoCal; 
delete(handles.figure1); 

% --- Executes on button press in m_ctrlLoad.
function m_ctrlLoad_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName, PathName] = uigetfile('*.mat', 'Select a preferences file', 'D:\BMED_Tools\REKLAB_exp\Preferences\Preferences.mat');

if isequal(FileName,0) || isequal(PathName,0)
else
    handles.output = [PathName FileName];
    handles.NiNoCal = 'No';
    uiresume;
end

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in m_ctrlNew.
function m_ctrlNew_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlNew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Preferences = CDS_Preferences; %Create new preferences object

%Populate preferences with template
Preferences = SetWorkspace( Preferences, 'D:\BMED_Tools\REKLAB_exp\Workspace.mat' );
Preferences = SetTrials( Preferences,'D:\Users\Your_Name\Trials');
Preferences = SetDataSets( Preferences,'D:\Users\Your_Name\DataSets'  );
Preferences = SetModel( Preferences, 'D:\Users\Your_Name\Models\Your_model.mdl' );
Preferences = SetMyGUI( Preferences, 'D:\Users\Your_Name\Your_GUI.m-OR-leave_blank' );
Preferences = SetOutputs( Preferences, 'D:\Users\Your_Name\Data' );
Preferences = SetSequence( Preferences,'D:\BMED_Tools\REKLAB_exp\REK_LAB_GUI\sandbox.m' );

Response = CUID_Preferences( Preferences );

% if Ok was clicked store the new settings
if ( isa( Response, 'CDS_Preferences' ) )

    Preferences = Response;

    [FileName, PathName] = uiputfile('*.mat', 'Save preferences file as:', 'D:\BMED_Tools\REKLAB_exp\Preferences\');

    if isequal(FileName,0) || isequal(PathName,0)
    else
        save([PathName FileName], 'Preferences')
        handles.output = [PathName FileName];
        handles.NiNoCal = 'No';
        uiresume;
    end
end

% Update handles structure
guidata(hObject, handles);
        
% --- Executes on button press in m_ctrlEdit.
function m_ctrlEdit_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName, PathName] = uigetfile('*.mat', 'Select a preferences file', 'D:\BMED_Tools\REKLAB_exp\Preferences\Preferences.mat');

load([PathName FileName] , 'Preferences' );

Response = CUID_Preferences( Preferences );

% if Ok was clicked store the new settings
if ( isa( Response, 'CDS_Preferences' ) )

    Preferences = Response;

    [FileName, PathName] = uiputfile('*.mat', 'Save preferences file as:', PathName);

    if isequal(FileName,0) || isequal(PathName,0)
    else
        save([PathName FileName], 'Preferences')
        handles.output = [PathName FileName];
        handles.NiNoCal = 'No';
        uiresume;
    end
end

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in m_ctrlDebug.
function m_ctrlDebug_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlDebug (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output = 'D:\bmed_tools\reklab_exp\Preferences\Preferences.mat';
handles.NiNoCal = 'Yes';
uiresume;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in m_ctrlHelp.
function m_ctrlHelp_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

web('UserGuide.htm');

