function varargout = CUID_DataSetSelection(varargin)
% CUID_DATASETSELECTION M-file for CUID_DataSetSelection.fig
%      CUID_DATASETSELECTION, by itself, creates a new CUID_DATASETSELECTION or raises the existing
%      singleton*.
%
%      H = CUID_DATASETSELECTION returns the handle to a new CUID_DATASETSELECTION or the handle to
%      the existing singleton*.
%
%      CUID_DATASETSELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_DATASETSELECTION.M with the given input arguments.
%
%      CUID_DATASETSELECTION('Property','Value',...) creates a new CUID_DATASETSELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_DataSetSelection_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_DataSetSelection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_DataSetSelection

% Last Modified by GUIDE v2.5 14-Dec-2005 14:58:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @CUID_DataSetSelection_OpeningFcn, ...
    'gui_OutputFcn',  @CUID_DataSetSelection_OutputFcn, ...
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
function CUID_DataSetSelection_OpeningFcn(hObject, eventdata, handles, varargin)
%<
% have to explicitly set background colour for figures
set(hObject,'Color','white');

% Choose default command line output for CUID_DataSetSelection
handles.output = hObject;

% for returning the selected data set
handles.nSelected = 0;

% need to pass the document as we can't return two arguments, but need
% to store list of inputs as well as the selected dataset
handles.Document = varargin{1};


% parameters for list setup
Document = handles.Document;
DataSetMgr = GetDataSetMgr( Document );
nSize = GetSize( DataSetMgr );
nSelected = GetDataSet( Document );

% setup listbox
if ( nSize > 0 )

    % create a new list of strings
    for i = 1:nSize;
        DataSet = GetItem( DataSetMgr, i );
        strList{i} = GetName( DataSet );
    end

    set( handles.m_ctrlDataSetList, 'String', strList );
    set( handles.m_ctrlDataSetList, 'Value', nSelected );
end


% init new data
Initialize_GUIValues( hObject, handles );

% Update handles structure
guidata(hObject, handles);

% Model, so we have to wait on response
uiwait(handles.figure1);
%>


% Command Line outputs
function varargout = CUID_DataSetSelection_OutputFcn(hObject, eventdata, handles)
%<
% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.figure1);
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
Document = handles.Document;
nSelectedIndex = get( handles.m_ctrlDataSetList, 'Value' );
Document = SetDataSet( Document, nSelectedIndex );

% store the new document for output
handles.output = Document;

% Update handles structure
guidata(hObject, handles);

% resume modal
uiresume(handles.figure1);
%>


% Callback for Cancel
function m_ctrlCancel_Callback(hObject, eventdata, handles)
%<
% return 'Cancel'
handles.output = get( hObject,'String' );

% Update handles structure
guidata(hObject, handles);

% resume modal
uiresume(handles.figure1);
%>

% Callback for Add, which adds the new data set to the list of available ones
function m_ctrlAdd_Callback(hObject, eventdata, handles)
%<
% Data set dialog box, which returns the new input
%DL added input argument of Document
Document = handles.Document;
DataSet = CUID_DataSet;


%%PB%% if ( isa( Trial, 'CDS_InputData' ) )
if ( isa( DataSet, 'Ctrl_DataSet' ) )

    %         Document = handles.Document;
    DataSetMgr = GetDataSetMgr( Document );

    % add new data set to the list of available
    DataSetMgr = AddItem( DataSetMgr, DataSet );
    nSize = GetSize( DataSetMgr );

    % save to handles
    Document = SetDataSetMgr( Document, DataSetMgr );
    handles.Document = Document;

    % Update handles structure
    guidata(hObject, handles);
    
    %DL name needed to save file
    strName = GetName( DataSet );
    
    % Highlight laat entry since it is newest
    nSelected = nSize;
    
    % setup listbox
    if ( nSize > 0 )
        
        % create a new list of strings
        for i = 1:nSize;
            DataSet = GetItem( DataSetMgr, i );
            strList{i} = GetName( DataSet );
        end
        
        set( handles.m_ctrlDataSetList, 'String', strList );
        set( handles.m_ctrlDataSetList, 'Value', nSelected );
    end


