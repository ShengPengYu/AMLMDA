%Prediction work

clc;              
clear;            % clear all workspace variables
close all;        % close all windows

% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   
  


load D ;
AD = D ;           % AD is the affinity matrix of disease (383*383)
load M ;
AM = M ;           % AM the affinity matrix of disease (495*495)
load knownre ;
Y = knownre ;        % Y is the ground truth matrix (383*495)
load HMDD;
 
thresh = 10^-8;      % sIterative terminating condition

[F] = Job(AD,AM,Y); % the predict result save in F matrix