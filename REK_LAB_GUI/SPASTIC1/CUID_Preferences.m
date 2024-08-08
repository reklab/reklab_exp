function varargout = CUID_Preferences(varargin)
% CUID_PREFERENCES M-file for CUID_Preferences.fig
%      CUID_PREFERENCES, by itself, creates a new CUID_PREFERENCES or raises the existing
%      singleton*.
%
%      H = CUID_PREFERENCES returns the handle to a new CUID_PREFERENCES or the handle to
%      the existing singleton*.
%
%      CUID_PREFERENCES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_PREFERENCES.M with the given input arguments.
%
%      CUID_PREFERENCES('Property','Value',...) creates a new CUID_PREFERENCES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_Preferences_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_Preferences_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_Preferences

% Last Modified by GUIDE v2.5 19-Nov-2009 14:10:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_Preferences_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_Preferences_OutputFcn, ...
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
function CUID_Preferences_OpeningFcn(hObject, eventdata, handles, varargin)
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
                  
        % If we passed a CDS_Preferences object, use it to initialize the GUI  
        if ( nargin == PARAMETER_NUMBER )
            Preferences = varargin{ PARAMETER_INDEX };
        
            % normally you shouldn't class check; however, this is MATLAB GUI so who knows what is really being passed
            if ( isa( Preferences, 'CDS_Preferences' ) )
                
                % set handle with new input parameter
                handles.Preferences = Preferences;
                
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
    Preferences = handles.Preferences;
    
    strWorkspace = GetWorkspace( Preferences );
    strTrials = GetTrials( Preferences );
    strDataSets = GetDataSets( Preferences );
    strModel = GetModel( Preferences );
    strMyGUI = GetMyGUI( Preferences );
    strOutputs = GetOutputs( Preferences );
    strSequence = GetSequence( Preferences );
    
    set(handles.m_ctrlWorkspace, 'String', strWorkspace);
    set(handles.m_ctrlTrials, 'String', strTrials);
    set(handles.m_ctrlDataSets, 'String', strDataSets);
    set(handles.m_ctrlModel, 'String', strModel);
    set(handles.m_ctrlMyGUI, 'String', strMyGUI);
    set(handles.m_ctrlOutput, 'String', strOutputs);
    set(handles.m_ctrlSequence, 'String', strSequence);
    
%     global SINGLE_ACTUATOR;
%     global DOUBLE_ACTUATOR;
%     
%     nActuatorMode = GetActuatorMode( Preferences );
%     if ( nActuatorMode == DOUBLE_ACTUATOR )
%         set(handles.m_ctrlDoubleActuator, 'Value', 1);    
%     else
%         set(handles.m_ctrlSingleActuator, 'Value', 1);
%     end
    
%>


% Command Line outputs
function varargout = CUID_Preferences_OutputFcn(hObject, eventdata, handles)
%<
    varargout{1} = handles.output;
    delete(handles.figure1);    
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    Preferences = handles.Preferences;

    strWorkspace = get( handles.m_ctrlWorkspace, 'String' );
    strTrials = get( handles.m_ctrlTrials, 'String' );
    strDataSets = get( handles.m_ctrlDataSets, 'String');
    strModel = get( handles.m_ctrlModel, 'String' );
    strMyGUI = get( handles.m_ctrlMyGUI, 'String' );
    strOutputs = get( handles.m_ctrlOutput, 'String' );
    strSequence = get( handles.m_ctrlSequence, 'String' );
    
    Preferences = SetWorkspace( Preferences, strWorkspace );
    Preferences = SetTrials( Preferences, strTrials );
    Preferences = SetDataSets( Preferences, strDataSets );
    Preferences = SetModel( Preferences, strModel );
    Preferences = SetMyGUI( Preferences, strMyGUI );
    Preferences = SetOutputs( Preferences, strOutputs );
    Preferences = SetSequence( Preferences, strSequence );

    % PB defined NumActuators here
