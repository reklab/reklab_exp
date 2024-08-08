function SetState( newState, handles )
%<
    global STATE_IDLE
    global STATE_MODEL_LOADED
    global STATE_READY
    global STATE_SAMPLING
    global STATE
    global XPC_TRIG_INACTIVE_

%     enumState = varargin{1};
%     Trial.m_enumState = enumState;
%     handles = GetHandle( Trial );
    

    
    %Set global state and enable or disable corresponding GUI buttons
    switch newState
        
        case STATE_IDLE
            set(handles.m_ctrlRun, 'enable', 'on');
            set(handles.m_ctrlSetup, 'enable', 'off');
            set(handles.m_ctrlREC, 'enable', 'off');
            set(handles.m_ctrlStop, 'enable', 'off');
            set(handles.m_ctrlTogglePerturbations,'enable','off')
            set(handles.m_ctrlTogglePerturbations,'Value',0);
            %There is no need to force perturbation trigger to inactive b/c
            %there is no model running (trying to do so causes an error).
            
            strState = 'Trial is Idle.';
            strBlank = '';
            strZero = 'PUT ACTUATOR AT ZERO!';
            strRun = 'Press LOAD MODEL To initiate the experiment and test the connection to Renshaw.';
            strMsg = [cellstr(strState); cellstr(strBlank); cellstr(strZero); cellstr(strRun)];
            set(handles.m_ctrlInstructions, 'String', strMsg);
            
        case STATE_MODEL_LOADED
            
            set(handles.m_ctrlRun, 'enable', 'on');
            set(handles.m_ctrlSetup, 'enable', 'on');
            set(handles.m_ctrlREC, 'enable', 'off');
            set(handles.m_ctrlStop, 'enable', 'off');
            set(handles.m_ctrlTogglePerturbations,'enable','off')
            set(handles.m_ctrlTogglePerturbations,'Value',0);            
            ControlTogglePerturbations(XPC_TRIG_INACTIVE_)

            strState = 'Simulink Model loaded.';
            strBlank = '';
            strTrial = 'Choose trial from ''Tools'' menu';
            strNext = 'Press ''Setup'' to load variables and stimulus.';
            strMsg = [cellstr(strState); cellstr(strBlank); cellstr(strTrial); cellstr(strNext)];
            set(handles.m_ctrlInstructions, 'String', strMsg);
            
        case STATE_READY
            set(handles.m_ctrlRun, 'enable', 'on');
            set(handles.m_ctrlSetup, 'enable', 'on');
            set(handles.m_ctrlREC, 'enable', 'on');
            set(handles.m_ctrlStop, 'enable', 'off');
            set(handles.m_ctrlTogglePerturbations,'enable','on')

            
            if STATE == STATE_MODEL_LOADED %Check previous state
                strState = 'Variables and Stimulus uploaded.';
                strBlank = '';
                strNext = '''REC''  starts sampling.';
                strBack = '''Setup''  reloads the variables and stimulus.';
                strMsg = [cellstr(strState); cellstr(strBlank); cellstr(strNext); cellstr(strBack)];
                set(handles.m_ctrlInstructions, 'String', strMsg);
                
            elseif STATE == STATE_SAMPLING
                % display 'recording complete' message
                strState = 'Trial Complete.';
                strBlank = '';
                strNext = '''REC''  runs another iteration.';
                strBack = '''Setup''  reloads the variables and stimulus.';
                strMsg = [cellstr(strState); cellstr(strBlank); cellstr(strNext); cellstr(strBlank); cellstr(strBack)];
                set(handles.m_ctrlInstructions, 'String', strMsg);
            end
            
        case STATE_SAMPLING
            set(handles.m_ctrlRun, 'enable', 'off');
            set(handles.m_ctrlSetup, 'enable', 'off');
            set(handles.m_ctrlREC, 'enable', 'off');
            set(handles.m_ctrlStop, 'enable', 'on');
            
            strSampling = 'Sampling...';
            strBlank = '';
            strStop = '''STOP'' prematurely halts data acquisition';
            strMsg = [cellstr(strSampling); cellstr(strBlank); cellstr(strStop)];
            set(handles.m_ctrlInstructions, 'String', strMsg);
            
    end
    
    STATE = newState;
%>