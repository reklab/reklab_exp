function [mvc_tq_d,mvc_tq_p] = mvc_mean(data,samp_rate)
% MVC analysis
% Created by: Mackenzie Baker, Feb 26 2004

% Calculation of mean MVC from plot of torque
%--- User selects start and end of data to be considered from plot of
%torque

% Input: 
%   data - data output matrix from the prior MVC trial
%   samp_rate - sampling rate
% Output:
%   mvc_tq_d - mean torque during dorsiflexion
%   mvc_tq_p - mean torque during plantarflexion

t_end = length(data)/samp_rate;
t = [0:1/samp_rate:t_end-1/samp_rate];

disp('Using the mouse, select a segment of data (approx. 1 second) during dorsiflexion (+ve) that is relatively flat')
% select suitable piece of data manually - first plot torque data
figure; plot(t,data(:,2)); %torque is column 2

% select data segment - beginning and end with cross-hairs and mouse
% click
[x y]=ginput(2);
data_start=round(min(x));
data_end=round(max(x));
data_d=data((data_start*samp_rate):(data_end*samp_rate),2);

mvc_tq_d = mean(data_d)

disp('Now select a segment of data (approx. 1 second) during plantarflexion (-ve) that is relatively flat')
% select suitable piece of data manually - first plot torque data
figure; plot(t,data(:,2)); %torque is column 2
%TO DO: want to plot it against time ... is the time stored in file?

% select data segment - beginning and end with cross-hairs and mouse
% click
[x y]=ginput(2);
data_start=round(min(x));
data_end=round(max(x));
data_p=data((data_start*samp_rate):(data_end*samp_rate),2);

mvc_tq_p = mean(data_p)