%     global SINGLE_ACTUATOR;
%     global DOUBLE_ACTUATOR;
%     
%     nState = get( handles.m_ctrlDoubleActuator, 'Value' );
%     if ( nState == 1 )
%         Preferences = SetActuatorMode( Preferences, DOUBLE_ACTUATOR );
%     else
%         Preferences = SetActuatorMode( Preferences, SINGLE_ACTUATOR );
%     end
    
    % return the new values
    handles.output = Preferences;
    
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
% 
% 
% % Callback for Workspace File Browse
% function m_ctrlWorkspaceFile_Callback(hObject, eventdata, handles)
% %<
%     strWorkspace = get( handles.m_ctrlWorkspace, 'String' );
%     
%     % parse the file location into a path and name
%     % if it is empty then use GUI directory
%     if isempty( strWorkspace )
%         strPath = 'D:\bmed_tools\reklab_exp\rek_lab_gui';
%     else
%         k = findstr( '\', strWorkspace );
%         pos = k(end);
%         strName = strWorkspace(pos+1:end-4);
%         strPath = strWorkspace(1:pos-1);
%     end
% 
%     try
%         cd( strPath );
%     catch 
%         disp( 'ASSERT: Workspace File Path not found.' );
%     end
%     
%     % Simulink model files only
%     FileFilter = '*.mat';
%     
%     % File browse dialog
%     [ strName, strPath ] = uigetfile( FileFilter );
%     strFullPath = [strPath, strName];
%         
%     if ( strPath ~= 0 )
%         set( handles.m_ctrlWorkspace, 'String', strFullPath );
%     
%         guidata(hObject, handles);
%     end
%>


% Callback for Output Files Directory
function m_ctrlOutputFile_Callback(hObject, eventdata, handles)
%<
    strOutput = get( handles.m_ctrlOutput, 'String' );
    
    % if it is empty then use GUI directory
    if isempty( strOutput )
        strPath = 'D:\bmed_tools\reklab_exp\rek_lab_gui';
    else
        strPath = strOutput;
    end
    
    try
        cd( strPath );
    catch 
        disp( 'ASSERT: Output File Path not found.' );
    end
    
    % Directory browse dialog
    strPath = uigetdir;
      
    if ( strPath ~= 0 )
        set( handles.m_ctrlOutput, 'String', strPath );
    
        guidata(hObject, handles);
    end
%>


% Callback for Trials Directory Browse
function m_ctrlTrialsFile_Callback(hObject, eventdata, handles)
%<  
    strTrials = get( handles.m_ctrlTrials, 'String' );
       
    if isempty( strTrials )
        strPath = 'D:\bmed_tools\reklab_exp\rek_lab_gui';
    else
        strPath = strTrials;
    end
    
    try
        cd( strPath );
    catch 
        disp( 'ASSERT: Trials File Path not found.' );
    end
    
    % Directory browse dialog
    strPath = uigetdir;
        
    if ( strPath ~= 0 )
        set( handles.m_ctrlTrials, 'String', strPath );
    
        guidata(hObject, handles);
    end
%>


% Callback for Model File Browse
function m_ctrlModelFile_Callback(hObject, eventdata, handles)
%<
    strModel = get( handles.m_ctrlModel, 'String' );

    % parse the file location into a path and name
    % if it is empty then use GUI directory
    if isempty( strModel )
        strPath = 'D:\bmed_tools\reklab_exp\rek_lab_gui';
    else
        k = findstr( '\', strModel );
        pos = k(end);
        strName = strModel(pos+1:end-4);
        strPath = strModel(1:pos-1);
    end
    
    try
        cd( strPath );
    catch 
        disp( 'ASSERT: Model File Path not found.' );
    end

    % Simulink model files only
    FileFilter = '*.mdl';
    
    % File browse dialog
    [ strName, strPath ] = uigetfile( FileFilter );
    strFullPath = [strPath, strName];
        
    if ( strPath ~= 0 )
        set( handles.m_ctrlModel, 'String', strFullPath );
    
        guidata(hObject, handles);
    end
%>


% Callback for MyGUI File Browse
function m_ctrlMyGUIFile_Callback(hObject, eventdata, handles)
%<
    strMyGUI = get( handles.m_ctrlMyGUI, 'String' );
    
    % parse the file location into a path and name
    % if it is empty then use GUI directory
    if isempty( strMyGUI )
        strPath = 'D:\bmed_tools\reklab_exp\rek_lab_gui';
    else
        k = findstr( '\', strMyGUI );
        pos = k(end);
        strName = strMyGUI(pos+1:end-4);
        strPath = strMyGUI(1:pos-1);
    end
    
    try
        cd( strPath );
    catch 
        disp( 'ASSERT: MyGui File Path not found.' );
    end

    % m-files only
    FileFilter = '*.m';
    
    % File browse dialog
    [ strName, strPath ] = uigetfile( FileFilter );
    strFullPath = [strPath, strName];
        
    if ( strPath ~= 0 )
        set( handles.m_ctrlMyGUI, 'String', strFullPath );
    
        guidata(hObject, handles);
    end
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


% Callback for single actuator radio button
function m_ctrlSingleActuator_Callback(hObject, eventdata, handles)
%<
    set( handles.m_ctrlDoubleActuator, 'Value', 0 ); 
    guidata(hObject, handles);
%>


% Callback for double actuator radio button
function m_ctrlDoubleActuator_Callback(hObject, eventdata, handles)
%<
    set( handles.m_ctrlSingleActuator, 'Value', 0 ); 
    guidata(hObject, handles);
%>




% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called






% Callback for Sequence File Browse
function m_ctrlSequenceFile_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlSequenceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    strSequence = get( handles.m_ctrlSequence, 'String' );

    % parse the file location into a path and name
    % if it is empty then use GUI directory
    if isempty( strSequence )
        strPath = 'D:\bmed_tools\reklab_exp\rek_lab_gui';
    else
        k = findstr( '\', strSequence );
        pos = k(end);
        strName = strSequence(pos+1:end-4);
        strPath = strSequence(1:pos-1);
    end

    try
        cd( strPath );
    catch 
        disp( 'ASSERT: Sequence File Path not found.' );
    end

    % m-files only
    FileFilter = '*.m';
    
    % File browse dialog
    [ strName, strPath ] = uigetfile( FileFilter );
    strFullPath = [strPath, strName];
        
    if ( strPath ~= 0 )
        set( handles.m_ctrlSequence, 'String', strFullPath );
    
        guidata(hObject, handles);
    end
%>





% --- Executes during object creation, after setting all properties.
function m_ctrlSequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_ctrlSequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function m_ctrlMyGUI_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlMyGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_ctrlMyGUI as text
%        str2double(get(hObject,'String')) returns contents of m_ctrlMyGUI as a double




% --- Executes on button press in m_ctrlHelp.
function m_ctrlHelp_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% open('D:\BMED_Tools\REKLAB_exp\REK_LAB_GUI\Preference Manager Help.doc');
web('UserGuide.htm');



function m_ctrlDataSets_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlDataSets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_ctrlDataSets as text
%        str2double(get(hObject,'String')) returns contents of m_ctrlDataSets as a double


% --- Executes during object creation, after setting all properties.
function m_ctrlDataSets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_ctrlDataSets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in m_ctrlDataSetsFile.
function m_ctrlDataSetsFile_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlDataSetsFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  strDataSets = get( handles.m_ctrlDataSets, 'String' );
       
    if isempty( strDataSets )
        strPath = 'D:\bmed_tools\reklab_exp\rek_lab_gui';
    else
        strPath = strDataSets;
    end
    
    try
        cd( strPath );
    catch 
        disp( 'ASSERT: Trials File Path not found.' );
    end
    
    % Directory browse dialog
    strPath = uigetdir;
        
    if ( strPath ~= 0 )
        set( handles.m_ctrlDataSets, 'String', strPath );
    
        guidata(hObject, handles);
    end

