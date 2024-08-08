function varargout = CUID_Sequence(varargin)
% CUID_SEQUENCE M-file for CUID_Sequence.fig
%      CUID_SEQUENCE, by itself, creates a new CUID_SEQUENCE or raises the existing
%      singleton*.
%
%      H = CUID_SEQUENCE returns the handle to a new CUID_SEQUENCE or the handle to
%      the existing singleton*.
%
%      CUID_SEQUENCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_SEQUENCE.M with the given input arguments.
%
%      CUID_SEQUENCE('Property','Value',...) creates a new CUID_SEQUENCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Sequence_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Sequence_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Sequence

% Last Modified by GUIDE v2.5 30-Jul-2004 15:34:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Sequence_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Sequence_OutputFcn, ...
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
function CUID_Sequence_OpeningFcn(hObject, eventdata, handles, varargin)
%<
    % index of the input parameter
    PARAMETER_INDEX = 1;

    % total number of input parameters when you pass one input ( i.e. there is some GUI stuff that gets passed as well )
    PARAMETER_NUMBER = 4;

    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUID_Random
    handles.output = hObject;


    % Only initialize once
    if strcmp(get(hObject,'Visible'),'off')
                  
        % If we passed a CDS_Sequence object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            SequenceInput = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( SequenceInput, 'CDS_SequenceInput' ) )
                
                % set handle with new input parameter
                handles.objTrial = SequenceInput;
                
                % Update handles structure
                guidata(hObject, handles);
    
                % update the GUI
                Initialize_GUIValues( hObject, handles );        
            end

        end
    end
    
    % Model, so we have to wait on response
    uiwait(handles.figure1);    
%>


% Initialize GUI based on Trial object
function Initialize_GUIValues( hObject, handles )    
%<
    SequenceInput = handles.objTrial;
    
    dAmplitude = GetAmplitude( SequenceInput );
    dInterval_ms = GetInterval_ms( SequenceInput );
    dLength_s = GetLength_s( SequenceInput );
    dBandWidth_Hz = GetBandWidth_Hz( SequenceInput );
    
    set(handles.m_ctrlAmplitude, 'String', dAmplitude);
    set(handles.m_ctrlInterval_ms, 'String', dInterval_ms);    
    set(handles.m_ctrlLength_s, 'String', dLength_s);
    set(handles.m_ctrlBandWidth_Hz, 'String', dBandWidth_Hz);
%>


% Command Line outputs
function varargout = CUID_Sequence_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    delete(handles.figure1);
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    SequenceInput = handles.objTrial;

    dAmplitude = str2double( get( handles.m_ctrlAmplitude, 'String' ) );
    dInterval_ms = str2double( get( handles.m_ctrlInterval_ms, 'String' ) );
    dLength_s = str2double( get( handles.m_ctrlLength_s, 'String' ) );
    dBandWidth_Hz = str2double( get( handles.m_ctrlBandWidth_Hz, 'String' ) );
    
    SequenceInput = SetAmplitude( SequenceInput, dAmplitude );
    SequenceInput = SetInterval_ms( SequenceInput, dInterval_ms );
    SequenceInput = SetLength_s( SequenceInput, dLength_s );
    SequenceInput = SetBandWidth_Hz( SequenceInput, dBandWidth_Hz );
    
    % return the new values
    handles.output = SequenceInput;
    
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

