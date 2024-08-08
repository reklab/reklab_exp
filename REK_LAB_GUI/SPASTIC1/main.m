% Trial States
% global TRIAL_STATE_IDLE
% global TRIAL_STATE_CONNECTION
% global TRIAL_STATE_BUILDING_COMPLETE
% global TRIAL_STATE_STARTED
% global TRIAL_STATE_LOADED;
% global TRIAL_STATE_READY;
% global TRIAL_STATE_COMPLETED;
global STATE_IDLE
global STATE_MODEL_LOADED
global STATE_READY
global STATE_SAMPLING
global STATE %Hold the current state

%BUTTONS
global LOAD_MODEL
global SETUP
global RECORD
global STOP

%STATE OF RADIO BUTTONS
global NEW_CASE
global NEW_REALIZATION
global NEW_TRIAL_TYPE
global NEW_SUBJECT
global RADIO_ENABLE
global RADIO_DISABLE

%Conversion factors
global CONVERTING_VOLTS_2_TORQUE;
global CONVERTING_VOLTS_2_RADS;
global SCALING_FACTOR;
global SAMPLING_FREQUENCY;

%%MB%% ramp constants that are used with MB4_tools GUI
global RAMP_TQ_TRIGGER;
global dRampPosition;
global dRampPosition1;
global dRampAmp;
global Count MaxCount pass_tq_start; %pass_tq_end

global data;

%%DL%% Preferences File for CUI_VIEW
global PreferencesFile

% Conversion constants
CONVERTING_VOLTS_2_TORQUE = 20; %N*m/V 
CONVERTING_VOLTS_2_RADS = 0.1; %rads/V
SCALING_FACTOR = 1; % acquisition card scales by 0.5 
SAMPLING_FREQUENCY = 1000; % Default sampling frequency in Hz

% Actuator constants
global SINGLE_ACTUATOR;
global DOUBLE_ACTUATOR;

% xPC variables
global VERBOSE_LEVEL TG XPC_TRIG_ACTIVE_ XPC_TRIG_INACTIVE_ XPC_CMD_ABORT_;

% stop indicator
global STOP_ACQUISITION;

% length of stimulus
global AccumDepth;

% initialization flag
global INITIALIZE_DEVICE;

% Flag used to say that first time set up values - used in
% Initialize_GUIValues function
global FIRST

FIRST = 1;


% TRIAL_STATE_IDLE = 0;
% TRIAL_STATE_CONNECTION = 1;
% TRIAL_STATE_BUILDING = 2;
% TRIAL_STATE_BUILDING_COMPLETE = 3;
% TRIAL_STATE_STARTED = 4;
% TRIAL_STATE_LOADED = 5;
% TRIAL_STATE_READY = 6;
% TRIAL_STATE_COMPLETED = 7;
STATE_IDLE = 0;
STATE_MODEL_LOADED = 1;
STATE_READY = 2;
STATE_SAMPLING = 3;


LOAD_MODEL = 1;
SETUP = 2;
RECORD = 3;
STOP = 4;

NEW_CASE = 1;
NEW_REALIZATION = 2;
NEW_TRIAL_TYPE = 3;
NEW_SUBJECT = 4;
RADIO_ENABLE = 5;
RADIO_DISABLE = 6;

SINGLE_ACTUATOR = 1;
DOUBLE_ACTUATOR = 2;

STOP_ACQUISITION = 0;

RAMP_TQ_TRIGGER = 0;
dRampPosition = 0;
dRampPosition1 = 0;
dRampAmp = 0;
Count = 1;
MaxCount = 0;
pass_tq_start = 0;
pass_tq_end = 0;


INITIALIZE_DEVICE = 1;

%DL Start Preferences Manager
[H, PreferencesFile, NiNoFlag] = CUID_PreferencesManager;

% DL Added pause to allow Preferences Manager window to close
%pause(1)
drawnow  % RW - pause can be turned off at the MATLAB prompt

% DL Check for NiNoCal
if strcmp(NiNoFlag, 'Yes')
    NiNoCal = 1;
end

% DL & RW added self-calibration of the cards.
% DL & RW added calibration bypass flag
% RW changed calibration call from selfcal_ni4472 to MATLAB-based method.
%    (See discussion group postings on National Instuments we site
%    (www.ni.com.) Search for "Use M-Series cards with DAQmx in Matlab!")
% RW reverted to using selfcal_ni4472. MATLAB-based method stopped working
%    after upgrade.
% RW changed how self-calibration is performed. (Implemented as for loop.)


%%%%%%%%%%%%%%%%%%% DL Feb 2, 2009 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Changed implementation of calibration. The GUI will check last time the
% calibration was run, and if no calibration was performed on that day then
% calibration will be performed. A log of all calibrations will be kept in
% *.mat. If calibration fails user will be prompted to continue or abort.
% If previous calibration failed on the same day then user will be prompted
% to recalibrate the cards or skip.
%
% DL & RW put calibration code into its own function.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CalibrateCardsCancel = false;
if exist('NiNoCal')
  disp('Card calibration being bypassed by user request.')
else
  CalibrateCardsCancel = CalibrateCards;
end

% load GUI
if CalibrateCardsCancel
    return
end

% Clear variable which are no longer needed
clear NiNoFlag H CalibrateCardsCancel

disp('running GUI')
CUI_View;