%     % with MATLAB list, you must first get the current list, and then append the new string item
%     strName = GetName( DataSet );
%     strList = get( handles.m_ctrlDataSetList, 'String' );
%     strList{ nSize } = strName;
% 
%     % set the new list item and select it
%     set( handles.m_ctrlDataSetList, 'String', strList );
%     set( handles.m_ctrlDataSetList, 'Value', nSize );

    % update the GUI
    Initialize_GUIValues( hObject, handles );

    % Get location where data sets are stored
    Preferences = GetPreferences( Document );
    strDataSets = GetDataSets( Preferences );

    %%PB%%TRIAL_PATH = 'C:\Documents and Settings\pbock.CAMPUS\_work\Trials\';
    %%PB%%SaveFile = [TRIAL_PATH, strName, '.mat'];
    
     % save the new data set
    SaveFile = [ strDataSets, '\', strName, '.mat'];
    save( SaveFile, 'DataSet' );

end
%>


% Initialize GUI based on the selected item
function Initialize_GUIValues( hObject, handles )
%<
Document = handles.Document;
DataSetMgr = GetDataSetMgr( Document );

nSize = GetSize( DataSetMgr );

try
% set the properties to the currently selected item
if ( nSize > 0 ) 
    nSelectedIndex = get( handles.m_ctrlDataSetList, 'Value' );
    DataSet = GetItem( DataSetMgr, nSelectedIndex );

    strParameters = GetChannelNames( DataSet );
    set(handles.m_ctrlParameters, 'String', strParameters);

    % clear the properties if empty list
else
    set(handles.m_ctrlParameters, 'String', '');
end
catch
end
%>


% Callback for Remove
function m_ctrlRemove_Callback(hObject, eventdata, handles)
%<
Document = handles.Document;
DataSetMgr = GetDataSetMgr( Document );

% get the selected item and the size
nSelectedIndex = get( handles.m_ctrlDataSetList, 'Value' );
DataSet = GetItem ( DataSetMgr, nSelectedIndex );
strName = GetName ( DataSet );
nSize = GetSize( DataSetMgr );

% don't do anything if the list is already empty
if ( nSize == 0 )
    return
end

% remove item from the list
DataSetMgr = RemoveItem( DataSetMgr, nSelectedIndex );
nSize = nSize - 1;


% we still have some remaining, so we must rebuild the list string property
if ( nSize > 0 )

    % create a new list of strings
    for i = 1:nSize;
        DataSet = GetItem( DataSetMgr, i );
        strList{i} = GetName( DataSet );
    end

    set( handles.m_ctrlDataSetList, 'String', strList );


    % select the previous item to the deleted one
    if ( ( nSelectedIndex - 1 ) > 0 )
        set( handles.m_ctrlDataSetList, 'Value', nSelectedIndex - 1 );
        % last item is selected
    else
        set( handles.m_ctrlDataSetList, 'Value', nSelectedIndex );
    end

    % empty list
else
    set( handles.m_ctrlDataSetList, 'String', '' );
end


% Get location where data sets are stored
Preferences = GetPreferences( Document );
strDataSets = GetDataSets( Preferences );

% Delete file from Hard Disk
try
    SaveFile = [ strDataSets,'\', strName, '.mat'];
    delete (SaveFile);
catch
    disp('No Save File')
end


% save to handles
Document = SetDataSetMgr( Document, DataSetMgr );
handles.Document = Document;

% Update handles structure
guidata(hObject, handles);

% update GUI
Initialize_GUIValues( hObject, handles )
%>


% Callback for list selection
function m_ctrlDataSetList_Callback(hObject, eventdata, handles)
%<
% update GUI
Initialize_GUIValues( hObject, handles );
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


% --- Executes on button press in m_ctrlEdit.
function m_ctrlEdit_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get Data Set Manager
Document = handles.Document;
DataSetMgr = GetDataSetMgr ( Document );

% Get selected Data set
nSelectedIndex = get( handles.m_ctrlDataSetList, 'Value' );
DataSet = GetItem ( DataSetMgr, nSelectedIndex );
nSize = GetSize( DataSetMgr );

% don't do anything if the list is already empty
if ( nSize == 0 )
    return
end

%Store name so can delete from harddisk after replaced
Old_name = GetName(DataSet);


% Call CUID_DataSet with desired Data set as input argument
DataSet = CUID_DataSet ( DataSet );

if ( isa( DataSet, 'Ctrl_DataSet' ) )

    % remove old item from the list
    DataSetMgr = RemoveItem( DataSetMgr, nSelectedIndex );
    nSize = nSize - 1;

    % Store Edited DataSet
    % add new data set to the list of available
    DataSetMgr = AddItem( DataSetMgr, DataSet );
    strNewSetName = GetName(DataSet);
    nSize = GetSize( DataSetMgr );

    % save to handles
    Document = SetDataSetMgr( Document, DataSetMgr );
    handles.Document = Document;

    % Update handles structure
    guidata(hObject, handles);
    
    % parameters for list setup
    nSelected = GetDataSet( Document );
    
    % setup listbox
    if ( nSize > 0 )
        
        % create a new list of strings
        for i = 1:nSize;
            DataSet = GetItem( DataSetMgr, i );
            strList{i} = GetName( DataSet );
        end
        
        set( handles.m_ctrlDataSetList, 'String', strList );
        set( handles.m_ctrlDataSetList, 'Value', nSelected );
    end


%     % with MATLAB list, you must first get the current list, and then append the new string item
%     strName = GetName( DataSet );
%     strList = get( handles.m_ctrlDataSetList, 'String' );
%     strList{ nSize } = strName;
% 
%     % set the new list item and select it
%     set( handles.m_ctrlDataSetList, 'String', strList );
%     set( handles.m_ctrlDataSetList, 'Value', nSize );

    % update the GUI
    Initialize_GUIValues( hObject, handles );
    
     % Get location where data sets are stored
    Preferences = GetPreferences( Document );
    strDataSets = GetDataSets( Preferences );

    %%PB%%TRIAL_PATH = 'C:\Documents and Settings\pbock.CAMPUS\_work\Trials\';
    %%PB%%SaveFile = [TRIAL_PATH, strName, '.mat'];
    
    %Delete old data set that was replaced
    
    try
        SaveFile = [ strDataSets,'\', Old_name, '.mat'];
        delete (SaveFile);
    catch
        disp('No Save File')
    end
    
    
     % save the new data set
    SaveFile = [ strDataSets, '\', strNewSetName, '.mat'];
    save( SaveFile, 'DataSet' );

end



function m_ctrlParameters_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_ctrlParameters as text
%        str2double(get(hObject,'String')) returns contents of m_ctrlParameters as a double


set(handles.m_ctrlParameters, 'String', 'Don''t edit text here !!');
pause(2)
Initialize_GUIValues( hObject, handles );

