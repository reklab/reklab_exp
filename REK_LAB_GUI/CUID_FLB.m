function varargout = CUID_FLB(varargin)
% CUID_FLB M-file for CUID_FLB.fig
%      CUID_FLB, by itself, creates a new CUID_FLB or raises the existing
%      singleton*.
%
%      H = CUID_FLB returns the handle to a new CUID_FLB or the handle to
%      the existing singleton*.
%
%      CUID_FLB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_FLB.M with the given input arguments.
%
%      CUID_FLB('Property','Value',...) creates a new CUID_FLB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_FLB_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_FLB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help CUID_FLB

% Last Modified by GUIDE v2.5 10-Sep-2004 14:01:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_FLB_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_FLB_OutputFcn, ...
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


% --- Executes just before CUID_FLB is made visible.
function CUID_FLB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CUID_FLB (see VARARGIN)

% index of the input parameter
PARAMETER_INDEX = 1;

% total number of input parameters when you pass one input ( i.e. there is some GUI stuff that gets passed as well )
PARAMETER_NUMBER = 4;

% have to explicitly set background colour for figures
set(hObject,'Color','white');

% Choose default command line output for CUID_FLB
handles.output = hObject;

if strcmp(get(hObject,'Visible'),'off')

    % If we passed a CDS_File object, use it to initialize the GUI
    if ( nargin == PARAMETER_NUMBER )
        FileInput = varargin{ PARAMETER_INDEX };

        % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
        if ( isa( FileInput, 'CDS_FileInput' ) )

            % set handle with new input parameter
            handles.objTrial = FileInput;

            % Update handles structure
            guidata(hObject, handles);

            % update the GUI
            Initialize_GUIValues( hObject, handles );
        end

    end
end

% Model, so we have to wait on response
uiwait(handles.figure1);


% Initialize GUI based on Trial object
function Initialize_GUIValues( hObject, handles )    
%<

FileInput = handles.objTrial;

dFLBRealization = GetFLBRealization( FileInput );
dFLBChannel = GetFLBChannel( FileInput );
dFLBRange = GetFLBRange ( FileInput );
dFile = GetFile( FileInput );
[Max_Realizations, Channel_Description] = flbtomat(dFile,'q');
handles.Max_Realizations = Max_Realizations;
Channel_Description = strrep(Channel_Description,'|',[char(13) char(10)]);

set(handles.Realization, 'String', dFLBRealization);
set(handles.Channel, 'String', dFLBChannel);
set(handles.RangeLow, 'String', dFLBRange(1));
set(handles.RangeHigh, 'String', dFLBRange(end));
set(handles.Message, 'String', Channel_Description);

% if dFLBRealization ~= 0
%     set(handles.ChannelOk, 'Enable', 'on');
%     set(handles.Channel, 'Enable', 'on');
%     if dFLBChannel ~= 0
%         set(handles.RangeLow, 'Enable' ,'on');
%         set(handles.RangeHigh, 'Enable' ,'on');
%         set(handles.RangeOk, 'Enable' ,'on');
%         if dFLBRange ~= 0
%             dMatrix = flbtomat( dFile, dFLBRealization );
%             plot(dMatrix(dFLBRange,dFLBChannel))
%         end
%     end
% end

% Update handles structure
guidata(hObject, handles);


%>


% --- Outputs from this function are returned to the command line.
function varargout = CUID_FLB_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.figure1);


function Realization_Callback(hObject, eventdata, handles)
% hObject    handle to Realization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Realization as text
%        str2double(get(hObject,'String')) returns contents of Realization as a double

dFLBRealization = str2double(get(handles.Realization, 'String'));
Max_Realizations = handles.Max_Realizations;

if dFLBRealization > Max_Realizations
    set(handles.Message, 'String', 'No such realization');
else
    set(handles.Channel, 'Enable', 'on');
    set(handles.ChannelOk, 'Enable', 'on');
    
    FileInput = handles.objTrial;
    dFile = GetFile( FileInput );
    dMatrix = flbtomat( dFile , dFLBRealization);
    dSize = size(dMatrix);
    handles.dMatrix = dMatrix;
    
    set (handles.Message, 'string', ['This array has ' num2str(dSize(2)) ' channels']);
end


% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Realization_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Realization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Channel_Callback(hObject, eventdata, handles)
% hObject    handle to Channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Channel as text
%        str2double(get(hObject,'String')) returns contents of Channel as a double

