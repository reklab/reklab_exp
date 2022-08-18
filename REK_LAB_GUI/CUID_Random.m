function varargout = CUID_Random(varargin)
% CUID_RANDOM M-file for CUID_Random.fig
%      CUID_RANDOM, by itself, creates a new CUID_RANDOM or raises the existing
%      singleton*.
%
%      H = CUID_RANDOM returns the handle to a new CUID_RANDOM or the handle to
%      the existing singleton*.
%
%      CUID_RANDOM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_RANDOM.M with the given input arguments.
%
%      CUID_RANDOM('Property','Value',...) creates a new CUID_RANDOM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Random_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Random_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Random

% Last Modified by GUIDE v2.5 10-Sep-2003 14:14:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Random_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Random_OutputFcn, ...
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
function CUID_Random_OpeningFcn(hObject, eventdata, handles, varargin)
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
                  
        % If we passed a CDS_RandomInput object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            RandomInput = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( RandomInput, 'CDS_RandomInput' ) )
                
                % set handle with new input parameter
                handles.objTrial = RandomInput;
                
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
    RandomInput = handles.objTrial;
    
    dAmplitude = GetAmplitude( RandomInput );
    dBandWidth_Hz = GetBandWidth_Hz( RandomInput );
    dMean = GetMean( RandomInput );
    dStd = GetStd( RandomInput );
    dLength_s = GetLength_s( RandomInput );
    
    
    set(handles.m_ctrlAmplitude, 'String', dAmplitude);
    set(handles.m_ctrlBandWidth_Hz, 'String', dBandWidth_Hz);    
    set(handles.m_ctrlMean, 'String', dMean);
    set(handles.m_ctrlStd, 'String', dStd);
    set(handles.m_ctrlLength_s, 'String', dLength_s);
%>


% Command Line outputs
function varargout = CUID_Random_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    delete(handles.figure1);
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    RandomInput = handles.objTrial;

    dAmplitude = str2double( get( handles.m_ctrlAmplitude, 'String' ) );
    dBandWidth_Hz = str2double( get( handles.m_ctrlBandWidth_Hz, 'String' ) );
    dMean = str2double( get( handles.m_ctrlMean, 'String' ) );
    dStd = str2double( get( handles.m_ctrlStd, 'String' ) );
    dLength_s = str2double( get( handles.m_ctrlLength_s, 'String' ) );
    

    RandomInput = SetAmplitude( RandomInput, dAmplitude );
    RandomInput = SetBandWidth_Hz( RandomInput, dBandWidth_Hz );
    RandomInput = SetMean( RandomInput, dMean );
    RandomInput = SetStd( RandomInput, dStd );
    RandomInput = SetLength_s( RandomInput, dLength_s );
    
    % return the new values
    handles.output = RandomInput;
    
    % Update handles structure
    guidata(hObject, handles);

    % resume modal
    uiresume(handles.figure1);    
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

