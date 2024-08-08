function varargout = CUID_Pulse(varargin)
% CUID_PULSE M-file for CUID_Pulse.fig
%      CUID_PULSE, by itself, creates a new CUID_PULSE or raises the existing
%      singleton*.
%
%      H = CUID_PULSE returns the handle to a new CUID_PULSE or the handle to
%      the existing singleton*.
%
%      CUID_PULSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_PULSE.M with the given input arguments.
%
%      CUID_PULSE('Property','Value',...) creates a new CUID_PULSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Pulse_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Pulse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Pulse

% Last Modified by GUIDE v2.5 21-Jan-2004 11:31:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Pulse_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Pulse_OutputFcn, ...
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


% Figure Load Initialization
function CUID_Pulse_OpeningFcn(hObject, eventdata, handles, varargin)
%<
    % index of the input parameter
    PARAMETER_INDEX = 1;

    % total number of input parameters when you pass one input ( i.e. there is some GUI stuff that gets passed as well )
    PARAMETER_NUMBER = 4;

    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUID_Pulse
    handles.output = hObject;

    
    % Only initialize once
    if strcmp(get(hObject,'Visible'),'off')
                  
        % If we passed a CDS_RandomInput object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            PulseInput = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( PulseInput, 'CDS_PulseInput' ) )
                
                % set handle with new input parameter
                handles.objTrial = PulseInput;
                
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
    PulseInput = handles.objTrial;
    
    dStart_ms = GetStart_ms( PulseInput );
    dWidth_ms = GetWidth_ms( PulseInput );
    dAmplitude = GetAmplitude( PulseInput );
    dLength_s = GetLength_s( PulseInput );
    
    set(handles.m_ctrlStart_ms, 'String', dStart_ms);
    set(handles.m_ctrlWidth_ms, 'String', dWidth_ms);
    set(handles.m_ctrlAmplitude, 'String', dAmplitude);
    set(handles.m_ctrlLength_s, 'String', dLength_s);
%>


% Command Line Outputs
function varargout = CUID_Pulse_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    delete(handles.figure1);    
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    PulseInput = handles.objTrial;

    dStart_ms = str2double( get( handles.m_ctrlStart_ms, 'String' ) );
    dWidth_ms = str2double( get( handles.m_ctrlWidth_ms, 'String' ) );
    dAmplitude = str2double( get( handles.m_ctrlAmplitude, 'String' ) );
    dLength_s = str2double( get( handles.m_ctrlLength_s, 'String' ) );

    PulseInput = SetStart_ms( PulseInput, dStart_ms );
    PulseInput = SetWidth_ms( PulseInput, dWidth_ms );
    PulseInput = SetAmplitude( PulseInput, dAmplitude );
    PulseInput = SetLength_s( PulseInput, dLength_s );
    
    % return the new values
    handles.output = PulseInput;
    
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


% --- Executes during object creation, after setting all properties.
function m_ctrlLength_s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_ctrlLength_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function m_ctrlLength_s_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlLength_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_ctrlLength_s as text
%        str2double(get(hObject,'String')) returns contents of m_ctrlLength_s as a double


