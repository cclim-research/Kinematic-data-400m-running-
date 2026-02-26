% 
clear all, clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%Loading Data%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Please choose which muscle to be used? On 27072017, m=1 is RF, m=2 is GM,m=3 is BF. 
%Other dates, m=1 is ACC1,m=2 is ACC2,m=3 is ACC3,m=4 is RF,m=5 is BF, m=6 is GM.
for m = 2:2  
    %num = load([num2str(m),'.mat']);
    %filename = 'allmuscles.ascii';
  %filename = 'allmuscles.asc' ;
 M=dlmread('hur_ah_2018-11-17_19-19-48_Segment_0.asc','\t',1);
 % M= dlmread(filename,' ',:,0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%SETTING_OF_RUNNING_TIME%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Insert Running Time
run1 = 7; %12.52 for BF to avoid peak RMS if we take run1=12.55 
run2 = 13; %26.24 for BF to avoid peak when run at run2=26.32 
run3 = 20;
run4 = 27;	%56.0 for BF
run5 = 34; %12.52 for BF to avoid peak RMS if we take run1=12.55 
run6 = 41; %26.24 for BF to avoid peak when run at run2=26.32 
run7 = 47;
run8 = 55;	%56.0 for BF
run9 = 61; %12.52 for BF to avoid peak RMS if we take run1=12.55 
run10 = 68; %26.24 for BF to avoid peak when run at run2=26.32 
run11 = 75;
run12 = 82;	%56.0 for BF
run13 = 88; %12.52 for BF to avoid peak RMS if we takerun1=12.55
run14 = 94; %26.24 for BF to avoid peak when run at run2=26.32 
run15 = 101;
run16 = 107;


%Decide the Start Time
StartTime=11;
Start=StartTime*1000;

%Calculating the Lap Time
Lap1=run1*1000;
Lap2=(run2-run1)*1000;
Lap3=(run3-run2)*1000;
Lap4=(run4-run3)*1000;
Lap5=(run5-run4)*1000;
Lap6=(run6-run5)*1000;
Lap7=(run7-run6)*1000;
Lap8=(run8-run7)*1000;
Lap9=(run9-run8)*1000;
Lap10=(run10-run9)*1000;
Lap11=(run11-run10)*1000;
Lap12=(run12-run11)*1000;
Lap13=(run13-run12)*1000;
Lap14=(run14-run13)*1000;
Lap15=(run15-run14)*1000;
Lap16=(run16-run15)*1000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%RAWDATA_SEGMENTATION%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RawData = M(Start:(Start+Lap1),m);
%1st 25 meter in 100 m running
% RawData = M((Start+Lap1):(Start+Lap1+Lap2),m);
%2nd 25 meter in 100 m running
% RawData = M((Start+Lap1+Lap2+1):(Start+Lap1+Lap2+Lap3),m);
%3rd 25 meter in 100 m running
% RawData = M((Start+Lap1+Lap2+Lap3+1):(Start+Lap1+Lap2+Lap3+Lap4),m);
%4th 25 meter in 100 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5),m);
%1st 25 meter in 200 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6),m);
%2nd 25 meter in 200 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7),m);
%3rd 25 meter in 200 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8),m);
%4th 25 meter in 200 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9),m);
%1st 25 meter in 300 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10),m);
%2nd 25 meter in 300 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11),m);
%3rd 25 meter in 300 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12),m);
%4th 25 meter in 300 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+Lap13),m);
%1st 25 meter in 400 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+Lap13+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+Lap13+Lap14),m);
%2nd 25 meter in 400 m running
% RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+Lap13+Lap14+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+Lap13+Lap14+Lap15),m);
%3rd 25 meter in 400 m running
RawData = M((Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+Lap13+Lap14+Lap15+1):(Start+Lap1+Lap2+Lap3+Lap4+Lap5+Lap6+Lap7+Lap8+Lap9+Lap10+Lap11+Lap12+Lap13+Lap14+Lap15+Lap16),m);
%4th 25 meter in 400 m running


%RawData = M(102000:160000,m);
%RawData = M(22500:80000,m); %Confirm starting point of running - rms first time peak up at 22.5s
RawDataABS = abs(RawData);
    %RawData = M(:,m);

    %tm(:,m) = M(20000:80000,1);
    % BandPass Filter

