function varargout = CUID_TrialSelection(varargin)
% CUID_TRIALSELECTION M-file for CUID_TrialSelection.fig
%      CUID_TRIALSELECTION, by itself, creates a new CUID_TRIALSELECTION or raises the existing
%      singleton*.
%
%      H = CUID_TRIALSELECTION returns the handle to a new CUID_TRIALSELECTION or the handle to
%      the existing singleton*.
%
%      CUID_TRIALSELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUID_TRIALSELECTION.M with the given input arguments.
%
%      CUID_TRIALSELECTION('Property','Value',...) creates a new CUID_TRIALSELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUID_TrialSelection_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUID_TrialSelection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUID_TrialSelection

% Last Modified by GUIDE v2.5 05-Jun-2003 15:01:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUID_TrialSelection_OpeningFcn, ...
                   'gui_OutputFcn',  @CUID_TrialSelection_OutputFcn, ...
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
function CUID_TrialSelection_OpeningFcn(hObject, eventdata, handles, varargin)
%<
    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUID_TrialSelection
    handles.output = hObject;

    % for returning the selected trial
    handles.nSelected = 0;
    
    % need to pass the document as we can't return two arguments, but need to store list of inputs as well as the selected trial
    handles.Document = varargin{1};
    
    
    % parameters for list setup
    Document = handles.Document;   
    TrialMgr = GetTrialMgr( Document );
    nSize = GetSize( TrialMgr );
    nSelected = GetTrial( Document );
    
    % setup listbox
    if ( nSize > 0 )        
        
        % create a new list of strings
        for i = 1:nSize;
            Trial = GetItem( TrialMgr, i );        
            strList{i} = GetName( Trial );
        end
        
        set( handles.m_ctrlTrialsList, 'String', strList );
        set( handles.m_ctrlTrialsList, 'Value', nSelected );
    end

    
    % init new data
    Initialize_GUIValues( hObject, handles );    
        
    % Update handles structure
    guidata(hObject, handles);
    
    % Model, so we have to wait on response
    uiwait(handles.figure1);    
%>


% Command Line outputs
function varargout = CUID_TrialSelection_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    delete(handles.figure1);
%>


% Callback for Ok
function m_ctrlOk_Callback(hObject, eventdata, handles)
%<
    Document = handles.Document;
    nSelectedIndex = get( handles.m_ctrlTrialsList, 'Value' );
    Document = SetTrial( Document, nSelectedIndex );
    
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
    % return 'Canel'
    handles.output = get( hObject,'String' );

    % Update handles structure
    guidata(hObject, handles);

    % resume modal
    uiresume(handles.figure1);    
%>

% Callback for Add, which adds the new trial to the list of available ones
function m_ctrlAdd_Callback(hObject, eventdata, handles)
%<
    % Trial dialog box, which returns the new input
    %DL added input argument of Document
    Document = handles.Document;
    Trial = CUID_Trial( Document );
    
    %%PB%% if ( isa( Trial, 'CDS_InputData' ) )
    if ( isa( Trial, 'Ctrl_Trial' ) )
        
        Document = handles.Document;
        TrialMgr = GetTrialMgr( Document );
        
        % add new trial to the list of available
        TrialMgr = AddItem( TrialMgr, Trial );
        nSize = GetSize( TrialMgr );
        
        % save to handles
        Document = SetTrialMgr( Document, TrialMgr );
        handles.Document = Document;
        
        % Update handles structure
        guidata(hObject, handles);

        
        % with MATLAB list, you must first get the current list, and then append the new string item
        strName = GetName( Trial );
        strList = get( handles.m_ctrlTrialsList, 'String' );
        strList{ nSize } = strName;
        
        % set the new list item and select it
        set( handles.m_ctrlTrialsList, 'String', strList );
        set( handles.m_ctrlTrialsList, 'Value', nSize );
        
        % update the GUI
        Initialize_GUIValues( hObject, handles );
        
        % save the new trial
        Preferences = GetPreferences( Document );
        strTrials = GetTrials( Preferences );
        
        %%PB%%TRIAL_PATH = 'C:\Documents and Settings\pbock.CAMPUS\_work\Trials\';
        %%PB%%SaveFile = [TRIAL_PATH, strName, '.mat'];
        SaveFile = [strTrials, '\', strName, '.mat']
        save( SaveFile, 'Trial' )
            
    end
%>


% Initialize GUI based on the selected item
function Initialize_GUIValues( hObject, handles )
%<
    Document = handles.Document;
    TrialMgr = GetTrialMgr( Document );
    
    nSize = GetSize( TrialMgr );
    
    % set the properties to the currently selected item
    if ( nSize > 0 )
        nSelectedIndex = get( handles.m_ctrlTrialsList, 'Value' );
        Trial = GetItem( TrialMgr, nSelectedIndex );
    
        strParameters = AsString( Trial );   
        set(handles.m_ctrlParameters, 'String', strParameters);    
        
    % clear the properties if empty list
    else
        set(handles.m_ctrlParameters, 'String', '');    
    end
%>


% Callback for Remove
function m_ctrlRemove_Callback(hObject, eventdata, handles)
%<
    Document = handles.Document;
    TrialMgr = GetTrialMgr( Document );
    
    
    % get the selected item and the size
    nSelectedIndex = get( handles.m_ctrlTrialsList, 'Value' );
    nSize = GetSize( TrialMgr );
    
    % Get The Trial
    Trial = GetItem ( TrialMgr , nSelectedIndex );
    
    % don't do anything if the list is already empty
    if ( nSize == 0 )
        return
    end
    
    % remove item from the list
    TrialMgr = RemoveItem( TrialMgr, nSelectedIndex );
    nSize = nSize - 1;
    
    % Erase Trial from Hard Disk
    Preferences = GetPreferences( Document );
    strTrials = GetTrials( Preferences );
    strName = GetName( Trial );
    SaveFile = [strTrials, '\', strName, '.mat'];
    delete (SaveFile);

    
    % we still have some remaining, so we must rebuild the list string property
    if ( nSize > 0 )
        
        % create a new list of strings
        for i = 1:nSize;
            Trial = GetItem( TrialMgr, i );        
            strList{i} = GetName( Trial );
        end
        
        set( handles.m_ctrlTrialsList, 'String', strList );
        
        
        % select the previous item to the deleted one
        if ( ( nSelectedIndex - 1 ) > 0 )
            set( handles.m_ctrlTrialsList, 'Value', nSelectedIndex - 1 );
        % last item is selected
        else
            set( handles.m_ctrlTrialsList, 'Value', nSelectedIndex );
        end
        
    % empty list    
    else
        set( handles.m_ctrlTrialsList, 'String', '' );
    end
    
    
    % save to handles
    Document = SetTrialMgr( Document, TrialMgr );
    handles.Document = Document;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % update GUI
    Initialize_GUIValues( hObject, handles )
%>


% Callback for list selection
function m_ctrlTrialsList_Callback(hObject, eventdata, handles)
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