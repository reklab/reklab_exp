%RW's way of doing stuff

 function nVal = GetActuatorMode
 
 global TG;
 global SINGLE_ACTUATOR;
 global DOUBLE_ACTUATOR;
 
 dAct = getparam(TG, getparamid(TG, 'NumActuators', 'Value'));
 switch dAct
     case 1
         nVal = SINGLE_ACTUATOR;
     case 2
         nVal = DOUBLE_ACTUATOR;
     otherwise
         nVal = [];
         error('Define NumActuators in model as 1 or 2.')
 end
     
    


% PB's way of doing actuator lookup

% function nVal = GetActuatorMode( Preferences )
% %<
%     nVal = Preferences.m_nActuatorMode;
% %>

