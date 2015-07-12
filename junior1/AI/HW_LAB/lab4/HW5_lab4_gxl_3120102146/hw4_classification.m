clear all; close all; clc; 
%% ================================load data=============================== 
% Classification Problem: Is it a motobike or plane? (label 1 or 0)
% This data set include 2 classes of visual ojbects: motobike or plane. 
% The raw pixel of each image is used as input vector point x. Each row is a data point. 
% TrainData and TestData are training and testing samples with their 
% labels in TrainLabel and TestLabel respectively. 
load 'caltech101_2s.mat'; % including training and testing data; 
TrainData = double(TrainData); 
TrainLabel = double(TrainLabel);
TestData = double(TestData); 
TestLabel = double(TestLabel);

% display a subset of the training data; 
idx = [450:513]; 
DispDictionary(TrainData(idx, :)'); 

fprintf('Classification accuracy: \n');
%% ************************KNN Classifier*********************************
% First, please using KNN to perform classification. In this section, you
% are required to compare the classification accuracies with different values of K. 
% Suggested values are [1 3 5 9];
%for K=[1 3 5 9]
for K=[3]
    N = size(TestData, 1);
    [idx, D] = knnsearch(TrainData, TestData, 'K', K);
    idx = TrainLabel(idx);
    for i = 1: N
        table = tabulate(idx(i, :));
        [prob(i, :), pred_idx] = max(table(:, 3));
        pred(i, :) = table(pred_idx, 1);
    end
    
    classlabel = pred;
    idx = find(classlabel ~= TestLabel);
    accuracy = (1-length(idx)/length(classlabel))*100.0;
    fprintf('(1).KNN Classifier (K = %d):            %5.2f%% \n', K, accuracy);    
end




%% *********************************Linear Classifier***********************
% Please use Linear Classifier to perform classification. 
% Training the parameters W of linear classifier with respect to input X and T.
% add your code here. 
%accuracy = 0.0;
lamda=0.001;

X=[ones(size(TrainData,1),1),TrainData];
T=TrainLabel;
index=find(T==0);
T(index)=-1;
W=(X'*X+lamda*eye(size(X,2)))\X'*T;
y=[ones(size(TestData,1),1),TestData]*W;
index= find(y>0);
y(index)=1;
index=find(y<0);
y(index)=0;

index=find(TestLabel==y);
accuracy=length(index)/length(TestLabel)*100;


fprintf('(2).Linear Classifier (DIY):           %5.2f%% \n', accuracy);


%% *********************************Fisher Linear Classifier***********************
% Please use Fisher Linear Classifier to perform classification. 
% Use matlab toolbox
quadclass = fitcdiscr(TrainData, TrainLabel, 'discrimType', 'diagQuadratic', ...
                     'SaveMemory', 'on', 'FillCoeffs', 'off'); %diagQuadratic or pseudoQuadratic
classlabel = predict(quadclass, TestData);
idx = find(classlabel ~= TestLabel);
accuracy = (1-length(idx)/length(classlabel))*100.0;
fprintf('(3).Fisher Linear Classifier(MATLAB):  %5.2f%% \n', accuracy);





%% *********************************SVM Classifier***********************
% Please use SVM Classifier to perform classification. 
% add your code here. 

%accuracy = 0.0;
svmstruct=svmtrain(TrainData,TrainLabel);
y=svmclassify(svmstruct,TestData);
index=find(TestLabel==y);
accuracy=length(index)/length(TestLabel)*100;
fprintf('(4).Support Vector Machine (MATLAB):   %5.2f%% \n', accuracy);