close all; clear all; clc;

%load the data
counter = 25;
j=1;     
m=1;
All_feature = [];
while  m <= 16; %%sheet each 25m
    

while j<=16; %% 
AllData = xlsread('S1_51.xlsx',m); 
 m = m+1;
%n = AllData(:,9);

[n m1] = size(AllData); 
disc_data = AllData; 
fs=50;
t = [0:n-1]/fs;

% t = [0:n-2]/fs;

x_acc =[];
y_acc=[];
z_acc=[];
x_AV=[];
y_AV=[];
z_AV=[];
x_Angle=[];
y_Angle=[];
z_Angle=[];

    
   x_acc = disc_data(:,1);
   y_acc = disc_data(:,2);
   z_acc = disc_data(:,3);
   x_AV = disc_data(:,4);
   y_AV = disc_data(:,5);
   z_AV = disc_data(:,6);
   x_Angle = disc_data(:,7);
   y_Angle = disc_data(:,8);
   z_Angle = disc_data(:,9);
 


% Filter design
[b,a] = butter(4,25/(50),'low');

%Filter Acc
filter_xacc=filtfilt(b,a,x_acc);
filter_yacc=filtfilt(b,a,y_acc);
filter_zacc=filtfilt(b,a,z_acc);

%Filter Angular Velocity
filter_AVx=filtfilt(b,a,x_AV);
filter_AVy=filtfilt(b,a,y_AV);
filter_AVz=filtfilt(b,a,z_AV);

%Filter Angle
filter_Angx=filtfilt(b,a,x_Angle);
filter_Angy=filtfilt(b,a,y_Angle);
filter_Angz=filtfilt(b,a,z_Angle);

 %RMS-----------------------------------------------------------------
%  rms0=0;
 %0-25m
%rms1-x,y,z
    
rmsaccx =[];
rmsaccy =[];
rmsaccz =[];

 
   rmsaccx = (filter_xacc).^2;
   rmsaccy = (filter_yacc).^2;
   rmsaccz = (filter_zacc).^2;
  
   totalaccx = sum(rmsaccx(:,1));
   totalaccy = sum(rmsaccy(:,1));
   totalaccz = sum(rmsaccz(:,1));
   

X = sqrt((sqrt(totalaccx))^2+ (sqrt(totalaccy))^2+ (sqrt(totalaccz))^2);

%  j = j+1;
%     fprintf('Finished iteration #%dm and RMS(%dm) = %f\n',...
%             counter, counter, X(counter));
%     counter = counter + 25;
    
%meanRMS----------------------------------------------   
 
Mean_RMSX=mean(rmsaccx);
Mean_RMSY=mean(rmsaccy);
Mean_RMSZ=mean(rmsaccz);
% Meam_RMStotal = mean(X);

%%
%Meanacc 123 -------------------------------------------------
Mean_AccX=mean(filter_xacc);
Mean_AccY=mean(filter_yacc);
Mean_AccZ=mean(filter_zacc);
%MeanAngularVelocity 456--------------------------------------------
Mean_avX=mean(filter_AVx);
Mean_avY=mean(filter_AVy);
Mean_avZ=mean(filter_AVz);
%MeanAngle 789--------------------------------------------------------
Mean_angX=mean(filter_Angx);
Mean_angY=mean(filter_Angy);
Mean_angZ=mean(filter_Angz);


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


PL = sqrt((x)+(y)+(z));
%PLnorm = PL - mean(PL);
PL2=detrend(PL.');

% % % % % hold on
% % % % %  grid on
% % % % %  %plot(t,PL2)
% % % % %  xlabel('Time (s)');
% % % % % ylabel(' Player Load');
% % % % % xnorm = filter_xacc - mean(filter_xacc)+0.69+4.34;
% % % % % xnorm2=xnorm.';
% % % % % plot(t,xnorm2)

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


% % % % % figure
% % % % % hist(peakInterval_x)
% % % % % grid on
% % % % % xlabel('Second Intervals')
% % % % % ylabel('Frequency of Occurrence')
% % % % % title('Histogram of Peak Intervals (Seconds)')
% % % % % AverageDistance_Peaks = mean(diff(locs));

All_feature = [All_feature; Mean_AccX Mean_AccY Mean_AccZ Mean_angX Mean_angY Mean_angZ Mean_avX Mean_avY Mean_avZ Mean_PL Mean_PPAX Mean_PPAY Mean_PPAZ Mean_StepX Mean_StepY Mean_StepZ Mean_RMSX Mean_RMSY Mean_RMSZ X];

j = j+1;
end
end
% xlswrite('features_S1_51.xlsx',All_feature);

% RMS=[rms0,rms25,rms50,rms75,rms100,rms125,rms150,rms175,rms200,rms225,rms275,rms300,rms325,rms350,rms375,rms400];
% dis=[0,25,50,75,100,125,150,175,200,225,275,300,325,350,375,400];
% 
% figure
% hold on
% grid on
% plot (dis,RMS,'-bo','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2)
% title('RMS value (First subject)');
% xlabel('Distances (m)');
% ylabel(' value of RMS');
