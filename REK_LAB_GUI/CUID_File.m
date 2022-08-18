function varargout = CUID_File(varargin)
% CUID_FILE M-file for CUID_File.fig
%      CUID_FILE, by itself, creates a new CUID_FILE or raises the existing
%      singleton*.
%
%      H = CUID_FILE returns the handle to a new CUID_FILE or the handle to
%      the existing singleton*.
%
%      CUID_FILE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_FILE.M with the given input arguments.
%
%      CUID_FILE('Property','Value',...) creates a new CUID_FILE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_File_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_File_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help CUID_File

% Last Modified by GUIDE v2.5 02-Sep-2004 16:05:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_File_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_File_OutputFcn, ...
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
function CUID_File_OpeningFcn(hObject, eventdata, handles, varargin)
%<
% index of the input parameter
PARAMETER_INDEX = 1;

% total number of input parameters when you pass one input ( i.e. there is some GUI stuff that gets passed as well )
PARAMETER_NUMBER = 5;

% have to explicitly set background colour for figures
set(hObject,'Color','white');

% Choose default command line output for CUID_Random
handles.output = hObject;


% Only initialize once
if strcmp(get(hObject,'Visible'),'off')

    % If we passed a CDS_File object, use it to initialize the GUI
    if ( nargin == PARAMETER_NUMBER )
        FileInput = varargin{ PARAMETER_INDEX };
        Document = varargin{ 2 };

        % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
        if ( isa( FileInput, 'CDS_FileInput' ) )

            % set handle with new input parameter
            handles.objTrial = FileInput;
            handles.m_Document = Document;

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
FileInput = handles.objTrial;

dType = GetType( FileInput );
dFile = GetFile( FileInput );

if strcmp( dType, 'Workspace' )
    set( handles.rbWorkspace, 'Value', 1 );
elseif strcmp( dType, 'FLB' )
    set( handles.rbFLB, 'Value', 1 );
elseif strcmp ( dType, 'MAT' )
    set( handles.rbMAT, 'Value', 1 );
end

if dFile ~= 0
    set(handles.InputFile, 'String', dFile);
end

%>



% --- Outputs from this function are returned to the command line.
function varargout = CUID_File_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.figure1);

% --- Executes on button press in rbWorkspace.
function rbWorkspace_Callback(hObject, eventdata, handles)
% hObject    handle to rbWorkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbWorkspace

set( handles.rbFLB, 'Value', 0 );
set( handles.rbMAT, 'Value', 0 );
set( handles.InputFile, 'String', 'Please enter name of vector here'); 
guidata(hObject, handles);

% --- Executes on button press in rbFLB.
function rbFLB_Callback(hObject, eventdata, handles)
% hObject    handle to rbFLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbFLB

set( handles.rbWorkspace, 'Value', 0 );
set( handles.rbMAT, 'Value', 0 );
set( handles.InputFile, 'String', 'Please enter name of file here');
guidata(hObject, handles);

% --- Executes on button press in rbMAT.
function rbMAT_Callback(hObject, eventdata, handles)
% hObject    handle to rbMAT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbMAT

set( handles.rbWorkspace, 'Value', 0 );
set( handles.rbFLB, 'Value', 0 );
set( handles.InputFile, 'String', 'Please enter name of file here');
guidata(hObject, handles);


function InputFile_Callback(hObject, eventdata, handles)
% hObject    handle to InputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputFile as text
%        str2double(get(hObject,'String')) returns contents of InputFile as a double


% --- Executes during object creation, after setting all properties.
function InputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in m_ctrlOK.
function m_ctrlOK_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlOK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%<
FileInput = handles.objTrial;

if get(handles.rbWorkspace, 'Value') == 1
    dType = 'Workspace';
elseif get(handles.rbFLB, 'Value') == 1
    dType = 'FLB';
elseif get(handles.rbMAT, 'Value') == 1
    dType = 'MAT';
else
    dType = 0;
end

dFile = get(handles.InputFile, 'String');

FileInput = SetType( FileInput, dType );
FileInput = SetFile( FileInput, dFile );

if strcmp(dType, 'FLB')
    FileInput = CUID_FLB(FileInput);
end
    
% return the new values
handles.output = FileInput;

% Update handles structure
guidata(hObject, handles);

% resume modal
uiresume(handles.figure1);

% --- Executes on button press in m_ctrlCancel.
function m_ctrlCancel_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% return 'Canel'
handles.output = get( hObject,'String' );

% Update handles structure
guidata(hObject, handles);

% resume modal
uiresume(handles.figure1);

% --- Executes on button press in BrowseFile.
function BrowseFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Preferences = GetPreferences( handles.m_Document );
strOutputs = GetOutputs( Preferences );

if get(handles.rbFLB, 'Value') == 1
    FileFilter = [ strOutputs, '\*.flb' ];
elseif get(handles.rbMAT, 'Value') == 1
    FileFilter = [ strOutputs,  '\*.mat' ];
else
    FileFilter = [ strOutputs, '\*.*' ];
end

% File browse dialog
if get(handles.rbWorkspace, 'Value') == 1
    set(handles.InputFile, 'String', 'Please enter name of vector here');
elseif get(handles.rbFLB, 'Value') == 1
    [ strName, strPath ] = uigetfile( FileFilter );
    strFullPath = [strPath, strName];
    if ( strPath ~= 0 )
        set( handles.InputFile, 'String', strFullPath );
    
        guidata(hObject, handles);
    end
elseif get(handles.rbMAT, 'Value') == 1
    [ strName, strPath ] = uigetfile( FileFilter );
    strFullPath = [strPath, strName];
    if ( strPath ~= 0 )
        set( handles.InputFile, 'String', strFullPath );
    
        guidata(hObject, handles);
    end
else
    set(handles.InputFile, 'String', 'Please select a file type');
end



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
