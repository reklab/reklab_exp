function  TriggerCards (objDevice)
% $Revision: 1.2 $
%TRIGGERCARDS Tiriggers NI-4472 DAQ cards
%   Sends repeated triggers to DAQ until all cards start data logging
%   (i.e., cards are triggered).  
%   If this command executes it's guaranteed that ALL the cards have been
%   triggered (SV, April 13, 2007)
% SV- Changes made to ensure all cards trigger at the same time (June
% 26,07)...still working on it...put in the siesta on line 19.
% if siesta is put before the while loop the logging statement doesnt pick
% up card1...right away...but they all seem to sample at the same
% time??????
% Did not implement any changes...sampling seems to be simultaneous(July
% 6th,2007-SV).


global TG;

nCards = length(objDevice);

setparam(TG,getparamid(TG,'Sample_Trigger','Value'),0);
% clock  
while 1
    % Trigger Cards
    setparam(TG,getparamid(TG,'Sample_Trigger','Value'),1);
    siesta(5e-3);
    setparam(TG,getparamid(TG,'Sample_Trigger','Value'),0);

    flag = 0;
    for i = 1:nCards
        
        

        
        flag =  flag || strcmp(get(objDevice(i),'logging'), 'Off');
end


    if flag == 0 
        break;
    end 
end

