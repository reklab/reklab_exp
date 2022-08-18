function varargout = CUID_ExperimentParameters(varargin)
% CUID_ExperimentParameters class constructor.
% Dlg = CUID_ExperimentParameters
%   - creates a dialog with default experiment parameters
% Dlg = CUID_ExperimentParameter( CDS_ExperimentParameters obj )
%   - creates a dialog with parameters specified by obj
%
% Return 
%   - if OK is clicked we return a CDS_ExperimentParameters object
%     with the new values
%   - if CANCEL is click we return a string 'Canel'


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_ExperimentParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_ExperimentParameters_OutputFcn, ...
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
function CUID_ExperimentParameters_OpeningFcn(hObject, eventdata, handles, varargin)
%<
    % index of the input parameter
    PARAMETER_INDEX = 1;

    % total number of input parameters when you pass one input ( i.e. there is some GUI stuff that gets passed as well )
    PARAMETER_NUMBER = 4;

    
    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output
    handles.output = hObject;    

    % Update handles structure
    guidata(hObject, handles);

    % Only initialize once
    if strcmp(get(hObject,'Visible'),'off')
        
        % Set GUI to default values
        Initialize_GUIValues_Default( hObject, handles );
    
        
        % If we passed a CDS_ExperimentParameters object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            ExpParameters = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( ExpParameters,'CDS_ExperimentParameters' ) )
                Initialize_GUIValues_Parameters( hObject, handles, ExpParameters );        
            end

        end
    end
    
    % Model, so we have to wait on response
    uiwait(handles.figure1);
%>
    

% Command Line outputs
function varargout = CUID_ExperimentParameters_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    delete(handles.figure1);
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


% Callback for OK Button
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
% AD_Rate only variable parameter

    nADRate_Hz = str2double( get(handles.m_ctrlADRate_Hz, 'String' ) );
%     nADFilter_Hz = str2double( get(handles.m_ctrlADFilter_Hz, 'String' ) );
%     nDARate_Hz = str2double( get(handles.m_ctrlDARate_Hz, 'String' ) );
%     nDAFilter_Hz = str2double( get(handles.m_ctrlDAFilter_Hz, 'String' ) );
% 
%     dMinPositionLimit  = str2double( get( handles.m_ctrlMinPositionLimit, 'String' ) );
%     dMaxPositionLimit = str2double( get( handles.m_ctrlMaxPositionLimit, 'String' ) );
% 
%     nGSGain = get(handles.m_ctrlGSGain, 'Value' );
%     nTAGain = get(handles.m_ctrlTAGain, 'Value' );
%     dServoGain = str2double( get(handles.m_ctrlServoGain, 'String' ) );
    
    % return the new values
%     handles.output = CDS_ExperimentParameters( nADRate_Hz, nADFilter_Hz, nDARate_Hz, nDAFilter_Hz, dMinPositionLimit, dMaxPositionLimit, nGSGain, nTAGain, dServoGain );
handles.output = CDS_ExperimentParameters( nADRate_Hz );
    
    % Update handles structure
    guidata(hObject, handles);

    % Use UIRESUME instead of delete because the OutputFcn needs
    % to get the updated handles structure.
    uiresume(handles.figure1);
%>


% CallBack for CANCEL Button
function m_ctrlCancel_Callback(hObject, eventdata, handles)
%<
    % return 'Cancel'
    handles.output = get( hObject,'String' );

    % Update handles structure
    guidata(hObject, handles);

    % Use UIRESUME instead of delete because the OutputFcn needs
    % to get the updated handles structure.
    uiresume(handles.figure1);
%>


% Helper that sets up default GUI values
function Initialize_GUIValues_Default( fig_handle, handles )
%<
    nADRate_Hz = 1000;
%     nADFilter_Hz = 200;
%     nDARate_Hz = 200;
%     nDAFilter_Hz = 50;
% 
%     dMinPositionLimit = -0.5;
%     dMaxPositionLimit = 0.5;
% 
%     nGSGain = 1;
%     nTAGain = 1;
%     dServoGain = 1.635;


    set(handles.m_ctrlADRate_Hz, 'String', nADRate_Hz);
%     set(handles.m_ctrlADFilter_Hz, 'String', nADFilter_Hz);
%     set(handles.m_ctrlDARate_Hz, 'String', nDARate_Hz);
%     set(handles.m_ctrlDAFilter_Hz, 'String', nDAFilter_Hz);
% 
%     set(handles.m_ctrlMinPositionLimit, 'String', dMinPositionLimit);
%     set(handles.m_ctrlMaxPositionLimit, 'String', dMaxPositionLimit);
% 
%     set(handles.m_ctrlGSGain, 'Value', nGSGain);
%     set(handles.m_ctrlTAGain, 'Value', nTAGain);
%     set(handles.m_ctrlServoGain, 'String', dServoGain);    
%>


% Helper that sets up GUI values from the CDS_ExperimentParameters input
function Initialize_GUIValues_Parameters( fig_handle, handles, ExpParameters )
%<
    nADRate_Hz = GetADRate_Hz( ExpParameters );
%     nADFilter_Hz = GetADFilter_Hz( ExpParameters );
%     nDARate_Hz = GetDARate_Hz( ExpParameters );
%     nDAFilter_Hz = GetDAFilter_Hz( ExpParameters );
% 
%     dMinPositionLimit = GetMinPositionLimit( ExpParameters );
%     dMaxPositionLimit = GetMaxPositionLimit( ExpParameters );
% 
%     nGSGain = GetGSGain( ExpParameters );
%     nTAGain = GetTAGain( ExpParameters );
%     dServoGain = GetServoGain( ExpParameters );
% 
% 
    set(handles.m_ctrlADRate_Hz, 'String', nADRate_Hz);
%     set(handles.m_ctrlADFilter_Hz, 'String', nADFilter_Hz);
%     set(handles.m_ctrlDARate_Hz, 'String', nDARate_Hz);
%     set(handles.m_ctrlDAFilter_Hz, 'String', nDAFilter_Hz);
% 
%     set(handles.m_ctrlMinPositionLimit, 'String', dMinPositionLimit);
%     set(handles.m_ctrlMaxPositionLimit, 'String', dMaxPositionLimit);
% 
%     set(handles.m_ctrlGSGain, 'Value', nGSGain);
%     set(handles.m_ctrlTAGain, 'Value', nTAGain);
%     set(handles.m_ctrlServoGain, 'String', dServoGain);    
%>
