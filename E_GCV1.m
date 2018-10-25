%global cross validation

clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   
  


load SD ;
AD = SD ;           % AD is the affinity matrix of disease (383*383)
load SM ;
AM = SM   ;           % AM the affinity matrix of disease (495*495)
load knownre ;
Y = knownre ;        % Y is the ground truth matrix (383*495)
load HMDD;
 
thresh = 10^-8;      % sIterative terminating condition
 alpha = 0.0001;  
 beta = 0.002;
 gama = 1;

global_position = Get_global_position(AD,AM,Y,HMDD,alpha,beta,gama);
G_AUC = Gpositiontooverallauc(Y,HMDD,global_position);
