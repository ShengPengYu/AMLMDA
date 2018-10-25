%five fold cross validation

clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   
  


load SD ;
AD = SD ;             % AD is the affinity matrix of disease (383*383)
load SM ;
AM = SM   ;           % AM the affinity matrix of disease (495*495)
load knownre ;
Y = knownre ;         % Y is the ground truth matrix (383*495)
load HMDD;
load x ;
X = x ;

 alpha = 0.0001;  
 beta = 0.0001;
 gama = 1;
 
[dn,mn] = size(Y);
dNames = importdata('./DATASET/dssname.txt');
mNames = importdata('./DATASET/mfsname.txt');

for dIndex =1:1:dn
    temp_Y = Y ;
    row = temp_Y(dIndex,:);
    temp_Y(dIndex,:)=0;
    [temp_F] = Job(AD,AM,temp_Y,alpha,beta,gama); % the predict result save in F matrix
    
    filename = strcat('./Experiments/lodocv/',num2str(dIndex),'.txt');
    fp = fopen(filename,'w');
    fprintf(fp,'%s\t%s\t%s\t%s\n','miRNA','disease','label','score');
    for mIndex = 1:1:mn
        fprintf(fp,'%s\t%s\t%d\t%e\n',mNames{mIndex,1},dNames{dIndex,1},row(1,mIndex),temp_F(dIndex,mIndex));
    end
    
    str0 = sprintf('Experiment type               : leave one disease out cross-validation(LODOCV)');
    disp(str0);
    str1 = sprintf('The file.s storage path is    : %s',filename);
    disp(str1);
    str3 = sprintf('Current is                    : %d',dIndex);
    disp(str3);
    str = sprintf('Total steps are               : %d', dn);
    disp(str);
    str4 = sprintf('\n');
    disp(str4);
    
    fclose(fp);
end
