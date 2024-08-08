function varargout = CUID_PIDController(varargin)
% CUID_PIDCONTROLLER M-file for CUID_PIDController.fig
%      CUID_PIDCONTROLLER, by itself, creates a new CUID_PIDCONTROLLER or raises the existing
%      singleton*.
%
%      H = CUID_PIDCONTROLLER returns the handle to a new CUID_PIDCONTROLLER or the handle to
%      the existing singleton*.
%
%      CUID_PIDCONTROLLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_PIDCONTROLLER.M with the given input arguments.
%
%      CUID_PIDCONTROLLER('Property','Value',...) creates a new CUID_PIDCONTROLLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_PIDController_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_PIDController_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_PIDController

% Last Modified by GUIDE v2.5 20-Aug-2004 13:27:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_PIDController_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_PIDController_OutputFcn, ...
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
function CUID_PIDController_OpeningFcn(hObject, eventdata, handles, varargin)
%<
    % index of the input parameter
    PARAMETER_INDEX = 1;

    % total number of input parameters when you pass one input ( i.e. there is some GUI stuff that gets passed as well )
    PARAMETER_NUMBER = 4;

    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUID_Preferences
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);
    
    
    % Only initialize once
    if strcmp(get(hObject,'Visible'),'off')
                  
        % If we passed a CDS_Preferences object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            PIDController = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( PIDController, 'CDS_PIDController' ) )
                
                % set handle with new input parameter
                handles.PIDController = PIDController;
                
                % Update handles structure
                guidata(hObject, handles);
    
                % update the GUI
                Initialize_GUIValues( hObject, handles );        
            end
        end
    end
    
    
    % We have to wait on response
    uiwait(handles.figure1);    
%>


% Initialize GUI based on Trial object
function Initialize_GUIValues( hObject, handles )
%<
    PIDController = handles.PIDController;
    
    dLProportionalGain = GetLProportionalGain( PIDController );
    dLProportionalGain2 = GetLProportionalGain2( PIDController );
    dLIntegralGain = GetLIntegralGain( PIDController );
    dLDifferentialGain = GetLDifferentialGain( PIDController );

    dRProportionalGain = GetRProportionalGain( PIDController );
    dRProportionalGain2 = GetRProportionalGain2( PIDController );
    dRIntegralGain = GetRIntegralGain( PIDController );
    dRDifferentialGain = GetRDifferentialGain( PIDController );
    
    
    set(handles.m_ctrlLProportionalGain, 'String', dLProportionalGain);
    set(handles.m_ctrlLProportionalGain2, 'String', dLProportionalGain2);
    set(handles.m_ctrlLIntegralGain, 'String', dLIntegralGain)
    set(handles.m_ctrlLDifferentialGain, 'String', dLDifferentialGain);
    
    set(handles.m_ctrlRProportionalGain, 'String', dRProportionalGain);
    set(handles.m_ctrlRProportionalGain2, 'String', dRProportionalGain2);
    set(handles.m_ctrlRIntegralGain, 'String', dRIntegralGain);
    set(handles.m_ctrlRDifferentialGain, 'String', dRDifferentialGain);
%>


% Command line outputs
function varargout = CUID_PIDController_OutputFcn(hObject, eventdata, handles)
%<
    varargout{1} = handles.output;
    delete(handles.figure1);
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    PIDController = handles.PIDController;
    
    dLProportionalGain = str2double( get(handles.m_ctrlLProportionalGain, 'String') );
    dLProportionalGain2 = str2double( get(handles.m_ctrlLProportionalGain2, 'String') );
    dLIntegralGain = str2double( get(handles.m_ctrlLIntegralGain, 'String') );
    dLDifferentialGain = str2double( get(handles.m_ctrlLDifferentialGain, 'String') );
    
    dRProportionalGain = str2double( get(handles.m_ctrlRProportionalGain, 'String') );
    dRProportionalGain2 = str2double( get(handles.m_ctrlRProportionalGain2, 'String') );
    dRIntegralGain = str2double( get(handles.m_ctrlRIntegralGain, 'String') );
    dRDifferentialGain = str2double( get(handles.m_ctrlRDifferentialGain, 'String') );

    
    PIDController = SetLProportionalGain( PIDController, dLProportionalGain );
    PIDController = SetLProportionalGain2( PIDController, dLProportionalGain2 );
    PIDController = SetLIntegralGain( PIDController, dLIntegralGain );
    PIDController = SetLDifferentialGain( PIDController, dLDifferentialGain );
    
    PIDController = SetRProportionalGain( PIDController, dRProportionalGain );
    PIDController = SetRProportionalGain2( PIDController, dRProportionalGain2 );
    PIDController = SetRIntegralGain( PIDController, dRIntegralGain );
    PIDController = SetRDifferentialGain( PIDController, dRDifferentialGain );
    
    % return the new values
    handles.output = PIDController;
    
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


% Callback for Close
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


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


