function varargout = CUI_View(varargin)
% $Revision: 1.18 $
% CUI_VIEW M-file for CUI_View.fig
%      CUI_VIEW, by itself, creates a new CUI_VIEW or raises the existing
%      singleton*.
%
%      H = CUI_VIEW returns the handle to a new CUI_VIEW or the handle to
%      the existing singleton*.
%
%      CUI_VIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUI_VIEW.M with the given input arguments.
%
%      CUI_VIEW('Property','Value',...) creates a new CUI_VIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CUI_View_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CUI_View_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to m_ctrlrun (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CUI_View

% Last Modified by GUIDE v2.5 17-Aug-2016 17:52:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CUI_View_OpeningFcn, ...
                   'gui_OutputFcn',  @CUI_View_OutputFcn, ...
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
function CUI_View_OpeningFcn(hObject, eventdata, handles, varargin)
%<

global PreferencesFile
global STATE
global STATE_IDLE

global RADIO_DISABLE

    % have to explicitly set background colour for figures
    set(hObject,'Color','white');

    % Choose default command line output for CUI_View
    handles.output = hObject;

    % Document/View architecture
    handles.m_Document = CDS_Document;
    
    handles.m_pwd = pwd;
    
    % 0.) **** Setup Preferences ****
    
    % fixed name of preferences
    strFullPath = [ PreferencesFile ];

    Preferences = [];
    
    % load up the preferences Assuming that there is a preferences file
    if ( exist( strFullPath ) ~= 0 )
        load( strFullPath, 'Preferences' );
        handles.m_Document = SetPreferences( handles.m_Document, Preferences );
    end
        
    
    % if there is no preferences file, do that first
    if isempty( Preferences )

        Preferences = CDS_Preferences;

        Response = CUID_Preferences( Preferences );

        % if Ok was clicked store the new settings
        if ( isa( Response, 'CDS_Preferences' ) )

            Preferences = Response;

            % store updated preferences
            handles.m_Document = SetPreferences( handles.m_Document, Preferences );

            % fixed name of preferences
            %             PREF_FILE_NAME = '\Preferences.mat';
            %             strFullPath = [ pwd, PREF_FILE_NAME ];
            %
            %             % save preferences to current directory
            %             save( strFullPath, 'Preferences' );

            [FileName, PathName] = uiputfile('*.mat', 'Select a preferences file', 'D:\BMED_Tools\REKLAB_exp\Preferences\');

            if isequal(FileName,0) || isequal(PathName,0)
            else
                save([PathName FileName], 'Preferences')
            end

            guidata( hObject, handles );
        end
    end


    % 1.) **** Setup Workspace ****    
    
    % load up the workspace
    strWorkspace = GetWorkspace( Preferences );   
    if ( exist( strWorkspace ) ~= 0 )
        try
            load( strWorkspace, 'nSelectedTrial' );
        catch
            disp('ASSERT: No Workspace file found.');
            nSelectedTrial = 1;
        end
    end
    
    % if nothing was selected, then is some 
    if ( nSelectedTrial < 1 )
        nSelectedTrial = 1;
        disp('ASSERT: No trial was selected, defaulting to index 1.');
    end

    handles.m_Document = SetTrial( handles.m_Document, nSelectedTrial );
    
    
    % 2.) **** Setup Trials ****
    
    % load up the trials
    % DL added *.mat filter
    strTrialPath = GetTrials( Preferences );
    TrialFileList = dir( [strTrialPath '\*.mat'] );
    [ SortedFileNames, SortedIndex ] = sortrows( { TrialFileList.name }' );

    % get size
    nSize = size( SortedFileNames );
    nNumberOfTrials = nSize(1);
    
    % Iterate through the list of file name and load the trial objects for each file
    TrialMgr = GetTrialMgr( handles.m_Document );
    
    
    % we start with 3 because the first two items are '.', '..'
    % DL removed . and .. so no problems.
    for i = 1:nNumberOfTrials    
        FileName = [strTrialPath, '\', SortedFileNames{i}];
        
        try
            load( FileName, 'Trial' );       
        catch
            disp( 'ASSERT: Loading trial failed.' )
            disp([FileName ' is a bad trial'])
        end
        
        % make sure it's a trial
        if isa( Trial, 'Ctrl_Trial' )           
            TrialMgr = AddItem( TrialMgr, Trial );
        end
    end
    
    % set document with the new trials
    handles.m_Document = SetTrialMgr( handles.m_Document, TrialMgr );

    %Bug Fix: If the current trial index is set. User can change
    %trials directories with fewer number of trials then the current selected index. Causes an index
    %exceeds error.
    if ( nSelectedTrial > nNumberOfTrials - 2 )
        nSelectedTrial = 1;
        handles.m_Document = SetTrial( handles.m_Document, nSelectedTrial );
    end
    
    % 3.) Setup DataSets

     % load up the trials
    strDataSetsPath = GetDataSets(Preferences); %TSV - now check preferences for location of data sets
    DataSetsFileList = dir( strDataSetsPath );
    [ DSSortedFileNames, DSSortedIndex ] = sortrows( { DataSetsFileList.name }' );

    % get size
    nSize = size( DSSortedFileNames );
    nNumberOfDataSets = nSize(1);
    
    % Iterate through the list of file name and load the trial objects for each file
    DataSetMgr = GetDataSetMgr( handles.m_Document );
    
    
    % we start with 3 because the first two items are '.', '..'
    
    for i = 3:nNumberOfDataSets    
        DSFileName = [strDataSetsPath,'\', DSSortedFileNames{i}];
        
        try
            load( DSFileName, 'DataSet' );       
        catch
            disp( 'ASSERT: Loading data set failed.' )
        end
        
        % make sure it's a data set
        if isa( DataSet, 'Ctrl_DataSet' )           
            DataSetMgr = AddItem( DataSetMgr, DataSet );
        end
    end
    
    % For now set deafault data set as 1st in range
    nSize = GetSize ( DataSetMgr );
    if nSize > 0
        nSelectedDataSet = 1;
    else
        nSelectedDataSet = 0;
    end
    handles.m_Document = SetDataSet ( handles.m_Document, nSelectedDataSet );
    
    % set document with the new trials
    handles.m_Document = SetDataSetMgr( handles.m_Document, DataSetMgr );

    %Bug Fix: If the current trial index is set. User can change
    %trials directories with fewer number of trials then the current selected index. Causes an index
    %exceeds error.
%     if ( nSelectedTrial > nNumberOfTrials - 2 )
%         nSelectedTrial = 1;
%         handles.m_Document = SetTrial( handles.m_Document, nSelectedTrial );
%     end
        
    % 3.)   Setup filters
   
    % GPIB Equipment in garbage.
    
    % 4.)   Connect to Database
    
    % TODO
    
    %Starts GUI in idle state and activate/deactivates appropriate buttons
    SetState(STATE_IDLE, handles); 
    
    %Disable New Case/New Realization ratio button because must start with
    %new case
    radioButtonControl_NCNR(RADIO_DISABLE, handles)

 
    Initialize_GUIValues( hObject, handles );

    % Update handles structure
    guidata(hObject, handles);
%>


% Command Line outputs
function varargout = CUI_View_OutputFcn(hObject, eventdata, handles)
%<
    % Get default command line output from handles structure
    varargout{1} = handles.output;
%>





% Trial Callback
function m_ctrlTrial_Callback(hObject, eventdata, handles)
%<
    global STATE_MODEL_LOADED
    global STATE_IDLE
    global STATE
    global NEW_TRIAL_TYPE
    
    global RADIO_ENABLE
    
    Document = handles.m_Document;
    
%     % get the active trial
%     Trial = handles.m_Trial;
    
   
   
    
    % open Experiment Parameters Dialog box
    Response = CUID_TrialSelection( Document );
    

    
    % if Ok was clicked store the new settings
    if ( isa( Response, 'CDS_Document' ) )
        handles.m_Document = Response;
        guidata( hObject, handles );
        
        Initialize_GUIValues( hObject, handles );
        
        if STATE == STATE_IDLE;
            %Stay in idle state
        else
            SetState(STATE_MODEL_LOADED, handles); % Stimulus still needs to be re-uploaded
        end
        
        %Disable New Case/New Realization ratio button because must start with
        %new case after change trial type
        radioButtonControl_NCNR(NEW_TRIAL_TYPE, handles);

    end
%>


% Run Callback (Load Model Button)
    function m_ctrlRun_Callback(hObject, eventdata, handles)
        %<
        %STATES
        global STATE_IDLE
        global STATE_MODEL_LOADED
        global STATE_READY
        global STATE_SAMPLING
        global STATE
        
        %BUTTONS
        global LOAD_MODEL
        
        global TG
        
        % DL 180407
        % Added section to prevent accidental loading of model when load model is
        % pressed following initial instance
        
        
        % FA check for forward flow is on
        % FA check if user wants to reload model and reminds to refresh
        % personal GUIs
        
        reload_flag = false;    %Flag when user reloads model to remind them to reload personal GUI variables
        
        %%% Step 1:Check if xPC Target available to load model
        if strcmp(xpctargetping, 'failed') %Computer not available
            
            %Go back to IDLE state if xpc doesn't respond
            SetState(STATE_IDLE, handles);
            
            %FAILED MESSGAGE
            strState = 'Model failed to load';
            strBlank = '';
            strNext = 'Unable to communicate with xPC Target';
            strFinal = 'Check that Renshaw is turned on';
            strMsg = [cellstr(strState); cellstr(strBlank); cellstr(strNext); cellstr(strFinal)];
            set(handles.m_ctrlInstructions, 'String', strMsg);
            



%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%


        else %xPC available to load model
            
            %%%Step 2: Check if a model is already loaded
            
            
            if(~strcmpi(get(xpc,'Application'), 'loader'))  %checks if there is a model loaded on RENSHAW
                
                %There is a model loaded
                
                if  (strcmpi(get(xpc,'Status'), 'running'))  %checks if model on RENSHAW is in "running" state
                    
                    %%Step 3: There is a model is loaded and running, checks to see
                    %%if forward flow is on before reloading model. If model is older and does not
                    %%contain FwdFlow_Use block, user must verify that forward
                    %%flow is off.
                    
                    try
                        %Check if user uses hydraulics
                        if(getparam(xpc,getparamid(xpc,'FwdFlow_Use','Value'))==0)%No
                            FwdFlow_On=1; %Fwd flow not on
                        else %User uses hydraulics
                            FwdFlow_On=getsignal(xpc,getsignalid(xpc,'FwdFlow_Stat'));%Check flow indicator in model
                        end
                        
                        while (FwdFlow_On==0) %If fwd flow is on, loops until it is off
                            warn_box = questdlg('Turn off forward flow! Press OK when done.','!! Warning !!','Ok','Cancel','Ok');
                            waitfor(warn_box); %waits for user response to warning dialog box
                            if strcmp(warn_box,'Cancel')
                                return
                            end
                            
                            FwdFlow_On=getsignal(xpc,getsignalid(xpc,'FwdFlow_Stat'));%Re-check flow indicator in model
                        end
                    catch ME
                        
                        %backward compatibility if model has not been updated
                        %to check for FwdFlow
                        warn_box = warndlg(sprintf('Turn off forward flow!  Press OK when done. \n\n Model does not include FwdFlow status block. \n Consider updating your Model to match base model.  '),'Warning!','modal');
                        waitfor(warn_box); %waits for OK to be pressed in warning dialog box
                        
                    end %End try
                    
                end  % If the model on RENSHAW is stopped, there is no need to check if FwdFlow is on
                
                
                
                %Ask user if they want to reload their model
                
                yorn = questdlg(sprintf('Are you sure you want to re-load the model from Preferences?'),'Re-load model?','Yes','No','No');
                
                if strcmp(yorn, 'No') %Don't want to load/reload model from Preferences File
                    return %Return without loading model
                end
                
                reload_flag = true; %User is reloading model, personal GUI reminder will appear
                
            end  % If there is no model loaded on RENSHAW, there is no need to check if FwdFlow is on
            
            
            
            %Continue to load model
            
            %%% Step 4:Settings
            % get doc and trial manager
            Document = handles.m_Document;
            TrialMgr = GetTrialMgr( Document );
            OutputMgr = GetOutputMgr( Document );
            
            % get the selected trial
            nTrialIndex = GetTrial( Document );
            Trial = GetItem( TrialMgr, nTrialIndex );
            
            
            % get the model location, trial object needs this for xPC communication
            Preferences = GetPreferences( Document );
            strModel = GetModel( Preferences );
            Trial = SetSimulinkModel( Trial, strModel );
            Trial = SetHandle( Trial, handles );    % need this as a way to get back to GUI
            Trial = SetOutputMgr( Trial, OutputMgr );   % need this to pop the outputs in
            nChannels = [ str2num( get( handles.m_ctrlChannel1, 'String' ) ) str2num( get( handles.m_ctrlChannel2, 'String' ) ) ]; % need this to trace the desired signal
            Trial = SetTraceChannels( Trial, nChannels );
            nRealization = str2num( get( handles.m_ctrlNextReal, 'String' ) ); % keeps track of the realizations
            Trial = SetRealization( Trial, nRealization );
            strSubjectName = get( handles.m_ctrlSubjectName, 'String' );
            Trial = SetSubjectName( Trial, strSubjectName );
            %     strActuatorMode = GetActuatorMode;
            %     Trial = SetActuatorMode( Trial, strActuatorMode );
            Initializer = GetInitializer( Document );
            Trial = SetInitializer( Trial, Initializer );
            
            
            
            %%Step 5: Load model
            Trial = ButtonAction( Trial, LOAD_MODEL );%Load model
            if reload_flag
                msgbox('If you have a personal GUI, refresh its parameters now.','Refresh GUI!')
            end
            
            %%%Step 6: Continue to following state  - now ready to load stimulus variables
            SetState(STATE_MODEL_LOADED, handles);
            
            
            % save
            handles.m_Trial = Trial;
        end
        guidata( hObject, handles );
    
    %Execute currently selected trial
    %Upload new Parameters: use set() with signal name
    %Setup scopes for data tracing: Add a Host Scope to trace in MATLAB
    %Grab data from output ports: create data objects from the xPC target output log 
%>


% Save output data
%   - need subject name, date, trial name, etc.
%
% Remove start_control method
%   - remind to set actuator to zero position

%%MB%% added code at the end to iterate through Forward Callback for ramps

% REC Callback - Button starts sampling signals
    function m_ctrlREC_Callback(hObject, eventdata, handles)
        %<
%         global TRIAL_STATE_CONNECTION
%         global TRIAL_STATE_LOADED
%         global TRIAL_STATE_READY
%         global TRIAL_STATE_COMPLETED
        global STATE_IDLE
        global STATE_MODEL_LOADED
        global STATE_READY
        global STATE_SAMPLING
        
        global RADIO_ENABLE

        global RECORD

        %%MB%% Global parameters to use for ramp trials
        global TG;

        global Count MaxCount
        global pass_tq_start %pass_tq_end
        global dRampPosition dRampPosition1 dRampAmp RAMP_TQ_TRIGGER
        global XPC_TRIG_ACTIVE_;
        global XPC_TRIG_INACTIVE_;
        global XPC_CMD_ABORT_;
        global nTraceChannels;
        global NUMBER_OF_CARDS;

        % get the active trial
        Trial = handles.m_Trial;
        
        
        %Set to sampling state
        SetState(STATE_SAMPLING, handles);

                
        %Update which channels should be plotted
        nTraceChannels = [ str2num( get( handles.m_ctrlChannel1, 'String' ) ) str2num( get( handles.m_ctrlChannel2, 'String' ) ) ];
        nc = 8*NUMBER_OF_CARDS;
        if min(nTraceChannels) < 1 | max(nTraceChannels) > nc
            warndlg(['Trace channels must be betwen 1-' num2str(nc) '. Fix trace channels and press forward'], 'Illegal trace channels', 'modal');
            return
        end
        


        %Realization and Subject data
%         nRealization = str2num( get( handles.m_ctrlNextReal, 'String' ) ); % keeps track of the realizations
%         Trial = SetRealization( Trial, nRealization );
        strSubjectName = get( handles.m_ctrlSubjectName, 'String' );
        Trial = SetSubjectName( Trial, strSubjectName );
                
                
        % update graphics
        drawnow;


        % Sampling
        Trial = ButtonAction( Trial, RECORD );
       

    
        %DATA COLLECTION AND RESET FOR NEXT TRIAL RECCORDING

                % Collect & Store Data
                global DOUBLE_ACTUATOR;
                global SINGLE_ACTUATOR;
                global data;
                % scaling constants
                global CONVERTING_VOLTS_2_TORQUE;
                global CONVERTING_VOLTS_2_RADS;
                global SCALING_FACTOR;

                 
                %%%% DATA COLLECTION %%%%

                OutputMgr = GetOutputMgr( Trial );
                nCase =  get( handles.m_ctrlNextCase, 'String' ); %Get next case number for .mat file
                nRealization =  get( handles.m_ctrlNextReal, 'String' );%Get next realization number for .mat file
                nActuatorMode = GetActuatorMode;

                % Get signal names from card_channel_deft2.txt
                fid = fopen('card_channel_def2.txt','r');
                M = textscan(fid, '%s', 'commentStyle', '!','delimiter', '|');
                M1 = M{1};
                m = [];
                for i =1:length(M1)
                    m = [m M1{i} ';'];
                end
                eval(m);

                strSignals = '';
                for i = 1:length(C)
                    strSignals{i} = C{i};
                end

                % adjust for acquisition card scaling
                data = data .* SCALING_FACTOR;

                % Left leg convertion
                data( :, 1 ) = data( :, 1 ) .* CONVERTING_VOLTS_2_RADS;
                %%MB%% Took away the negative sign from in front of data(:,2), since our convention has position & torque directions the same
                data( :, 2 ) = data( :, 2 ) .* CONVERTING_VOLTS_2_TORQUE;


                % double actuator specific conversion
                if ( nActuatorMode == DOUBLE_ACTUATOR )
                    data( :, 2 ) = -data( :, 2 );

                    % right leg convertion
                    data( :, 3 ) = data( :, 3 ) .* CONVERTING_VOLTS_2_RADS;
                    data( :, 4 ) = data( :, 4 ) .* CONVERTING_VOLTS_2_TORQUE;

                    % single actuator specific conversion
                else
                    % raw input
                    data( :, 3 ) = data( :, 3 ) .* CONVERTING_VOLTS_2_RADS;
                end

%                 % Save Mat

% 
%                 % Save mat file as backup
%                 % Mat files currently used to plot old data ... may be switched
%                 % to flb in the future
% 

%                 stored_data = data;
%                 save( strFullPathData, 'stored_data' );
%                 clear stored_data

                

                % Iterate through the channels and collect the output
                % DL added 2nd card.
                % DL added 3rd card 29/11/05
                % DL added 4th card 12/04/07
                % DL Changed to NUMBER_OF_CARDS global
                
                Preferences = GetPreferences( handles.m_Document );
                strOutputFilesDirectory = GetOutputs( Preferences );              
                strName = [ nCase, '_', nRealization, '_', GetName( Trial ), '_', GetSubjectName( Trial ) ];
                strFullPathData = [ strOutputFilesDirectory, '\', strName, '.mat' ];



                global SAMPLING_FREQUENCY
                global STOP_ACQUISITION;


                for x = 1:8*NUMBER_OF_CARDS

                    % new output data object
                    OutputData = CDS_OutputData;

                    % set data
                    t = 1/SAMPLING_FREQUENCY;
                    y = strFullPathData;

                    % flag the stopped data
                    strAcquisition = '';
                    if ( STOP_ACQUISITION == 1 )
                        strAcquisition = ' _STOPPED';
                    end

                    % name the output
                    strTrialName = GetName( Trial );
                    strSubjectName = GetSubjectName( Trial );
                    strName = [nCase, '_' nRealization, '_', strSignals{x}, ' ', strTrialName, ' ', strSubjectName, strAcquisition ];
                    OutputData = SetName( OutputData, strName );

                    % set object and then add to output manager
                    OutputData = SetRealization( OutputData, nRealization );
                    OutputData = SetOutputType( OutputData, strSignals{x} );
                    OutputData = SetTrialName( OutputData, strTrialName );
                    OutputData = SetSubject( OutputData, strSubjectName );
                    OutputData = SetTimeIncrement( OutputData, t );
                    OutputData = SetSaveFile( OutputData, y );
                    OutputData = SetChannelNumber( OutputData, x );
                    OutputMgr = AddItem( OutputMgr, OutputData );
                end

                % clear if user stopped and disable stop button
                STOP_ACQUISITION = 0;
                set( handles.m_ctrlStop, 'Enable', 'off' );

                % update the output manager
                Trial = SetOutputMgr( Trial, OutputMgr );


                %                 %             nMode = GetActuatorMode( Preferences );
                
                flb_data = [];

                % DL : only collecting data from channels specified by the submenu in the
                % GUI

                nSelectedIndex = GetDataSet ( handles.m_Document );
                DataSetMgr = GetDataSetMgr ( handles.m_Document );
                DataSet = GetItem ( DataSetMgr , nSelectedIndex );
                ChannelVector = GetChannelVector ( DataSet );
                ChannelNames = GetChannelNames ( DataSet );

                %Creating flb_data array

                for i = 1 : length( ChannelVector )
                    flb_data( :, i ) = data(:, ChannelVector(i) );
                end
                
                %Check length that data should be
                nSampleRate_Hz = SAMPLING_FREQUENCY;
                nLength_s = GetLength_s( Trial );
                num_samples = nLength_s*nSampleRate_Hz;
                
                %Append NaN to data if not data not full trial length,
                %i.e. STOP was pressed to end acquisition prematurely
                %This is done so that if recording multiple realizations of
                %the same trial, no error is generated when saving to flb
                if (length(flb_data) ~= num_samples) %compare data length to theoretical length
                    diff_length = num_samples - length(flb_data); %determine difference in length
                    fill = ones(diff_length,length( ChannelVector ))*NaN; %create filler matrix to complete length
                    flb_data = [flb_data; fill];
                end
                



                %DL Save flb
                flbName = [ strOutputFilesDirectory, '\', GetSubjectName( Trial ), '_'  datestr(now, 'ddmmyy'), '.flb'];

                % Backup old flb file
                if exist(flbName,'file') == 2
                    flbNameBack =  [ strOutputFilesDirectory, '\', GetSubjectName( Trial ), '_'  datestr(now, 'ddmmyy'), 'backup.flb'];
                    [success, message] =  copyfile(flbName,flbNameBack);
                    if success == 0
                        errordlg(message,'FLB Error','modal');
                    end
                end
                %  mattoflb( flbName, flb_data, 'a', datestr(now), 1/1000, 'Domain Name', ChannelNames );
                nNewCase = get(handles.radioNewCase , 'Value');
                if nNewCase
                    nCaseNum = str2double(get(handles.m_ctrlNextCase, 'String')); %Get case number next in line to be written to
                    set(handles.m_ctrlPrevCase, 'String', nCaseNum); %Replace previous case # with new case #
                    nCaseNum = nCaseNum + 1;
                    set(handles.m_ctrlNextCase, 'String', nCaseNum); %Increment next case #
                    
                    nRealNum = str2double(get(handles.m_ctrlNextReal, 'String')); %Get number of next realization
                    set(handles.m_ctrlPrevReal, 'String', nRealNum); %Replace previous realization # with new one
                    
                    %Always reset realizations to 1 for new case
                    set(handles.m_ctrlNextReal, 'String', '1');

                    %Create data structure
                    D.Data = flb_data;
                    D.comment = get(handles.m_ctrlComment, 'String');
                    D.chanName = ChannelNames;
                    D.domainIncr = 1/SAMPLING_FREQUENCY;
                    D.domainName = 'time (s)';
                    D.domainStart = 1/SAMPLING_FREQUENCY;

                    % Save flb file
                    try
                        mat2flb(flbName, 'append', D)
                    catch
                        errordlg(['Problem saving FLB file. Make backup copy of ' flbNameBack ' and change subject Name'],'FLB Error','modal');
                    end
                else
                    % Add realization to current case
                    try
                        mat2flb(flbName, 'newreal', flb_data);
                        nRealNum = str2double(get(handles.m_ctrlNextReal, 'String')); %Get number of next realization
                        set(handles.m_ctrlPrevReal, 'String', nRealNum); %Replace previous realization # with new one
                        nRealNum = nRealNum + 1;
                        set(handles.m_ctrlNextReal, 'String', nRealNum);%Increment realization #
                    catch
                        errordlg(['Problem saving FLB file. Make backup copy of ' flbNameBack ' and change subject Name'],'FLB Error','modal')
                    end
                end

                % store the initialized hardware object
                handles.m_Document = SetInitializer( handles.m_Document, GetInitializer( Trial ) );

                % increment the realization
                nRealization = GetRealization( Trial );
                nRealization = nRealization + 1;
%                 set(handles.m_ctrlNextReal, 'String', num2str(nRealization));
                Trial = SetRealization( Trial, nRealization );

%       %Ready for another trial
        SetState(STATE_READY, handles);
        %Added by KJ to check off toggle purturbation
        set(handles.m_ctrlTogglePerturbations,'Value',0);
        %Enable choice of new realization or new  case
        radioButtonControl_NCNR(RADIO_ENABLE, handles)




%         end

        % get updated output manager
        OutputMgr = GetOutputMgr( Trial );


        % create output items in the list box
        nOutputs = GetSize( OutputMgr );
        if ( nOutputs ~= 0 )

            strOutputs = '';
            for x = 1:nOutputs
                OutputData = GetItem( OutputMgr, x );
                strOutputs{x} = GetName( OutputData );
            end

%             % set list box string
%             set(handles.m_ctrlOutput, 'String', strOutputs);

            % set the updated output manager TODO: get output to work with realizations and multiple runs
            handles.m_Document = SetOutputMgr( handles.m_Document, OutputMgr );
        end


        % once we completed the trial, clear it and get ready for another realization
        nState = GetState( Trial );

 

    % save
    handles.m_Trial = Trial;
    guidata( hObject, handles );

    %%MB%% Adding iteration loop for ramp trials (so user doesn't have to
%%continually press fwd button for each ramp)
%!!!!!!!!!!!!! First time you hit fwd button, the ramp must be upwards
    nState = GetState( Trial );
    %RAMP_TQ_TRIGGER is whether you want repetition (initialized to zero)
    %Count is initialized to zero; MaxCount is the number of iterations
    if (RAMP_TQ_TRIGGER == 1) && (Count < MaxCount) && (nState == TRIAL_STATE_READY)

%         xpc_set_param('PassTQ',pass_tq_start);
        
%%HIG: Comment this section out
%         if rem(Count,2) ~= 0 %will do a downwards pulse, so we set the value of invert to negative 1
%             setparam(TG,getparamid(TG,'invert','Value'),-1);
%             dRampPosition = 0; 
%             dRampPosition1 = 0;
%         else
%             setparam(TG,getparamid(TG,'invert','Value'),1); % will do upwards pulse
%             dRampPosition = dRampAmp;
%             dRampPosition1 = -1*dRampAmp;
%         end
%%HIG: End

%             
% 
%         xpc_set_param('Ramp1',0);
%         pause(1);
%         xpc_set_param('Ramp',0);
%         pause(1);

%         dRampPosition = dRampAmp;
%         dRampPosition1 = -1*dRampAmp;
%         if rem(Count,2) == 0 %Count is even => do downwards ramp
%             dRampPosition = 0;
%         
% %             xpc_set_param('PassTQ',pass_tq_end);
%         else
%             dRampPosition = 0.15; %Count is odd => do upwards ramp
% %             xpc_set_param('PassTQ',pass_tq_start);
%         end    
        
%         pause(2);
        Count = Count + 1;
        %make call to Foward button again
        %DL added 2 second pause
        siesta(2);
        m_ctrlREC_Callback(hObject, eventdata, handles);
    end
   
    if (RAMP_TQ_TRIGGER == 1)
%         pause(2);


    end
    
    Count = 1; %reset Count for subsequent trials


% Back Callback
function m_ctrlSetup_Callback(hObject, eventdata, handles)
%<
%     global TRIAL_STATE_READY;
%     global TRIAL_STATE_LOADED;
%     global TRIAL_STATE_CONNECTION;
%     global ALREADY_LOADED

    global STATE_IDLE
    global STATE_MODEL_LOADED
    global STATE_READY
    global STATE_SAMPLING

    %BUTTONS
    global LOAD_MODEL
    global SETUP
    global RECORD
    global STOP
    
    %Get current document
    Document = handles.m_Document;
    TrialMgr = GetTrialMgr( Document );
    OutputMgr = GetOutputMgr( Document );
    
    % get the selected trial
    nTrialIndex = GetTrial( Document );
    Trial = GetItem( TrialMgr, nTrialIndex );
    
    
    % get the model location, trial object needs this for xPC communication
    Preferences = GetPreferences( Document );
    strModel = GetModel( Preferences );
    Trial = SetSimulinkModel( Trial, strModel );
    Trial = SetHandle( Trial, handles );    % need this as a way to get back to GUI
    Trial = SetOutputMgr( Trial, OutputMgr );   % need this to pop the outputs in
    nChannels = [ str2num( get( handles.m_ctrlChannel1, 'String' ) ) str2num( get( handles.m_ctrlChannel2, 'String' ) ) ]; % need this to trace the desired signal
    Trial = SetTraceChannels( Trial, nChannels );
    nRealization = str2num( get( handles.m_ctrlNextReal, 'String' ) ); % keeps track of the realizations
    Trial = SetRealization( Trial, nRealization );
    strSubjectName = get( handles.m_ctrlSubjectName, 'String' );
    Trial = SetSubjectName( Trial, strSubjectName );
    Initializer = GetInitializer( Document );
    Trial = SetInitializer( Trial, Initializer );
        
        
    %Load variables
    Trial = ButtonAction(Trial, SETUP);
    
%     Set next state, ready to record
    SetState(STATE_READY, handles);
    
    handles.m_Trial = Trial;
    guidata( hObject, handles );
    
    
    


% Stop Callback
function m_ctrlStop_Callback(hObject, eventdata, handles)
%<
    global STOP_ACQUISITION;
   
    
    STOP_ACQUISITION = 1; %This value will be checked during recording, a value of 1 will stop the acquisition
    
   
 
%>


% Initialize GUI based on the selected item
function Initialize_GUIValues( hObject, handles )
%<

    
   Document = handles.m_Document;
    TrialMgr = GetTrialMgr( Document );
    
    nSize = GetSize( TrialMgr );
    
    % set the properties to the currently selected item
    if ( nSize > 0 )
        nSelectedIndex = GetTrial( Document );
                        
        Trial = GetItem( TrialMgr, nSelectedIndex );
    
        strName = GetName( Trial );
        strParameters = AsString( Trial );
        
        set(handles.m_ctrlSelectedTrial, 'String', strName);
        set(handles.m_ctrlParameters, 'String', strParameters);    
        
        PlotInput( hObject, handles );
        
    % clear the properties if empty list
    else
        set(handles.m_ctrlSelectedTrial, 'String', '');
        set(handles.m_ctrlParameters, 'String', '');    
    end
%>


% Plots the current input
function PlotInput( hObject, handles )
%<
    
    Document = handles.m_Document;
    TrialMgr = GetTrialMgr( Document );
    nSelectedIndex = GetTrial( Document );
    
    Trial = GetItem( TrialMgr, nSelectedIndex );
    
    InputData = GetInputData( Trial );
    
    t = GetTimeArray( InputData );
    y = GetMagnitudeArray( InputData );
    
    % target the input plot
    axes( handles.m_ctrlPlot1 );
    
    plot( t, y ); 
    
    strTitle = ['Plot for ', GetName( Trial ), ' Trial'];
    title( cellstr( strTitle ) );
    xlabel('Time (s)');
    ylabel('Magnitude');
%>


% Resize Overload
function figure1_ResizeFcn(hObject, eventdata, handles)
%<
    %currently uses "Proportional" behavior
%>



% Callback for Preferences
function m_ctrlPreferences_Callback(hObject, eventdata, handles)
%<
Preferences = GetPreferences( handles.m_Document );

% if empty create new one
if ( isempty( Preferences ) )
    Preferences = CDS_Preferences;
end

dirPrevious = pwd;
Response = CUID_Preferences( Preferences );



% if Ok was clicked store the new settings
if ( isa( Response, 'CDS_Preferences' ) )

    PreviousPreferences = Preferences;
    Preferences = Response;

    strPreviousTrials = GetTrials( PreviousPreferences );
    strTrials = GetTrials( Preferences );


    % we need to reload the trials
    if ( strcmp( strPreviousTrials, strTrials ) == 0 )

        % load up the trials
        strTrialPath = GetTrials( Preferences );
        TrialFileList = dir( strTrialPath );
        [ SortedFileNames, SortedIndex ] = sortrows( { TrialFileList.name }' );

        % get size
        nSize = size( SortedFileNames );
        nNumberOfTrials = nSize(1);

        % Iterate through the list of file name and load the trial objects for each file
        TrialMgr = GetTrialMgr( handles.m_Document );

        % Clear Trials
        TrialMgr = RemoveAll( TrialMgr );

        % we start with 3 because the first two items are '.', '..'
        for i = 3:nNumberOfTrials
            FileName = [strTrialPath, '\', SortedFileNames{i}];

            try
                load( FileName, 'Trial' );
            catch
                disp( 'ASSERT: Loading trial failed.' )
            end

            % make sure it's a trial
            if isa( Trial, 'Ctrl_Trial' )
                TrialMgr = AddItem( TrialMgr, Trial );
            end
        end

        % set document with the new trials
        handles.m_Document = SetTrialMgr( handles.m_Document, TrialMgr );


        % get the current trial
        nSelectedTrial = GetTrial( handles.m_Document );

        %If the current trial index is set. User can change trials directories with fewer number of trials then the current selected index.
        if ( nSelectedTrial > nNumberOfTrials - 2 )
            nSelectedTrial = 1;
            handles.m_Document = SetTrial( handles.m_Document, nSelectedTrial );
        end


        Initialize_GUIValues( hObject, handles );
    end
    
    % DL & FA added refreshing of dataset directory
    
    
    strPreviousDataSetsPath = GetDataSets(PreviousPreferences);
    strDataSetsPath = GetDataSets(Preferences);
    
    if ( strcmp( strPreviousDataSetsPath, strDataSetsPath ) == 0 )
        DataSetsFileList = dir( strDataSetsPath );
        [ DSSortedFileNames, DSSortedIndex ] = sortrows( { DataSetsFileList.name }' );
        
        % get size
        nSize = size( DSSortedFileNames );
        nNumberOfDataSets = nSize(1);
        
        % Iterate through the list of file name and load the trial objects for each file
        DataSetMgr = GetDataSetMgr( handles.m_Document );
        
        % Clear Trials
        DataSetMgr = RemoveAll( DataSetMgr );
        
        % we start with 3 because the first two items are '.', '..'
        
        for i = 3:nNumberOfDataSets
            DSFileName = [strDataSetsPath,'\', DSSortedFileNames{i}];
            
            try
                load( DSFileName, 'DataSet' );
            catch
                disp( 'ASSERT: Loading data set failed.' )
            end
            
            % make sure it's a data set
            if isa( DataSet, 'Ctrl_DataSet' )
                DataSetMgr = AddItem( DataSetMgr, DataSet );
            end
        end
        
        % For now set deafault data set as 1st in range
        nSize = GetSize ( DataSetMgr );
        if nSize > 0
            nSelectedDataSet = 1;
        else
            nSelectedDataSet = 0;
        end
        handles.m_Document = SetDataSet ( handles.m_Document, nSelectedDataSet );
        
        % set document with the new trials
        handles.m_Document = SetDataSetMgr( handles.m_Document, DataSetMgr );
    end


    % store updated preferences
    handles.m_Document = SetPreferences( handles.m_Document, Preferences );

    %         % fixed name of preferences
    %         PREF_FILE_NAME = '\Preferences.mat';
    %         strFullPath = [ handles.m_pwd, PREF_FILE_NAME ];
    %
    %         try
    %             % save preferences to current directory
    %             save( strFullPath, 'Preferences' );
    %         catch
    %             disp( 'ASSERT: Saving preferences failed.' );
    %         end

    [FileName, PathName] = uiputfile('*.mat', 'Save preferences file as:', 'D:\BMED_Tools\REKLAB_exp\Preferences\');

    if isequal(FileName,0) || isequal(PathName,0)
    else
        save([PathName FileName], 'Preferences')
    end
    guidata( hObject, handles );
end


try
    cd( dirPrevious );
catch
    disp( 'ASSERT: Change directory error.' );
end
%>




% Close callback
function figure1_CloseRequestFcn(hObject, eventdata, handles)
%<
    cd(handles.m_pwd);
    delete(hObject);
%>


% Toggles perturbations
function m_ctrlTogglePerturbations_Callback(hObject, eventdata, handles)
%<
    global XPC_TRIG_ACTIVE_;
    global XPC_TRIG_INACTIVE_;
    global XPC_CMD_ABORT_;
    global TG;

    CHECKED = 1;
    NOT_CHECKED = 0;
    
    nCheckState = get( handles.m_ctrlTogglePerturbations, 'Value' );
    
    % if checked, toggle the perturbations on
    if ( nCheckState == CHECKED )
        ControlTogglePerturbations(XPC_TRIG_ACTIVE_)
    else
        ControlTogglePerturbations(XPC_TRIG_INACTIVE_)
    end
%>




% --------------------------------------------------------------------
function m_ctrlTriggering_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlTriggering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%<
    global TG;

    Triggering = GetTriggering( handles.m_Document );
    
    if ( isempty( Triggering ) )
        Triggering = CDS_Triggering;    
    end
        
    Response = CUID_Triggering( Triggering );
    
    
    % if Ok was clicked store the new settings
    if ( isa( Response, 'CDS_Triggering' ) )
        Triggering = Response;
        handles.m_Document = SetTriggering( handles.m_Document, Triggering );
        Trial = handles.m_Trial;
        Trial = SetHandle( Trial, handles );    % Update Trial
        handles.m_Trial = Trial;

 % Set Parameters required for triggering
        
%         dLeft = GetLeft( PosOff );
%         dRight = GetRight( PosOff );
%         
        
%         % attempt to set parameters
%         try
%             xpc_set_param('LPos_Off',dLeft);
%             xpc_set_param('RPos Off',dRight);
%         catch
%             disp( 'ASSERT: Error using xpc_set_param.' );
%         end
%             
        guidata( hObject, handles );
    end
%>


% --------------------------------------------------------------------
function m_ctrlMyGUI_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlMyGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dDocument = handles.m_Document;
dPreferences = GetPreferences( dDocument );
dMyGUI = GetMyGUI( dPreferences );
k = findstr(dMyGUI, '\');
s = dMyGUI(1:k(end));

path(s,path);
eval(['run ' dMyGUI]);


% --------------------------------------------------------------------
function m_ctrl_GUI_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrl_GUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function m_ctrlDataSets_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlDataSets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Open new window with channel selection tools and preferences
Document = handles.m_Document;
Response = CUID_DataSetSelection ( Document );

% if Ok was clicked store the new settings
if ( isa( Response, 'CDS_Document' ) )
    handles.m_Document = Response;
    guidata( hObject, handles );
end


function m_ctrlComment_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlComment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_ctrlComment as text
%        str2double(get(hObject,'String')) returns contents of m_ctrlComment as a double


% --- Executes during object creation, after setting all properties.
function m_ctrlComment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_ctrlComment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_CtrlRealization_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlnextreal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_ctrlnextreal as text
%        str2double(get(hObject,'String')) returns contents of m_ctrlnextreal as a double


% --- Executes during object creation, after setting all properties.
function m_CtrlRealization_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_ctrlnextreal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_ctrlRealization_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlNextReal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_ctrlNextReal as text
%        str2double(get(hObject,'String')) returns contents of m_ctrlNextReal as a double


% --- Executes during object creation, after setting all properties.
function m_ctrlNextReal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_ctrlNextReal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in m_ctrlNewCase.
function m_ctrlNewCase_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlNewCase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of m_ctrlNewCase






% --------------------------------------------------------------------
function m_ctrlHelp_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function m_ctrlUserGuide_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlUserGuide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Open help documentation

web('UserGuide.htm');



% --------------------------------------------------------------------
function m_ctrlAbout_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% CVS updates this string when commited to repository
revisionString = '$Revision: 1.18 $';
dateString = '$Date: 2011/02/07 22:10:58 $';
authorString = '$Author: falley $';

cellString = {revisionString(2:end-2); dateString(2:end-2); authorString(2:end-2)};
msgbox(cellString,'About GUI','help');






% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

%Changes appropriate next case and next realization values when the
%selection is changed (within 'radioButtonControl_NCNR')

global NEW_CASE
global NEW_REALIZATION

switch get(eventdata.NewValue,'Tag') % Get Tag of selected radio button
    case 'radioNewCase' %New case is selected
        radioButtonControl_NCNR(NEW_CASE, handles);
    case 'radioNewReal' %New realization is selected
        radioButtonControl_NCNR(NEW_REALIZATION, handles);
end




% --- Executes on button press in pushbutton_Subject.
function pushbutton_Subject_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Subject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NEW_SUBJECT

prompt = {'Warning!! Changing the subject name will create a new flb file'};
dlg_title = 'Enter Subject Name';
num_lines = 1;
currentName = get(handles.m_ctrlSubjectName,'String');
blank = {currentName};
SubjectName = inputdlg(prompt,dlg_title, num_lines, blank);

if (~isempty(SubjectName))
    SubjectName = SubjectName{:}; %Change from cell array to string
    if ~strcmp(SubjectName,currentName)%Check if previous name same as new name before resetting
        
        set(handles.m_ctrlSubjectName, 'String', SubjectName)
        
        radioButtonControl_NCNR(NEW_SUBJECT, handles); %Controls state of newCase/newRealization radio buttons


    end
    

end



% --------------------------------------------------------------------
function m_ctrlPlotFlbData_Callback(hObject, eventdata, handles)
% hObject    handle to m_ctrlPlotFlbData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This opens separate gui to examine flb data and plot selected recordings


 %Get user preferences to find out where output data stored
 Preferences = GetPreferences( handles.m_Document );
 strOutputFilesDirectory = GetOutputs( Preferences );
 
 %Get subject name from interface (used in flb file name)
 strSubjectName = get( handles.m_ctrlSubjectName, 'String' );
 flbName =  [ strOutputFilesDirectory, '\', strSubjectName, '_'  datestr(now, 'ddmmyy'), '.flb'];
 
%  if (exist(flbname, 'file')==2)
%     file_exist = 1; %An flb file has been created for this session
%  else
%      file_exist = 0; %No data has yet been recorded for this subject/session
%  end
 
 plotter_gui({flbName}); %Open gui plotter and send default flb file for this session and indicate 



% --- Executes when uipanel7 is resized.
function uipanel7_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

