function varargout = CUID_Initialization(varargin)
% CUID_INITIALIZATION M-file for CUID_Initialization.fig
%      CUID_INITIALIZATION, by itself, creates a new CUID_INITIALIZATION or raises the existing
%      singleton*.
%
%      H = CUID_INITIALIZATION returns the handle to a new CUID_INITIALIZATION or the handle to
%      the existing singleton*.
%
%      CUID_INITIALIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_INITIALIZATION.M with the given input arguments.
%
%      CUID_INITIALIZATION('Property','Value',...) creates a new CUID_INITIALIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Initialization_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Initialization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Initialization

% Last Modified by GUIDE v2.5 23-Jul-2003 11:57:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Initialization_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Initialization_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% Figure Load initialization
function CUID_Initialization_OpeningFcn(hObject, eventdata, handles, varargin)
%<
    % index of the input parameter
    PARAMETER_INDEX = 1;

    % total number of input parameters when you pass one input ( i.e. there is some GUI stuff that gets passed as well )
    PARAMETER_NUMBER = 5;

    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUID_Random
    handles.output = hObject;

    % Name and Path for the Simulink model
    handles.strModelName = '';
    handles.strModelPath = '';

    % Initialization states
    %handles.nIsIODevicesInitialized = 0;
    %handles.nIsFiltersInitialized = 0;
    
    % Only initialize once
    if strcmp(get(hObject,'Visible'),'off')
                  
        % If we passed a CDS_ExperimentParameters object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            
            ExperimentParameters = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( ExperimentParameters, 'CDS_ExperimentParameters' ) )
                
                % set handle with new input parameter
                handles.objExperimentParameters = ExperimentParameters;
                
                % Update handles structure
                guidata(hObject, handles);
            end
            
            
            InitializedState = varargin{ PARAMETER_INDEX + 1 };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( InitializedState, 'CDS_InitializedState' ) )
                
                % set handle with new input parameter
                handles.InitializedState = InitializedState;
                
                % Update handles structure
                guidata(hObject, handles);
            end            
        end
    end
    
    % Model, so we have to wait on response
    uiwait(handles.figure1);    
%>


% Command Line outputs
function varargout = CUID_Initialization_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure

    varargout{1} = handles.InitializedState;
    delete(handles.figure1);
%>


% Callback to initialize the I/O Devices
function m_ctrlIODevices_Callback(hObject, eventdata, handles)
%<
    ExperimentParameters = handles.objExperimentParameters;
    Initializer = CIO_Initializer( ExperimentParameters );
    
    INITIALIZATION_MSG = 'Initializing I/O Devices...';
    set( handles.m_ctrlMsgIODevices, 'String', INITIALIZATION_MSG );

    strResponse = InitializeIODevices( Initializer );    

    %if successful response
    NOT_PRESSED_BUTTON = 0;
    set( handles.m_ctrlMsgIODevices, 'String', strResponse );    
    set( hObject, 'Value', NOT_PRESSED_BUTTON );
    
    InitializedState = handles.InitializedState
    InitializedState = SetIODevicesState( InitializedState, 1 );
    handles.InitializedState = InitializedState;
    guidata(hObject, handles);
%>


% Callback to initialize Filters
function m_ctrlInitializeFilters_Callback(hObject, eventdata, handles)
%<
    ExperimentParameters = handles.objExperimentParameters;
    Initializer = CIO_Initializer( ExperimentParameters );
    
    INITIALIZATION_MSG = 'Initializing Filters...';
    set( handles.m_ctrlMsgFilters, 'String', INITIALIZATION_MSG );

    strResponse = InitializeFilters( Initializer );    

    %if successful response
    NOT_PRESSED_BUTTON = 0;
    set( handles.m_ctrlMsgFilters, 'String', strResponse );    
    set( hObject, 'Value', NOT_PRESSED_BUTTON );
    
    InitializedState = handles.InitializedState
    InitializedState = SetFiltersState( InitializedState, 1 );
    handles.InitializedState = InitializedState;
    guidata(hObject, handles);
%>


% Callback for Canel
function m_ctrlCancel_Callback(hObject, eventdata, handles)
%<
    % return 'Canel'
    handles.output = get( hObject,'String' );

    % Update handles structure
    guidata(hObject, handles);

    % resume modal
    uiresume(handles.figure1);    
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    % return 'Ok'
    handles.output = get( hObject,'String' );

    % Update handles structure
    guidata(hObject, handles);

    % resume modal
    uiresume(handles.figure1);    
%>


% Close
function figure1_CloseRequestFcn(hObject, eventdata, handles)
%<
    if isequal(get(handles.figure1, 'waitstatus'), 'waiting')
        % The GUI is still in UIWAIT, us UIRESUME
        uiresume(handles.figure1);
    else
        % The GUI is no longer waiting, just close it
        delete(handles.figure1);
    end
%>


% Browse to find model
function m_ctrlFileDlg_Callback(hObject, eventdata, handles)
%<
    % Simulink model files only
    FileFilter = '*.mdl';
    
    % File browse dialog
    [ strModelName, strModelPath ] = uigetfile( FileFilter );
    strFullPath = [strModelPath, strModelName];
    
    %handles.strModelName = strModelName;
    %handles.strModelPath = strModelPath;
    
    set( handles.m_ctrlFilePath, 'String', strFullPath );
    
    guidata(hObject, handles);
%>


% Start the Simulink model
function m_ctrlLoadModel_Callback(hObject, eventdata, handles)
%<
    strFullPath = get( handles.m_ctrlFilePath, 'String' )
    start_control( strFullPath );
%>

