%%
%-- I copied this file from this location: Q:\myPhD\myThesis\REK Lab Experiments\KJ_180913 into this directory on June 26th and modified it for my use.
%% This function generates a random signal that conforms to both "a desired spectral density - PSD" and "a desired probability density - PDF".
%++ So, we can set both the frequency characteristics and amplitude characteristics of a signal to an arbitarily desired shape  
% function x = randSigGenerator(N,Ts,pdf,psdType,psdParam)
%-- Inputs:
%           N: is the number of samples from the signal
%           Ts: is the sampling time (in seconds)
%           pdf: Desired vector of probability distribution function (unitless)
%           psdType: Desired type (or format) of power spectral density (volt^2/Hz). It can be one of the following: {'lowPass','bandPass','highPass','Vector'}
%           psdParam: Parameters of the desired psdType. The possible values according to pdfType are: {BW,[lowBW,upBW],BW,psdVec}
clc
close all
clear all

N = 120000; %110000; %120000;
Ts = 0.001;
psdType = 'lowPass';
psdParam = 20.0;        %-- in Hz

initialDist = 'Uniform'; % 'Normal'

caseNo = 5; %1,2,3,4

saveFlag = 0; %1;

Td = (N-1)*Ts;
time = (0:Ts:Td)';
xn.time = time;

switch initialDist
    case 'Uniform'
        xMin = -1;
        xMax = 1;
        xn.signals.values = xMin + (xMax - xMin)*rand(N,1);
    case 'Normal'
        xnMean = 0;
        xnSTD = 1;
        xn.signals.values = xnMean + xnSTD * randn(N,1);
end

switch psdType
    case 'lowPass'      
        filtOrder = 12;
        filtBW = 2*pi*psdParam; %-- rad/s
        sim('dataFiltering.mdl')  %-- The output of the model is a variable called xd
    otherwise
        disp('This option has not yet been implemented!')
        return;
end

xnNLDAT = nldat(xn.signals.values,'domainIncr',Ts);
xdNLDAT = nldat(xd,'domainIncr',Ts);

%-- Frequency spectrum of the signals
nfft = 5000; %2000;
xnSpect = spect((xnNLDAT)-mean(xnNLDAT),'nfft',nfft);
xdSpect = spect((xdNLDAT)-mean(xdNLDAT),'nfft',nfft);

%-- PDF of the dignals
noBins = 400;
xnPDF = pdf(xnNLDAT,'Nbins',noBins);
xdPDF = pdf(xdNLDAT,'Nbins',noBins);

figure;
subplot(2,3,1)
plot(xnSpect);
subplot(2,3,4)
plot(xdSpect);

subplot(2,3,2)
plot(xnNLDAT);
subplot(2,3,5)
plot(xdNLDAT);

subplot(2,3,3)
plot(xnPDF);
subplot(2,3,6)
plot(xdPDF);

%% xr is a realization of a signal with desired PDF
%++ Values used in September 2013
% maxPDF = 0.1;
% minPDF = -0.33;

%++ Values used for generating large signal trajectory on Feb. 28, 2014
maxPDF = 0.2;
minPDF = -0.4;

%% Uniform distribution
% xr = minPDF + (maxPDF-minPDF)*rand(N,1); pdfDist = 'uniform';

%% Sum of two Gaussians
%++ Used in September 2013
% pdfDist = 'SumGaussians';
% m1 = -0.2; std1 = 0.0335;
% m2 = 0.05; std2 = 0.0130;
% xr1 = m1 + std1*randn(N,1); 
% xr2 = m2 + std2*randn(N,1);
% xr = zeros(N,1);
% 
% for k = 1:N
%     if rand>0.5
%         xr(k) = xr1(k);
%     else
%         xr(k) = xr2(k);
%     end
% end

%% Arbitarary distribution
%++ Used in September 2013
% pdfDist = 'arbitrary';
% nBins = 400;
% deltaPDF = (maxPDF - minPDF)/nBins;
% pdfBins = minPDF:deltaPDF:maxPDF;
% nPerBin = zeros(nBins,1);
% %-- it is a piecewise constant distribution concentrated on areas where the difference between second-order model and lower order ones is maximized.
% b = 1/(0.205+1.125); %-- The distribution value is equal to b in the range [-0.33,-0.25] and [-0.1,0.025]
% a = 5*b;             %-- The distribution value is equal to a in the range [-0.25,-0.1] and [0.025,0.1]
% 
% xrd = zeros(N,1);
% 
% i1 = 1;
% for i = 1:nBins
%     if pdfBins(i)<-0.25
%         h1 = b;
%     elseif pdfBins(i)<-0.1
%         h1 = a;
%     elseif pdfBins(i)<0.025
%         h1 = b;
%     else
%         h1 = a;
%     end
%     
%     if pdfBins(i+1)<-0.25
%         h2 = b;
%     elseif pdfBins(i+1)<-0.1
%         h2 = a;
%     elseif pdfBins(i+1)<0.025
%         h2 = b;
%     else
%         h2 = a;
%     end
%     
%     %-- Trapezoidal rule
%     Area = 0.5*(h1+h2)*deltaPDF;
%     
%     nPerBin(i) = fix(Area*N);
%     i2 = i1 + nPerBin(i) - 1;    
%     xrd(i1:i2) = pdfBins(i) + (pdfBins(i+1)-pdfBins(i))*rand(nPerBin(i),1);
%     i1 = i2 + 1;
% end
% 
% xrd(i2+1:end) = minPDF + (maxPDF-minPDF)*rand(N-i2,1);
% 
% %-- Randomizing the realization sequence with the desired PDF
% randInd = randperm(N);
% xr = zeros(N,1);
% for j = 1:N
%     xr(j) = xrd(randInd(j));
% end

