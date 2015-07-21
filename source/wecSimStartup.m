% wecSimStartup.m
% Copy the code in this file and place it in you 'startup.m' file

% Set the wecSimPath variable to the location of the WEC-Sim source directory
wecSimPath = 'C:\Users\rso\Documents\MATLAB\WEC-Sim'; 

% Add the source folder to the MATLAB path
folderToAdd = 'source';
addpath(genpath([wecSimPath filesep folderToAdd]));

% Clear unneeded variables
clear wecSimPath folderToAdd
