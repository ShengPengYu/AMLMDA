%Prediction work
clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   
load SD;
AD = SD;
load SM;
AM = SM;

load knownre ;
Y = knownre ;         % Y is the ground truth matrix (383*495)
load HMDD;
load x ;
X = x ;
dNames = importdata('./DATASET/dssname.txt');
mNames = importdata('./DATASET/mfsname.txt');


 alpha = 0.0001;  
 beta = 0.0001;
 gama = 1;
 
 
[F] = Job(SD,SM,Y,alpha,beta,gama); % the predict result save in F matrix

[R,I] = sort(F,2,'descend');


 [nd,nm] = size(F);
 
  filename = './Experiments/predict/predict_result.txt';
 fp = fopen(filename,'w');

 
for dIndex = 1:1:nd
    fprintf(fp,'%s\t',dNames{dIndex,1});   
    for mIndex = 1:1:nm
        fprintf(fp,'%s\t',mNames{I(dIndex,mIndex),1});   
    end
    fprintf(fp,'\n');
end
fclose(fp);


