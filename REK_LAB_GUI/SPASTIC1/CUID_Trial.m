function varargout = CUID_Trial(varargin)
% CUID_TRIAL M-file for CUID_Trial.fig
%      CUID_TRIAL, by itself, creates a new CUID_TRIAL or raises the existing
%      singleton*.
%
%      H = CUID_TRIAL returns the handle to a new CUID_TRIAL or the handle to
%      the existing singleton*.
%
%      CUID_TRIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_TRIAL.M with the given input arguments.
%
%      CUID_TRIAL('Property','Value',...) creates a new CUID_TRIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Trial_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Trial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Trial

% Last Modified by GUIDE v2.5 05-Jun-2003 14:27:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Trial_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Trial_OutputFcn, ...
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
function CUID_Trial_OpeningFcn(hObject, eventdata, handles, varargin)
%<
% DL added document as input argument
handles.Document = varargin{1};

    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUID_Trial
    handles.output = hObject;

    % make a new data set for the trial
    %%PB%% handles.objTrial = CDS_RandomInput;
    %%PB%% RandomInput = CDS_RandomInput
    %%PB%% handles.objTrial = Ctrl_Continuous( RandomInput );
    ZeroInput = CDS_ZeroInput;
    Trial = Ctrl_Continuous( ZeroInput );
    handles.objTrial = Trial;
    
    % Update handles structure
    guidata(hObject, handles);

    % Only initialize once
    if strcmp(get(hObject,'Visible'),'off')
        
        % Set GUI to default values
        Initialize_GUIValues( hObject, handles );
    end
    
    % Model, so we have to wait on response
    uiwait(handles.figure1);
%>


% Initialize GUI based on Trial object
function Initialize_GUIValues( hObject, handles )
%<
    Trial = handles.objTrial;
    
    strName = GetName( Trial );
    dLength_s = GetLength_s( Trial );
    strParameters = AsString( Trial );
    
    set(handles.m_ctrlName, 'String', strName);
    set(handles.m_ctrlLength_s, 'String', dLength_s);
    set(handles.m_ctrlParameters, 'String', strParameters);
%>


% Command Line outputs
function varargout = CUID_Trial_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    delete(handles.figure1);
%>


% Callback for selection of a new trial type. We update GUI with the new selection
function m_ctrlTrialType_Callback(hObject, eventdata, handles)
%<
    %TODO: Add new trial types here and in the popup-meun 'String' property
    %       The enumeration corresponds to the order of the popup-meun
    %       options.
    
    ZEROLEVELS =          1;
    MVC =                 2;
    CONTINUOUS_RANDOM =   3;
    CONTINUOUS_SEQUENCE = 4;
    FILE =                5;
    TRIGGERED_PULSE =     6;
    PULSE_SEQUENCE =      7;
    
    nSelectedType = get( hObject, 'Value' );

    % Note: unlike C language, the 'switch' statement does not "fall through", thus we don't need any 'break' statements   
    switch nSelectedType
        
        case ZEROLEVELS
            % make a new data set for the trial
            ZeroInput = CDS_ZeroInput;
            Trial = Ctrl_Continuous( ZeroInput );
            handles.objTrial = Trial;
            
        case MVC
            % make a new data set for the trial
            ZeroInput = CDS_ZeroInput;
            Trial = Ctrl_Continuous( ZeroInput );
            handles.objTrial = Trial;
            
        case CONTINUOUS_RANDOM            
            % make a new data set for the trial
            RandomInput = CDS_RandomInput;
            Trial = Ctrl_Continuous( RandomInput );
            handles.objTrial = Trial;
            
            %%PB%% handles.objTrial = CDS_RandomInput;         
            
        case CONTINUOUS_SEQUENCE
            % make a new data set for the trial
            SequenceInput = CDS_SequenceInput;
            Trial = Ctrl_Continuous( SequenceInput );
            handles.objTrial = Trial;
            
            %%PB%% handles.objTrial = CDS_SequenceInput;    
            
        case FILE
            % make a new data set for the trial
            FileInput = CDS_FileInput;
            Trial = Ctrl_Continuous( FileInput );
            handles.objTrial = Trial;
            
        case TRIGGERED_PULSE
            % make a new data set for the trial
            PulseInput = CDS_PulseInput;
            Trial = Ctrl_Triggered( PulseInput );
            handles.objTrial = Trial;
            
        case PULSE_SEQUENCE
            % make a new data set for the trial
            PulseSequenceInput = CDS_PulseSequenceInput;
            Trial = Ctrl_Continuous( PulseSequenceInput );
            handles.objTrial = Trial;
    end
 
    % Update handles structure
    guidata(hObject, handles);

    % update the GUI
    Initialize_GUIValues( hObject, handles );
%>


% Callback for editing a trial
function m_ctrlEdit_Callback(hObject, eventdata, handles)
%<
    Trial = handles.objTrial;
    
    % Store current trial properties so that changes will be remembered
    % after editing
    strName = get( handles.m_ctrlName, 'String' );
    dLength_s = str2double( get( handles.m_ctrlLength_s, 'String' ) );
    
    Trial = SetName( Trial, strName );
    Trial = SetLength_s( Trial, dLength_s );
    
    handles.objTrial = Trial;
    guidata(hObject, handles);
    
    
    % Edit the trial properties
    EditedTrial = OpenProperties( Trial, handles.Document );

    % if Ok on edit properties save the new values
    %%PB%% if ( isa( EditedTrial, 'CDS_InputData' ) )
    if ( isa( EditedTrial, 'Ctrl_Trial' ) )    
    
        % set the new object
        handles.objTrial = EditedTrial;
        
        % Update handles structure
        guidata(hObject, handles);

        % update the GUI
        Initialize_GUIValues( hObject, handles );
    end
%>


% Callback for Create, returns the new trial
function m_ctrlCreate_Callback(hObject, eventdata, handles)
%<
    Trial = handles.objTrial;

    strName = get( handles.m_ctrlName, 'String' );
    dLength_s = str2double( get( handles.m_ctrlLength_s, 'String' ) );
    
    Trial = SetName( Trial, strName );
    Trial = SetLength_s( Trial, dLength_s );

    % generate the data set
    InputData = GetInputData( Trial );
    InputData = Generate( InputData );
    Trial = SetInputData( Trial, InputData );
    
    % return the new values
    handles.output = Trial;
    
    % Update handles structure
    guidata(hObject, handles);

    % resume modal
    uiresume(handles.figure1);    
%>


% Callback for Cancel
function m_ctrlCancel_Callback(hObject, eventdata, handles)
%<
    % return 'Canel'
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

