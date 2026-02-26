%% Clear Everything
clc
clear
warning off all
 
%% Sampling Frequency
Fs = 1000;

%% Load Dataset for hur_ah
DatasetHur = dlmread('hur_ah_2018-11-17_19-19-48_Segment_0.asc','\t',1);
StartTimeHur = 11;
runHur = [0,7,13,20,27,34,41,47,55,61,68,75,82,88,94,101,107];                          %Insert Running Time for each 25 Meters
[PLDHur, ACCHur, meanPLDHur, stdPLDHur, tHur] = PLDFunc(DatasetHur, Fs, StartTimeHur, runHur);  %Run the PLD Function for Hur

figure(1)
plot(meanPLDHur(1,:),'b*-'),hold on
plot(meanPLDHur(2,:),'r*-')
plot(meanPLDHur(3,:),'m*-')
plot(meanPLDHur(4,:),'k*-')
plot(meanPLDHur(5,:),'g*-')
plot(meanPLDHur(6,:),'y*-')
plot(meanPLDHur(7,:),'c*-'),hold off
legend('PLDxyz','PLDxy','PLDxz','PLDyz','PLDx','PLDy','PLDz');
title('PLD for HUr')
grid on

%% Load Dataset for Cheong
DatasetCg = xlsread('CheongRun');
StartTimeCg = 17;
runCg = [0,4.4,8.8,12.6,17,21.5,26.1,30.7,35,40.4,45.7,52.1,58.2,65,71,77.5,83.7]; %Insert Running Time for each 25 Meters
[PLDCg, ACCCg, meanPLDCg, stdPLDCg, tCg] = PLDFunc(DatasetCg, Fs, StartTimeCg, runCg);         %Run the PLD Function for Hur

figure(2)
plot(meanPLDCg(1,:),'b*-'),hold on
plot(meanPLDCg(2,:),'r*-')
plot(meanPLDCg(3,:),'m*-')
plot(meanPLDCg(4,:),'k*-')
plot(meanPLDCg(5,:),'g*-')
plot(meanPLDCg(6,:),'y*-')
plot(meanPLDCg(7,:),'c*-'),hold off
legend('PLDxyz','PLDxy','PLDxz','PLDyz','PLDx','PLDy','PLDz');
title('PLD for Cg')
grid on

%% Load Dataset for Limka
DatasetLka = xlsread('LimkaRun');
StartTimeLka = 8;
runLka = [0,5.4,10.2,14.7,19.75,24.6,29.7,35.1,40.5,47.6,53.7,60.6,75.9,83.7,91.7,99.6,104.2]; %Insert Running Time for each 25 Meters
[PLDLka, ACCLka, meanPLDLka, stdPLDLka, tLka] = PLDFunc(DatasetLka, Fs, StartTimeLka, runLka);         %Run the PLD Function for Limka

figure(3)
plot(meanPLDLka(1,:),'b*-'),hold on
plot(meanPLDLka(2,:),'r*-')
plot(meanPLDLka(3,:),'m*-')
plot(meanPLDLka(4,:),'k*-')
plot(meanPLDLka(5,:),'g*-')
plot(meanPLDLka(6,:),'y*-')
plot(meanPLDLka(7,:),'c*-'),hold off
legend('PLDxyz','PLDxy','PLDxz','PLDyz','PLDx','PLDy','PLDz');
title('PLD for Lka')
grid on

%% Load Dataset for Lim
DatasetLim = xlsread('LimRun');
StartTimeLim = 9;
runLim = [0,5.6,10.5,15,20.3,25.5,31.2,36.5,42.4,50.3,57.8,64.8,72,79.5,87,94,101.8];
[PLDLim, ACCLim, meanPLDLim, stdPLDLim, tLim] = PLDFunc(DatasetLim, Fs, StartTimeLim, runLim);

figure(4)
plot(meanPLDLim(1,:),'b*-'),hold on
plot(meanPLDLim(2,:),'r*-')
plot(meanPLDLim(3,:),'m*-')
plot(meanPLDLim(4,:),'k*-')
plot(meanPLDLim(5,:),'g*-')
plot(meanPLDLim(6,:),'y*-')
plot(meanPLDLim(7,:),'c*-'),hold off
legend('PLDxyz','PLDxy','PLDxz','PLDyz','PLDx','PLDy','PLDz');
title('PLD for Lim')
grid on

