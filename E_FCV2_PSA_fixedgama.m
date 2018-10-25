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


 filename = './Experiments/fcv/fcv_psa_fixedgama.txt';
 fp = fopen(filename,'w');
 fprintf(fp,'%s\t%s\t%s\n','alpha','beta','F_AUC');   
for alpha = [1e-6,1e-5,1e-4,1e-3,1e-2,1e-1]
    for beta = [1e-6,1e-5,1e-4,1e-3,1e-2,1e-1]
      fcv_position = Get_fcv_position(AD,AM,Y,HMDD,X,alpha,beta,1);
      F_AUC = Fpositiontooverallauc(Y,HMDD,fcv_position);
      fprintf(fp,'%f\t%f\t%f\n',alpha,beta,F_AUC);   
    end
end
fclose(fp);

%G_AUC = Gpositiontooverallauc(Y,HMDD,global_position);
