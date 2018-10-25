%Parameter sensitivity analysis for five cross validation

clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   


txt = importdata('./Experiments/fcv/fcv_psa_fixedalpha.txt');
data = txt.data;

%five fold cross validation
X=[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1];
Y=[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1];
Z = reshape(data(:,3),6,6);

mybar3(X,'beta',Y,'gama',Z,'AUC',150,40)
