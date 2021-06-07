% ADC Lab Project 
% Mehdi Raza Khorasani  -- Syed Muhammad Ali Rizvi

%% Loading variables
clc;clear all; close all;
f = 44100; %signal frequency 
Fs = 2*f; %sampling frequency
bits = 16;

% loading simulink model
sim('analog_digital_comp')
%% plotting signals and correlation output

out = ans;
plot(out.InputSignal);
ylabel('Amplitude')
grid on
title('Input')
figure; plot(out.OutputSignal);
ylabel('Amplitude')
grid on
title('Output')

% correlation
figure;
[C,L] = xcorr(out.InputSignal,out.OutputSignal);
plot(L,C)
ylabel('Amplitude')
grid on
title('Cross-correlation between Input and Output Signal')
xlabel('Time(secs)') 
% the high peak in the cross correlation plot as well as zero lag indicates that both signals are similar.

flag = max(C); % max value in the correlation matrix

%% identification system 

Sample1 = audioread('mehdi_mono.mp3');
Sample2 = audioread('rizvi_mono.mp3');
%Sample3 = audioread('output.wav');
Result = identify_employee(Sample1, Sample2, ans);


