function varargout = CUID_Triggering(varargin)
% CUID_TRIGGERING M-file for CUID_Triggering.fig
%      CUID_TRIGGERING, by itself, creates a new CUID_TRIGGERING or raises the existing
%      singleton*.
%
%      H = CUID_TRIGGERING returns the handle to a new CUID_TRIGGERING or the handle to
%      the existing singleton*.
%
%      CUID_TRIGGERING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_TRIGGERING.M with the given input arguments.
%
%      CUID_TRIGGERING('Property','Value',...) creates a new CUID_TRIGGERING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Triggering_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Triggering_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help CUID_Triggering

% Last Modified by GUIDE v2.5 20-Aug-2004 15:32:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Triggering_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Triggering_OutputFcn, ...
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
function CUID_Triggering_OpeningFcn(hObject, eventdata, handles, varargin)
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
                  
        % If we passed a CDS_Triggering object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            Triggering = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( Triggering, 'CDS_Triggering' ) )
                
                % set handle with new input parameter
                handles.Triggering = Triggering;
                
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
    Triggering = handles.Triggering;
    
    dLLimit = GetLLimit( Triggering );
    dULimit = GetULimit( Triggering );
    dSampleDuration = GetSampleDuration ( Triggering );
    
    
    set(handles.LLimit, 'String', dLLimit);
    set(handles.ULimit, 'String', dULimit);
    set(handles.SampleDuration, 'String', dSampleDuration);
    
%>


% Command line outputs
function varargout = CUID_Triggering_OutputFcn(hObject, eventdata, handles)
%<
    varargout{1} = handles.output;
    delete(handles.figure1);
%>



function LLimit_Callback(hObject, eventdata, handles)
% hObject    handle to LLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LLimit as text
%        str2double(get(hObject,'String')) returns contents of LLimit as a double


% --- Executes during object creation, after setting all properties.
function LLimit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ULimit_Callback(hObject, eventdata, handles)
% hObject    handle to ULimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ULimit as text
%        str2double(get(hObject,'String')) returns contents of ULimit as a double


% --- Executes during object creation, after setting all properties.
function ULimit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ULimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function SampleDuration_Callback(hObject, eventdata, handles)
% hObject    handle to SampleDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SampleDuration as text
%        str2double(get(hObject,'String')) returns contents of SampleDuration as a double


% --- Executes during object creation, after setting all properties.
function SampleDuration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampleDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in m_ctrlOk.
function m_ctrlOk_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%<
    Triggering = handles.Triggering;
    
    dLLimit = str2double( get(handles.LLimit, 'String') );
    dULimit = str2double( get(handles.ULimit, 'String') );
    dSampleDuration = str2double( get(handles.SampleDuration, 'String') );
 
    
    Triggering = SetLLimit( Triggering, dLLimit );
    Triggering = SetULimit( Triggering, dULimit );
    Triggering = SetSampleDuration( Triggering, dSampleDuration );

        
    % return the new values
    handles.output = Triggering;
    
    % Update handles structure
    guidata(hObject, handles);

    % resume modal
    uiresume(handles.figure1);
%>

% --- Executes on button press in m_ctrlCancel.
function m_ctrlCancel_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%<
    % return 'Canel'
    handles.output = get( hObject,'String' );

    % Update handles structure
    guidata(hObject, handles);

    % resume modal
    uiresume(handles.figure1);
%>


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
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


