%Parameter sensitivity analysis for five cross validation

clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   


txt = importdata('./Experiments/ite/ite_data.txt');
data = txt.data;

%five fold cross validation
X = reshape(data(:,1),1,10);
Y = reshape(data(:,2),1,10);
plot(X,Y,'-*r','LineWidth',1.5); %线性，颜色，标记



xlabel('Number of iterations');
ylabel('Objective function value');
