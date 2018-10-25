%use old version HMDD database to test the new version HMDD database
clc;              
clear;            % clear all workspace variables
close all;        % close all windows
% matlab does not have the concept of layering, so the data from other 
% subfolders is added to the main program directory before adding code
% to the program:addpath(genpath(pwd));
currentFolder = pwd;              
addpath(genpath(currentFolder));   
ohmdd = importdata('./Experiments/ohmdd/ohmdd.txt');     %Old version HMDD miRNA names

data = ohmdd.data;


[R,I] = sort(data,1,'descend');

[n,~]=size(data);
for index=1:1:n
    result(index,1)=R(index,2);
    result(index,2)=data(I(index,2),1);
end


for i=1:1:10
    row_start = 1;
    row_end = i*1000;
    temp_data = result(row_start:row_end,:);
    out(i,1)=row_end;
    out(i,2)=size(find(temp_data(:,2)==1),1);
end
