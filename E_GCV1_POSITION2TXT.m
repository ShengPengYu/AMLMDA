%Parameter sensitivity analysis for five cross validation

clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   


 load globalposition;
 
 [~,n]=size(globalposition);
 filename = './Experiments/gcv/gcv_position.txt';
fp = fopen(filename,'w');
for dIndex =1:1:n
             fprintf(fp,'%f\n',globalposition(1,dIndex));
     
end

str1 = sprintf('The file.s storage path is    : %s',filename);
disp(str1);    
fclose(fp); 

