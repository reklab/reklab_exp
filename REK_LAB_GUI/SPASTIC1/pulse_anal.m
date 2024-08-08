function pulse_anal

% Pulse analysis
% Written by: Mackenzie Baker, Feb 26 2004
% Edited by: Heidi Giesbrecht, Jan 23 2006
%  (using a combination of files from previous gui)

% Program that will average the pulse trials & compute the reflex torque

% Data must be in *.flb format

% Must be in the directory where the files are saved

addpath('D:\BMED_Tools\sig', ...
    'D:\BMED_Tools\id', ...
    'D:\BMED_Tools\tables', ...
    'D:\BMED_Tools\REKLAB_anal', ...
    'D:\BMED_Tools\EXP_development', ...
    'D:\BMED_Tools\REKLAB_exp',1)

data_ens = [];

% OLD: Each trial must be an *flb file
%num_trials = input_d ( 'Enter the number of trials',10,1,15)
% for i = 1:num_trials
%     file = input_d('Enter the filename [*.flb] in quotes');
%     realization = flbtomat(file);
%     [x c i d n s] = flbtomat(file,realization);
%     data_ens = [data_ens; x];
% end


%%HIG: 01/23/06 Data is stored in one *.flb file
%file = input_d('Enter the filename [*.flb] in quotes');
%ptrial_start = input_d ( 'Enter first pulse trial number',1,1,1000);
%ptrial_end = input_d ( 'Enter last pulse trial number',2,1,1000);
%num_trials = ptrial_end - ptrial_start + 1;
%t_start = input_d ( 'Enter first data point for averaging',1000,1,6000);  %%Make sure only to include ONE pulse sequence
%t_end = input_d ( 'Enter last data point for averaging',3000,1,6000);
%sample_rate = input_d ( 'Enter the sampling rate',1000)
% for i = ptrial_start : ptrial_end
%     [x c i d n s] = flbtomat(file,i);
%     data_ens = [data_ens; x(t_start:t_end,:)]; %%Make sure only to include ONE pulse sequence
% end
%%End *.flb file

%%HIG: 01/23/06 Data is stored in multiple *.mat files
ptrial_start = input_d ( 'Enter first pulse trial number',1,1,1000);
ptrial_end = input_d ( 'Enter last pulse trial number',2,1,1000);
num_trials = ptrial_end - ptrial_start + 1;
sample_rate = input_d ( 'Enter the sampling rate',1000);

for i = ptrial_start : ptrial_end
    filename = ['S:\Biomed\REKLAB\REKLAB_Share\Heidi\Data\020706_HIG\' num2str(i) '_TRIG_HG2_HIGR.mat']; %trials 
%    filename = ['D:\Users\Heidi\Data\013006_BAKE\' num2str(i) '_TRIG_HG2_BAKER.mat'];
%         filename = ['D:\Users\Heidi\Data\030306_CB\' num2str(i) '_TRIG_HG2_CBR.mat'];
  

    load (filename)
    data2 = data(:,1:2);
    data3 = [data2 data(:,9:11)];
    data_ens = [data_ens; data3];
    clear data data2 data3;
 end
%%End *.mat files

x_ens_pos = data_ens;

[xpos_avg, xpos_sd] = exp_pulse_avg (x_ens_pos, num_trials); 

[a,b]=pulse_stats(xpos_avg, xpos_sd,1/sample_rate,1);
% [a,b]=pulse_reflex(xpos_avg, xpos_sd,1/sample_rate,1);

rmpath('D:\BMED_Tools\sig', ...
    'D:\BMED_Tools\id', ...
    'D:\BMED_Tools\tables', ...
    'D:\BMED_Tools\REKLAB_anal', ...
    'D:\BMED_Tools\EXP_development', ...
    'D:\BMED_Tools\REKLAB_exp')

