% Example for nchoose3(X)
% 
% (c) Sebastian Jiro Schlecht:  12. December 2018
clear; clc; close all;

disp('MATLAB nchoosek')
nchoosek([10 20 30 40 50],3)
disp('nchoose3')
nchoose3([10 20 30 40 50])



disp('MATLAB nchoosek')
tic
x1 = nchoosek(1:200,3);
toc

disp('nchoose3')
tic
x2 = nchoose3(1:200);
toc