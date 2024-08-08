% function [channel_number] =  GetChannelName(name)

channel_number = [];

fid = fopen('card_channel_def.txt','r');
M = textscan(fid, '%s', 'commentStyle', '!');
M1 = M{1};
m = [];
for i =1:length(M1)
    m = [m M1{i} ';'];
end
eval(m);
% for i =1:length(C)
%     if strcmp(name,C{i})
%         channel_number = i;
%     end
% end
