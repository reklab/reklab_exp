function varargout = CUID_PosOff(varargin)
% CUID_POSOFF M-file for CUID_PosOff.fig
%      CUID_POSOFF, by itself, creates a new CUID_POSOFF or raises the existing
%      singleton*.
%
%      H = CUID_POSOFF returns the handle to a new CUID_POSOFF or the handle to
%      the existing singleton*.
%
%      CUID_POSOFF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_POSOFF.M with the given input arguments.
%
%      CUID_POSOFF('Property','Value',...) creates a new CUID_POSOFF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_PosOff_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_PosOff_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help CUID_PosOff

% Last Modified by GUIDE v2.5 19-Aug-2004 16:16:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_PosOff_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_PosOff_OutputFcn, ...
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


% Figure Load initialization
function CUID_PosOff_OpeningFcn(hObject, eventdata, handles, varargin)
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
                  
        % If we passed a CDS_PosOff object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            PosOff = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( PosOff, 'CDS_PosOff' ) )
                
                % set handle with new input parameter
                handles.PosOff = PosOff;
                
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
    PosOff = handles.PosOff;
    
    dLeft = GetLeft( PosOff );
    dRight = GetRight( PosOff );
    
    
    set(handles.Lpos, 'String', dLeft);
    set(handles.Rpos, 'String', dRight);
    
%>


% Command line outputs
function varargout = CUID_PosOff_OutputFcn(hObject, eventdata, handles)
%<
    varargout{1} = handles.output;
    delete(handles.figure1);
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    PosOff = handles.PosOff;
    
    dLeft = str2double( get(handles.Lpos, 'String') );
    dRight = str2double( get(handles.Rpos, 'String') );
    
    
    PosOff = SetLeft( PosOff, dLeft );
    PosOff = SetRight( PosOff, dRight );
        
    % return the new values
    handles.output = PosOff;
    
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

function Lpos_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function Lpos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Rpos_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function Rpos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end