%% Arbitarary distribution 
% %++ Used on Feb. 28, 2014
% pdfDist = 'arbitrary';
% nBins = 400;
% deltaPDF = (maxPDF - minPDF)/nBins;
% pdfBins = minPDF:deltaPDF:maxPDF;
% nPerBin = zeros(nBins,1);
% 
% %-- it is a piecewise constant distribution concentrated on areas where the difference between second-order model and lower order ones is maximized.
% b = 1/0.9; %-- The distribution value is equal to b in the range [-0.33,-0.25] and [-0.1,0.025]
% a = 3*b;             %-- The distribution value is equal to a in the range [-0.25,-0.1] and [0.025,0.1]
% 
% xrd = zeros(N,1);
% 
% i1 = 1;
% for i = 1:nBins
%     if pdfBins(i)<0.05
%         h1 = b;
%     else 
%         h1 = a;
%     end
%     
%     if pdfBins(i+1)<0.05
%         h2 = b;
%     else 
%         h2 = a;
%     end
%     
%     %-- Trapezoidal rule
%     Area = 0.5*(h1+h2)*deltaPDF;
%     
%     nPerBin(i) = fix(Area*N);
%     i2 = i1 + nPerBin(i) - 1;    
%     xrd(i1:i2) = pdfBins(i) + (pdfBins(i+1)-pdfBins(i))*rand(nPerBin(i),1);
%     i1 = i2 + 1;
% end
% 
% xrd(i2+1:end) = minPDF + (maxPDF-minPDF)*rand(N-i2,1);
% 
% %-- Randomizing the realization sequence with the desired PDF
% randInd = randperm(N);
% xr = zeros(N,1);
% for j = 1:N
%     xr(j) = xrd(randInd(j));
% end

%% Uniform Distribution
%++ Used on Feb. 28, 2014
xr = 2*rand(N,1)-1;


%% sorting the signal with the desired PDF
[xo,indxo] = sort(xr); 

xrNLDAT = nldat(xr,'domainIncr',Ts);

%-- Frequency spectrum of the signals
xrSpect = spect((xrNLDAT)-mean(xrNLDAT),'nfft',nfft);

%-- PDF of the dignals
xrPDF = pdf(xrNLDAT,'Nbins',noBins);

%% Running the algorithm (Nichols et al., Probabilistic Engineering Mechanics 25 (2010) 315-322
loop = 1;
indxp = zeros(N,1);

x = xd;
[zx,indx] = sort(x);

x(indx) = xo; % xr(indxo);
% while loop
%     [zx,indx] = sort(x);
%     x(indx) = xo;
%     if sum(indx == indxp) == N
%         loop = 0;
%     end
%     indxp = indx;
% end

% x(indx) = xo;

xNLDAT = nldat(x,'domainIncr',Ts);

%-- Frequency spectrum of the signals
xSpect = spect((xNLDAT)-mean(xNLDAT),'nfft',nfft);

%-- PDF of the dignals
xPDF = pdf(xNLDAT,'Nbins',noBins);

figure;
subplot(2,3,1)
plot(xdSpect);
subplot(2,3,4)
plot(xdPDF);

subplot(2,3,2)
plot(xrSpect);
subplot(2,3,5)
plot(xrPDF);

subplot(2,3,3)
plot(xSpect);
subplot(2,3,6)
plot(xPDF);

figure;
subplot(3,1,1)
plot(time,x); xlabel('Time (s)'); ylabel('Position (rad)')
subplot(3,1,2)
plot(xSpect); xlabel('Frequency (Hz)'); ylabel('PSD (rad^2/Hz)')
subplot(3,1,3); 
plot(xPDF); xlabel('Position (rad)'); ylabel('PDF')

if saveFlag
    save(['schedVar_',initialDist,'_',num2str(psdParam),'Hz','_caseNo',num2str(caseNo),'.mat'],'time','x','xNLDAT','xPDF','xSpect');
end




%% defining as input to the simulink model
tt=0:.001:(120-.001);

uniforminput.time=tt';
uniforminput.signals.values=4*x/100;
uniforminput.signals.dimensions=1;