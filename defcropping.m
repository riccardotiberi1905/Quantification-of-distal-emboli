%% Image processing
close all 
clearvars
clc

I = imread('MATLAB/2106-1.jpg');
rect5=[220 0.5 1210 740];
rect1 = [200 100 1280 750];
rect2 = [685 365 2215 1125];
[A, BW11, BIN1, iso] = binarization(I,rect1);
[stats_bin, NumTrombosActualizado, stats_below_500, stats500, stats800, stats1000, Circumference] = table_characteristics(BIN1,BW11);
%% Label - Size Diagram
[h, N] = label_size_diagram(NumTrombosActualizado,stats_bin);
disp(N)

%% Frequency Diagram
[T,plot, K] = frequency_diagram(NumTrombosActualizado, stats_bin);
disp(K)

%% Other interesting parameters
[O,P,Q,R,S] = interesting_parameters(stats_bin,stats1000);
disp(O)
disp(P)
disp(Q)
disp(R)
disp(S)