% a=load('a9.mat');
% a=a.a(20000:80000,1);
% save('m17');
% save('m27');
% save('m37');
% save('m47');
% 
% for n=1:4
%     a=load(m,num2str(n),'.mat');
%     a=a(:,:);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Creating Sampling Time From Data Length%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stw=1;
Fs=1000;
T=1/Fs;
Len=length(RawData);
t1=(0:Len-1)*T;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Filtering the Data With 4th Order Butterworth Filter%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[A,B] = butter(3,10/(Fs/2),'low'); %Highpass filter between 20Hz to 500Hz
%[A,B] = butter(3,[20 450]/(Fs/2),'bandpass'); %Bandpass filter between 20Hz to 500Hz

%%FILTERS DESIGN BY IKEURA%%
% CutOffFreq=5;
% StopFreq=10;
% Wp=CutOffFreq/Fs/2;  % Passband corner frequency
% Ws=StopFreq/Fs/2;    % Stopband corner frequency
% Rp=1;                               % Passband ripple.Maximum permissible passband loss in decibels
% Rs=30;                              % Stopband ripple.number of decibels the stopband is down from the passband
% [N,Wn]=buttord(Wp,Ws,Rp,Rs);        % Buttord calculates the lowest order of N and cutoff freq Wn for butworth filter below
% [B,A]=butter(N,Wn);

x=filter(A,B,RawDataABS);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%CalculateTheGradientOfAccelerometerToIdentifyMovementStartPoint%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dx=diff(x)/T;
% xmst=1; 			% [ymst = 1]
% xmen=Len;			% [ymen = 30]
% xr0=x(1);           % start of filtered y [xr0 = x(1) = 1: The first value of x is assign as xr0; similar to xrf = xf(len=30) = 30]
% xrf=x(Len);         % final of filtered y
% for xst=1:Len-10,    % value of st from 1,2... until the length minus 10 [yst = 1 ---- 20, len = length (data)]
% %     if abs(dx(xst))>0.02 %if absolute balue of dyf is more than 0.02 than break [Jika absolute value of differentiated filtered data > 0.02, stop 					%execution.
% %         break;      %Terminate execution of for loop
% %     end             %end is used to terminate for statements
%     for xen=Len-1:-1:xst+10,%the value of en from length -1,in -1 increment until st + 10
%         if abs(dx(xen))>0.02 % if the absolute value of dyf from end point is more than 0.02 then break
%             break;
%         end
%     end
% end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%Setting the Segmentation Window%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
iBlockLength    = 512;             % Frame Size
iHopLength      = 8;               % Overlapping: Only this much of data is NOT overlapping. When iBlockLength = iHopLength = 2048, means no overlapping occurs.
%afWindow    = hann(iBlockLength,'periodic');
afWindow    = hamming(iBlockLength);% Windowing
cFeatureName = 'TimeRms';           % Which Feature

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Call Compute Feature%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[v1, t] = ComputeFeature(cFeatureName, x, Fs, afWindow, iBlockLength, iHopLength);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%Compute cummulative rms%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%IF PLOT ALL FIGURES IN DIFFERENT FIGURES ONE BY ONE%%%
figure
%hold on
%plot(t1,RawData)
subplot 211
plot(t,v1)
subplot 212
plot(t1,RawData)
%%%%%%%%%%%%%%%%%%%%%%%PLOTTING%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure
%hold on, plot(t,v1), plot(t1,d,'r'), hold off
% plot(t,v1(n))


%plot(t1,x)

%hold off
%subplot(6,1,m)
%plot (t1,RawData)

% title(['Feature= ',cFeatureName, ' Block= ',num2str(iBlockLength),' Hop= ',num2str(iHopLength)])
% legend('Ch1','Ch2')
% xlabel('Time (s)')
% ylabel('Output')
% grid on
end
% figure
% f1=fit(t',v1','poly2')%Determine curve fitting type poly2
% plot(f1,t,v1)%Plot MPF(Y axis) vs Time(X axis) and also curve fitting type poly2: KA tolong check curve fitting ni, orang lain guna curve fitting type apa? Poly2 or exp or ?
% 
% figure
% f2=fit(t',v2','poly2')
% plot(f2,t,v2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SAVE TO WORD%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% if (stw == 1)
%     save2word([adli400,'EMG.doc'])
%     %save() save as mat file.
% end
