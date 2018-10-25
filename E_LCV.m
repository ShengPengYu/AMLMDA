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
 alpha = 1e-4;  
 beta = 1e-5;
 gama = 1;

 
 
dNames = readTxt2Array('./DATASET/dssname.txt',383);
mNames = readTxt2Array('./DATASET/mfsname.txt',495);

[length,~] = size(HMDD);
[~,columns] = size(Y);
for i=1:length
    temp_int = Y ;
    temp_int(HMDD(i,1),HMDD(i,2)) = 0;
    temp_result = Job(AD,AM,temp_int,alpha,beta,gama);
   
    filename = strcat('./Experiments/lcv/',num2str(HMDD(i,2)),'_',num2str(HMDD(i,1)),'.txt');
    fp = fopen(filename,'w');
    
    fprintf(fp,'%s\t%s\t%e\n',mNames{1,HMDD(i,2)},dNames{1,HMDD(i,1)},temp_result(HMDD(i,1),HMDD(i,2)));
    for k=1:columns
        if Y(HMDD(i,1),k)~=1
           fprintf(fp,'%s\t%s\t%e\n',mNames{1,k},dNames{1,HMDD(i,1)},temp_result(HMDD(i,1),k));  
        end
    end 
    
    
    str0 = sprintf('Experiment type               : Local cross validation');
    disp(str0);
    str1 = sprintf('The file.s storage path is    : %s',filename);
    disp(str1);
    str3 = sprintf('Current is                    : %d',i);
    disp(str3);
    str = sprintf('Total steps are               : %d', length);
    disp(str);
    str4 = sprintf('\n');
    disp(str4);

    fclose(fp);
end




