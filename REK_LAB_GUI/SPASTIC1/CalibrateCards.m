function CalibrateCardsCancel = CalibrateCards
% Card calibration routine. NI_Dev_list is a cell array of strings defining the
% devices to be calibrated. Calibration results are logged in a file.
% CalibrateCardsCancel returns logical true if user cancels calibration,
% otherwise returns logical false.

disp('DAQ card calibration should be peformed daily. This will take several minutes.')
disp('You may abort calibration by hitting <Ctrl> C. Control will return to')
disp('the MATLAB Command Window after calibration is done for the card being processed.')
disp(' ')

NI_Dev_list = DeviceList;

try
  load D:\bmed_tools\REKLAB_exp\CalibrationLog.mat
catch
  disp('Cannot find calibration log file. A new file will be created.')
end

if ~exist('calLog')
  % Calibration log variable not found. Setting up column header of new variable.
 calLog = {'Calibration Date', 'Overall Status', 'Card 1 Return Code', 'Card 2 Return Code', 'Card 3 Return Code', 'Card 4 Return Code', 'Card 1 S/N', 'Card 2 S/N', 'Card 3 S/N', 'Card 4 S/N'};
end

CalibrateCardsCancel = false;
doCalibration = false;

logIndex = size(calLog, 1);  % Number of row entries currently in log

if ~strcmp(calLog{logIndex,1},date)
  disp('Calibration not performed today.')
  doCalibration = true;
elseif  strcmp(calLog{logIndex,2},'Fail')
  button = questdlg('Today''s previous calibration failed, do you want to calibrate again?');
  switch button
    case 'Yes'
      doCalibration = true;
    case 'No'
      disp('Skipping calibration.')
      doCalibration = false;
    case 'Cancel'
      disp('Cancelling calibration.')
      doCalibration = false;
      CalibrateCardsCancel = true;
  end
end

if doCalibration
  % For each card get serial number, run calibration, and log results.

  CalibrationDone = false;
  while ~CalibrationDone
    % Until all calibrations successful or user cancels...

    for i = 1 : length(NI_Dev_list)
      DevNumStr = NI_Dev_list{i};
      disp(['Calibrating NI-4472 device: ' DevNumStr])
      drawnow
      RC(i) = selfcal_ni4472(DevNumStr);
      if RC(i) < 0
        disp(['Error: Calibration failed. Return code: ' num2str(RC(i))])
      elseif RC(i) > 0
        disp(['Warning: Calibration has ended with odd result. Return code: ' num2str(RC(i))])
      end
      SN(i) = getSerialNum_ni4472(DevNumStr);
    end

    % Store results of calibration
    logIndex = logIndex + 1;
    calLog{logIndex,1} = date;

    % If all return codes (RC) 0 then calibration passed
    if any(RC)
      status = 'Fail';
    else
      status = 'Pass';
    end

    calLog{logIndex,2} = status;
    for i = 1 : length(NI_Dev_list)
      calLog{logIndex,i+2} = RC(i);
      calLog{logIndex,i+6} = dec2hex(SN(i));
    end

    switch status
      case 'Pass'
        disp('Calibration OK.')
        CalibrationDone = true;
      case 'Fail'
        button = questdlg('Calibration failed, try again?');
        switch button
          case 'Yes'
            % Calibrate again
          case 'No'
            disp('Continuing with failed calibration.')
            CalibrationDone = true;
          case 'Cancel'
            disp('Cancelling failed calibration.')
            CalibrationDone = true;
            CalibrateCardsCancel = true;
        end
    end
  end
end

disp('Calibration results being saved to log file: CalibrationLog.mat')
save D:\bmed_tools\REKLAB_exp\CalibrationLog.mat calLog
disp('');