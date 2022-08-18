function varargout = CUID_Error(varargin)
% CUID_ERROR M-file for CUID_Error.fig
%      CUID_ERROR, by itself, creates a new CUID_ERROR or raises the existing
%      singleton*.
%
%      H = CUID_ERROR returns the handle to a new CUID_ERROR or the handle to
%      the existing singleton*.
%
%      CUID_ERROR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_ERROR.M with the given input arguments.
%
%      CUID_ERROR('Property','Value',...) creates a new CUID_ERROR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Error_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Error_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Error

% Last Modified by GUIDE v2.5 14-Dec-2005 15:06:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Error_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Error_OutputFcn, ...
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


% --- Executes just before CUID_Error is made visible.
function CUID_Error_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CUID_Error (see VARARGIN)

if nargin == 4
    strErrorMessage = varargin{1};
else
    strErrorMessage = 'This error gui has been misused. The error message and only the error message must be the only input argument';
end

set(handles.m_ctrlText , 'String', strErrorMessage)

% Choose default command line output for CUID_Error
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CUID_Error wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CUID_Error_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.figure1);



% --- Executes on button press in m_ctrlOk.
function m_ctrlOk_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output = get( hObject,'String' );
uiresume(handles.figure1);



