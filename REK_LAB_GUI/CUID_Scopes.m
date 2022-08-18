function varargout = CUID_Scopes(varargin)
% CUID_SCOPES M-file for CUID_Scopes.fig
%      CUID_SCOPES, by itself, creates a new CUID_SCOPES or raises the existing
%      singleton*.
%
%      H = CUID_SCOPES returns the handle to a new CUID_SCOPES or the handle to
%      the existing singleton*.
%
%      CUID_SCOPES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_SCOPES.M with the given input arguments.
%
%      CUID_SCOPES('Property','Value',...) creates a new CUID_SCOPES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Scopes_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Scopes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Scopes

% Last Modified by GUIDE v2.5 07-Aug-2003 10:41:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Scopes_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Scopes_OutputFcn, ...
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
function CUID_Scopes_OpeningFcn(hObject, eventdata, handles, varargin)
%<
    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUID_Scopes
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);
%>


% Command Line outputs
function varargout = CUID_Scopes_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    %delete(handles.figure1);
%>


% --- Executes on selection change in m_ctrlSignals.
function m_ctrlSignals_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlSignals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns m_ctrlSignals contents as cell array
%        contents{get(hObject,'Value')} returns selected item from m_ctrlSignals


% --- Executes on selection change in m_ctrlScopes.
function m_ctrlScopes_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlScopes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns m_ctrlScopes contents as cell array
%        contents{get(hObject,'Value')} returns selected item from m_ctrlScopes


% Callback for adding selected scope(s)
function m_ctrlAdd_Callback(hObject, eventdata, handles)
%<
    % get the list of selected items
    nSelectedIndex = get( handles.m_ctrlSignals, 'Value' );
    
    % get the number of selected items
    nSelectedSize = size( nSelectedIndex );
    nLength = nSelectedSize( 2 );
    
    % get the list of selected signals
    strSignals = get( handles.m_ctrlSignals, 'String' );
    strScopes = strSignals( nSelectedIndex, 1 );
    
    % get the list of current scopes
    strListScopes = get( handles.m_ctrlScopes, 'String' );
    
    % get the new list of scopes
    strList = [strListScopes; strScopes];
    
    % update scopes
    set( handles.m_ctrlScopes, 'String', strList );
    guidata(hObject, handles);
%>


% Callback for adding all signals
function m_ctrlAddAll_Callback(hObject, eventdata, handles)
%<
    % get all signals
    strSignals = get( handles.m_ctrlSignals, 'String' );

    % get the list of current scopes
    strListScopes = get( handles.m_ctrlScopes, 'String' );

    % get the new list of scopes
    strList = [strListScopes; strSignals];   

    % update scopes
    set( handles.m_ctrlScopes, 'String', strList )
    guidata(hObject, handles);
%>


% Callback for removing selected
function m_ctrlRemove_Callback(hObject, eventdata, handles)
%<
    % get the list of selected items
    nSelectedIndex = get( handles.m_ctrlScopes, 'Value' );
    
    % get the list of current scopes
    strListScopes = get( handles.m_ctrlScopes, 'String' );
   
    % only remove
    if ( isempty( strListScopes ) )
        return;
    end
   
    % remove selected
    strListScopes( nSelectedIndex, : ) = []
    
    % update scopes
    set( handles.m_ctrlScopes, 'String', strListScopes )
    set( handles.m_ctrlScopes, 'Value', 1 );
    
    guidata(hObject, handles);
%>


% Callback for removing all scopes
function m_ctrlRemoveAll_Callback(hObject, eventdata, handles)
%<
    strList = '';
    set( handles.m_ctrlScopes, 'String', strList );
    set( handles.m_ctrlScopes, 'Value', 1 );
    
    guidata(hObject, handles); 
    
%>


% --- Executes on button press in m_ctrlOk.
function m_ctrlOk_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m_ctrlCancel.
function m_ctrlCancel_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
