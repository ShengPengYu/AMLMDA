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

alpha = 1e-4;  
 beta = 1e-5;
 gama = 1;




omNames = importdata('./DATASET/ohmdd_int_mirnas.txt');     %Old version HMDD miRNA names
odNames = importdata('./DATASET/ohmdd_int_diseases.txt');   %Old version HMDD disease names
mNames = importdata('./DATASET/mfsname.txt');               %new version HMDD miRNA names
dNames = importdata('./DATASET/dssname.txt');               %new version HMDD miRNA names

[dn,mn] = size(Y);
omNamesSize = size(omNames,1);

count = 0;
trainMatrix = zeros(size(Y));
for dIndex =1:1:dn
    for mIndex =1:1:mn
        for nameIndex =1:1:omNamesSize
            if strcmp(omNames{nameIndex,1},mNames{mIndex,1}) && strcmp(odNames{nameIndex,1},dNames{dIndex,1}) && Y(dIndex,mIndex)==1%过滤掉新版本中有的关系，而在旧版本中没有的关系
                trainMatrix(dIndex,mIndex) = 1;
                count = count+1;
                disp(count);
            end
        end
    end
end

[dn,mn] = size(Y);
filename = './Experiments/ohmdd/ohmdd.txt';
fp = fopen(filename,'w');
fprintf(fp,'%s\t%s\t%s\t%s\n','miRNA','disease','label','score');

    
[temp_F] = Job(AD,AM,trainMatrix,alpha,beta,gama); % the predict result save in F matrix
for dIndex =1:1:dn
    for mIndex =1:1:mn        
        if(trainMatrix(dIndex,mIndex)~=1)
             fprintf(fp,'%s\t%s\t%d\t%e\n',mNames{mIndex,1},dNames{dIndex,1},Y(dIndex,mIndex),temp_F(dIndex,mIndex));
        end
    end
end

str0 = sprintf('Experiment type               : use old version HMDD to test the new version HMDD');
disp(str0);
str1 = sprintf('The file.s storage path is    : %s',filename);
disp(str1);    
fclose(fp); 