%% Load Dataset for Tan
DatasetTan = xlsread('TanRun');
StartTimeTan = 17;
runTan = [0,4.48,8.64,12.7,17.16,23,27.4,31.7,36.2,42.4,49.5,55.9,62,69,75,82,91];
[PLDTan, ACCTan, meanPLDTan, stdPLDTan, tTan] = PLDFunc(DatasetTan, Fs, StartTimeTan, runTan);

figure(5)
plot(meanPLDTan(1,:),'b*-'),hold on
plot(meanPLDTan(2,:),'r*-')
plot(meanPLDTan(3,:),'m*-')
plot(meanPLDTan(4,:),'k*-')
plot(meanPLDTan(5,:),'g*-')
plot(meanPLDTan(6,:),'y*-')
plot(meanPLDTan(7,:),'c*-'),hold off
legend('PLDxyz','PLDxy','PLDxz','PLDyz','PLDx','PLDy','PLDz');
title('PLD for Tan')
grid on

%% Load Dataset for Ting
DatasetTig = xlsread('TingRun');
StartTimeTig = 17;
runTig = [0,5.11,9.81,13.96,19.09,24.42,30.61,37.19,44.09,51.86,59.91,68.49,77.63,86.84,96.05,105.26,114.42];
[PLDTig, ACCTig, meanPLDTig, stdPLDTig, tTig] = PLDFunc(DatasetTig, Fs, StartTimeTig, runTig);

figure(6)
plot(meanPLDTig(1,:),'b*-'),hold on
plot(meanPLDTig(2,:),'r*-')
plot(meanPLDTig(3,:),'m*-')
plot(meanPLDTig(4,:),'k*-')
plot(meanPLDTig(5,:),'g*-')
plot(meanPLDTig(6,:),'y*-')
plot(meanPLDTig(7,:),'c*-'),hold off
legend('PLDxyz','PLDxy','PLDxz','PLDyz','PLDx','PLDy','PLDz');
title('PLD for Tig')
grid on

%% Plot
figure(7)
plot(meanPLDHur(1,:)), hold on
plot(meanPLDCg(1,:))
plot(meanPLDLka(1,:))
plot(meanPLDLim(1,:))
plot(meanPLDTan(1,:))
plot(meanPLDTig(1,:)), hold off
grid on
title('Player Load for Running')
legend('Hur','Cheong','Limka','Lim','Tan','Ting')

%% Testing boxplot
% Hur
figure(8)
x = [];
for j = 1:16
    y = PLDHur{j};
   x =  [x;y];
end

g = [];
for j = 1:16
    g = [g;j*ones(length(PLDHur{j}),1)];
end
boxplot(x, g)
title('Box Plot for Hur')

% Chong
figure(9)
x = [];
for j = 1:16
    y = PLDCg{j};
   x =  [x;y];
end

g = [];
for j = 1:16
    g = [g;j*ones(length(PLDCg{j}),1)];
end
boxplot(x, g)
title('Box Plot for Chong')
% 
% %% Plotting
% % Plot the mean PLD value for each 25M
% figure(1)
% plot(meanPLD,'b*-')
% grid on
% title('Mean PLD for Each 25 Meters')
% % Plot PLD for each Run Change from 1 to 16
% figure(2)
% for n = 1:4
%     Run = n;
%     t1 = t{Run}+run(Run);
%     subplot (4,1,n)
%     plot(t1,PLD{Run})
%     suptitle('PLD for Run 1-4')
% end
% 
% figure(3)
% for n = 5:8
%     Run = n;
%     t1 = t{Run}+run(Run);
%     subplot (4,1,n-4)
%     plot(t1,PLD{Run})
%     suptitle('PLD for Run 5-8')
% end
% 
% figure(4)
% for n = 9:12
%     Run = n;
%     t1 = t{Run}+run(Run);
%     subplot (4,1,n-8)
%     plot(t1,PLD{Run})
%     suptitle('PLD for Run 9-12')
% end
% 
% figure(5)
% for n = 13:16
%     Run = n;
%     t1 = t{Run}+run(Run);
%     subplot (4,1,n-12)
%     plot(t1,PLD{Run})
%     suptitle('PLD for Run 13-16')
% end