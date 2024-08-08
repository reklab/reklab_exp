function ControlTogglePerturbations(state)
% This function enables/disables perturbation "Stim 1" in the
% base model.

global XPC_TRIG_ACTIVE_;
global XPC_TRIG_INACTIVE_;
global XPC_CMD_ABORT_;
global TG;

if ( state == XPC_TRIG_ACTIVE_ )
    setparam(TG,getparamid(TG,'Trigger 1','Value'),XPC_TRIG_ACTIVE_);
else
    setparam(TG,getparamid(TG,'Trigger 1','Value'),XPC_TRIG_INACTIVE_);
    setparam(TG,getparamid(TG,'Command 1','Value'),XPC_CMD_ABORT_);
    %setparam(TG,getparamid(TG,'Command 2','Value'),XPC_CMD_ABORT_);
end