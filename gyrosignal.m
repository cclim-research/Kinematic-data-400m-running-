%Clear workspace and load data
clear all; clc
load('grf_gait_events_data.mat')
function [heel_strikes, toe_offs] = gait_events_grf(grf)
%This function uses a 10N ground reaction force threshold to identify heel 
%strikes and toe offs during locomotion 
%Created by: Daniel Kuhman
%Last updated: 2020-05-16
%Input: continuous time series vertical ground reaction force
%Output: arrays containing frame numbers of heel strikes and toe offs

heel_strikes = [];
toe_offs = [];

for i = 1:length(grf)
    if i == length(grf)
        break
    elseif grf(i) < 10 && grf(i+1) > 10
        heel_strikes(end+1) = i + 1;
    elseif grf(i) > 10 && grf(i+1) < 10
        toe_offs(end+1) = i;
    end
end

end
%Isolate vertical GRF 
grf_z = data.grf_z;

%Capture frequency of the force platform
frame_rate = 1000;

%Apply a 4th order lowpass Butterworth filter with cutoff frequency of 6Hz
[B, A] = butter(4, 6/frame_rate,'low');
grf_z_filt = filtfilt(B, A, grf_z);

%Plot initial and filtered data
figure
plot(grf_z, '-b', 'LineWidth', 1.5)
hold on
plot(grf_z_filt, '-r', 'LineWidth', 1.5)
hold off
legend('Original', 'Filtered')
xlabel('Frames')
ylabel('Vertical GRF (N)')
 
