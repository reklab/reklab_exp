function radioButtonControl_NCNR(task, handles)

global NEW_CASE
global NEW_REALIZATION
global NEW_TRIAL_TYPE
global NEW_SUBJECT
global RADIO_ENABLE
global RADIO_DISABLE

switch task
    case NEW_CASE
        past_case = str2double(get(handles.m_ctrlPrevCase, 'String')); %get previous case number
        set(handles.m_ctrlNextCase, 'String', num2str(past_case+1)); %Increment case number for new case
        set(handles.m_ctrlNextReal, 'String', num2str(1));%Reset realization to 1
        set(handles.m_ctrlComment, 'enable', 'on');%Allow comment to be changed with new case
        
    case NEW_REALIZATION
        %Case number same as previous
        past_case = str2double(get(handles.m_ctrlPrevCase, 'String')); %get previous case number
        set(handles.m_ctrlNextCase, 'String', num2str(past_case)); %Increment case number for new case
        past_real = str2double(get(handles.m_ctrlPrevReal, 'String')); %get previous realization number
        set(handles.m_ctrlNextReal, 'String', num2str(past_real+1));
        set(handles.m_ctrlComment, 'enable', 'off');%Comment cannot be changed with new realization
        
        
    case NEW_TRIAL_TYPE 
        %Set to new case because new trial type selected
        set(handles.radioNewCase, 'Value', 1); 
        past_case = str2double(get(handles.m_ctrlPrevCase, 'String')); %get previous case number
        set(handles.m_ctrlNextCase, 'String', num2str(past_case+1)); %Increment case number for new case
        set(handles.m_ctrlNextReal, 'String', num2str(1));%Reset realization to 1;    
        
        %Disable choice of new case or new real because must be new case
        set(handles.radioNewCase, 'enable', 'off');
        set(handles.radioNewReal, 'enable', 'off');
        set(handles.m_ctrlComment, 'enable', 'on'); %Allow comment to be changed with new case
        
    case NEW_SUBJECT
        %Reset previous and next case/realization numbers
        set(handles.m_ctrlNextCase, 'String', num2str(1));
        set(handles.m_ctrlPrevCase, 'String', num2str(0));
        set(handles.m_ctrlNextReal, 'String', num2str(1));
        set(handles.m_ctrlPrevReal, 'String', num2str(0));
        
        set(handles.radioNewCase, 'Value', 1); %Reset radio button to NewCase because starting new flb
        %Deactivate choice of radio button
        set(handles.radioNewCase, 'enable', 'off');
        set(handles.radioNewReal, 'enable', 'off');
        set(handles.m_ctrlComment, 'enable', 'on');%Allow comment to be changed with new case
        
    case RADIO_ENABLE
        set(handles.radioNewCase, 'enable', 'on');
        set(handles.radioNewReal, 'enable', 'on');
        
    case RADIO_DISABLE
        set(handles.radioNewCase, 'enable', 'off');
        set(handles.radioNewReal, 'enable', 'off');
        
end
