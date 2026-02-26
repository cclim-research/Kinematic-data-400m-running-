close all; clear all; clc;

%load the data------------------------
% m=1;
% while  m <= 3
AllData = xlsread('S1_51.xlsx',1)
%AllData = xlsread('S1_51.xlsx',m); 
 %m = m+1

 [n m1] = size(AllData);
 %for n = 1:3
disc_data = AllData(:,1:9);
fs=50;
t = [0:n-1]/fs;
%%%%%%%%
All_feature=[];
results=[];
x_acc =[];
y_acc=[];
z_acc=[];
x_AV=[];
y_AV=[];
z_AV=[];
x_Angle=[];
y_Angle=[];
z_Angle=[];

for i= 1:n
    
   x_acc(i,1) = disc_data(i,1);
   y_acc(i,1) = disc_data(i,2);
   z_acc(i,1) = disc_data(i,3);
   x_AV(i,1) = disc_data(i,4);
   y_AV(i,1) = disc_data(i,5);
   z_AV(i,1) = disc_data(i,6);
   x_Angle(i,1) = disc_data(i,7);
   y_Angle(i,1) = disc_data(i,8);
   z_Angle(i,1) = disc_data(i,9);
   i+1;
   
end



%Filter Acc--------------------------------------------
[b,a] = butter(4,25/(50),'low');
filter_xacc=filtfilt(b,a,x_acc);

[b,a] = butter(4,25/(50),'low');
filter_yacc=filtfilt(b,a,y_acc);

[b,a] = butter(4,25/(50),'low');
filter_zacc=filtfilt(b,a,z_acc);

%Filter Angular Velocity
[b,a] = butter(4,20/(50),'low');
filter_AVx=filtfilt(b,a,x_AV);

[b,a] = butter(4,20/(50),'low');
filter_AVy=filtfilt(b,a,y_AV);

[b,a] = butter(4,20/(50),'low');
filter_AVz=filtfilt(b,a,z_AV);

%Filter Angle
[b,a] = butter(4,20/(50),'low');
filter_Angx=filtfilt(b,a,x_Angle);

[b,a] = butter(4,20/(50),'low');
filter_Angy=filtfilt(b,a,y_Angle);

[b,a] = butter(4,20/(50),'low');
filter_Angz=filtfilt(b,a,z_Angle);

%Meanacc 123 -------------------------------------------------
Mean_AccX=mean(filter_xacc)
Mean_AccY=mean(filter_yacc)
Mean_AccZ=mean(filter_zacc)
%MeanAngularVelocity 456--------------------------------------------
Mean_avX=mean(filter_AVx)
Mean_avY=mean(filter_AVy)
Mean_avZ=mean(filter_AVz)
%MeanAngle 789--------------------------------------------------------
Mean_angX=mean(filter_Angx)
Mean_angY=mean(filter_Angy)
Mean_angZ=mean(filter_Angz)


%Player Load 10---------------------------------------------------------------- 

    x = [];
    y = [];
    z = [];
    
for i = 1:n-1
x(i,1) = (filter_xacc(i+1,1)-filter_xacc(i,1))^2;    
i+1;
end



for i = 1:n-1
y(i,1) = (filter_yacc(i+1,1)-filter_yacc(i,1))^2;
i+1;
end


for i = 1:n-1
z(i,1) = (filter_zacc(i+1,1)-filter_zacc(i,1))^2;
i+1;
end


PL = sqrt((x)+(y)+(z))
%PLnorm = PL - mean(PL);
PL2=detrend(PL.');

hold on
 grid on
 %plot(t,PL2)
 xlabel('Time (s)');
ylabel(' Player Load');
xnorm = filter_xacc - mean(filter_xacc)+0.69+4.34;
xnorm2=xnorm.';
plot(t,xnorm2)

Mean_PL=mean(PL2);


%PPA n Step regularities X 11 12 13 14 15 16-----------------------------------------------------
time = [0:n-1]/fs;
xpeak = detrend(filter_xacc,1);
[pks, locs] = findpeaks(xpeak,time,'MinPeakHeight',2);
% [pks, locs] = findpeaks(xpeak,time,'MinPeakProminence',1);
peakInterval_x = diff(locs);
PPAX=pks;
Mean_StepX=mean(peakInterval_x);

Mean_PPAX=mean(PPAX);

%PPA Y---
ypeak = detrend(filter_yacc,1);
[pks, locs] = findpeaks(ypeak,time,'MinPeakHeight',2);
% [pks, locs] = findpeaks(xpeak,time,'MinPeakProminence',1);
peakInterval_y = diff(locs);
PPAY=pks;
Mean_StepY=mean(peakInterval_y);

Mean_PPAY=mean(PPAY);

%PPA Z---
zpeak = detrend(filter_zacc,1);
[pks, locs] = findpeaks(xpeak,time,'MinPeakHeight',2);
%[pks, locs] = findpeaks(xpeak,time,'MinPeakProminence',1);
peakInterval_z = diff(locs);
PPAZ=pks;
Mean_StepZ=mean(peakInterval_z);

Mean_PPAZ=mean(PPAZ);
%Magnitude = diff(pks);
%dist = diff(locs(2)) - diff(locs(1)); %or whichever two peaks you want to know about

% RMS ----------------------------

figure
hist(peakInterval_x)
grid on
xlabel('Second Intervals')
ylabel('Frequency of Occurrence')
title('Histogram of Peak Intervals (Seconds)')
AverageDistance_Peaks = mean(diff(locs));

All_feature = [All_feature; Mean_AccX, Mean_AccY, Mean_AccZ, Mean_angX, Mean_angY, Mean_angZ, Mean_avX, Mean_avY, Mean_avZ, Mean_PL, Mean_PPAX, Mean_PPAY, Mean_PPAZ, Mean_StepX, Mean_StepY, Mean_StepZ ];
 
%results = [results; m All_feature];
%  end
%  end
%%%%%%
% figure
% hist(Magnitude)
% Averagemg_Peaks = mean(diff(pks));


%Step regularities (autocorr)---------------------------------

% %figure
% %plot (afiqfilter_z)
% znorm = filter_zacc - mean(filter_zacc)+0.69;
% znorm2=(znorm.');
% %mean znorm
% figure
% 
% plot (znorm2)
% shg
% time = [0:n-1]/fs;
% figure
% plot (time,znorm2); xlabel 'Time (second)'; ylabel 'Vertical axis';
% [autocor,lags] = xcorr(znorm2, 1*5*fs, 'coeff');
% plot(lags/fs, autocor);
% 