dMatrix = handles.dMatrix;
dSize = size(dMatrix);
dFLBChannel = str2double(get(handles.Channel,'String'));
handles.dFLBChannel = dFLBChannel;

if dFLBChannel > dSize(2)
    set(handles.Message, 'String', 'No such channel');
else
    set(handles.RangeLow, 'Enable', 'On');
    set(handles.RangeHigh, 'Enable', 'On');
    set(handles.RangeOk, 'Enable', 'On');
    set(handles.Message, 'String', ['This vector has a length of ' num2str(dSize(1)) ' samples']);
end

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Channel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function RangeLow_Callback(hObject, eventdata, handles)
% hObject    handle to RangeLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeLow as text
%        str2double(get(hObject,'String')) returns contents of RangeLow as a double


% --- Executes during object creation, after setting all properties.
function RangeLow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function RangeHigh_Callback(hObject, eventdata, handles)
% hObject    handle to RangeHigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RangeHigh as text
%        str2double(get(hObject,'String')) returns contents of RangeHigh as a double


% --- Executes during object creation, after setting all properties.
function RangeHigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RangeHigh (see GCBO)
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

FileInput = handles.objTrial;
dFLBRealization = str2double(get(handles.Realization, 'String'));
dFLBChannel = str2double(get(handles.Channel,'String'));
dRangeLow = str2double(get(handles.RangeLow, 'String'));
dRangeHigh = str2double(get(handles.RangeHigh, 'String'));

FileInput = SetFLBRealization( FileInput , dFLBRealization );
FileInput = SetFLBChannel( FileInput , dFLBChannel );
FileInput = SetFLBRange( FileInput , dRangeLow:dRangeHigh );

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

% return 'Cancel'
handles.output = get( hObject,'String' );

% Update handles structure
guidata(hObject, handles);

% resume modal
uiresume(handles.figure1);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



dFLBRealization = str2double(get(handles.Realization, 'String'));
Max_Realizations = handles.Max_Realizations;

if dFLBRealization > Max_Realizations
    set(handles.Message, 'String', 'No such realization');
else
    set(handles.Channel, 'Enable', 'on');
    set(handles.ChannelOk, 'Enable', 'on');
    
    FileInput = handles.objTrial;
    dFile = GetFile( FileInput );
    dMatrix = flbtomat( dFile , dFLBRealization);
    dSize = size(dMatrix);
    handles.dMatrix = dMatrix;
    
    set (handles.Message, 'string', ['This array has ' num2str(dSize(2)) ' channels']);
end

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in ChannelOk.
function ChannelOk_Callback(hObject, eventdata, handles)
% hObject    handle to ChannelOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




dMatrix = handles.dMatrix;
dSize = size(dMatrix);
dFLBChannel = str2double(get(handles.Channel,'String'));
handles.dFLBChannel = dFLBChannel;

if dFLBChannel > dSize(2)
    set(handles.Message, 'String', 'No such channel');
else
    set(handles.RangeLow, 'Enable', 'On');
    set(handles.RangeHigh, 'Enable', 'On');
    set(handles.RangeOk, 'Enable', 'On');
    set(handles.Message, 'String', ['This vector has a length of ' num2str(dSize(1)) ' samples']);
end

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in RangeOk.
function RangeOk_Callback(hObject, eventdata, handles)
% hObject    handle to RangeOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dMatrix = handles.dMatrix;
dFLBChannel = handles.dFLBChannel;

dRangeLow = str2double(get(handles.RangeLow, 'String'));
dRangeHigh = str2double(get(handles.RangeHigh, 'String'));
dSize = size(dMatrix);

if dRangeLow >= dRangeHigh
    set(handles.Message, 'String', 'Upper limit must be greater than lower limit');
elseif dRangeHigh > dSize(1)
    set(handles.Message, 'String', 'Desired range exceeds data range');
else
    set(handles.Message, 'String', ['Change limits and repress Ok to plot other data ranges',char(13),char(13),'Press Ok at the bottom when finished']);
    plot(dRangeLow:dRangeHigh,dMatrix(dRangeLow:dRangeHigh,dFLBChannel));
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




% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Initialize_GUIValues( hObject, handles );
set(handles.Channel, 'Enable', 'Off');
set(handles.ChannelOk, 'Enable', 'Off');
set(handles.RangeHigh, 'Enable', 'Off');
set(handles.RangeLow, 'Enable', 'Off');
set(handles.RangeOk, 'Enable', 'Off');
plot(0);
