clear all; close all; clc; 
%% ================================load data=============================== 
% including 10 classes with different sizes. Each row is a data point. 
% TrainData and TestData are training and testing samples with their 
% labels in TrainLabel and TestLabel respectively. 
load 'caltech101_10.mat'; % including training and testing data; 

TrainData = double(TrainData); 
TestData = double(TestData); 

% display a subset of the training data; 
Idx = [100:120]; 
DispDictionary(double(TrainData(Idx, :))'); 


%% ================================classification==========================
% In this part, you need to perform classification with two different methods:
%    KNN and linear classification. 

% ********************************************KNN**************************************
% First, please using KNN to perform classification. In this section, you
% are required to compare the classification accuracies with different values of K. 
% Suggested values are [1 3 5 10];











% *********************************Linear Classifier***********************
% Plear use Linear Classifier to perform classification. 