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


 filename = './Experiments/gcv/gcv_psa_updatealpha.txt';
 fp = fopen(filename,'w');
 fprintf(fp,'%s\t%s\t%s\t%s\n','alpha','beta','gama','G_AUC');   
for alpha = [1e-6,1e-5,1e-4,1e-3,1e-2,1e-1]
    for beta = 0.01;%[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1]
        for gama = 1;%[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1]
          gcv_position = Get_global_position(AD,AM,Y,HMDD,alpha,beta,gama);
          G_AUC = Gpositiontooverallauc(Y,HMDD,gcv_position);
          fprintf(fp,'%f\t%f\t%f\t%f\n',alpha,beta,gama,G_AUC);   
        end
    end
end
fclose(fp);

%G_AUC = Gpositiontooverallauc(Y,HMDD,global_position);
