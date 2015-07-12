clear all; close all; clc;

%% =============================load image================================
X = imread('mountain.jpg');
X = imresize(double(rgb2gray(X)), 0.6);
[rowNum, colNum] = size(X);
% adding noise
noiseMu = 0;
noiseVar = 0.1;
X_corrupted = X + randn(size(X)) * sqrt(noiseVar) + noiseMu;
% standardize the corrupted image
minX = min(min(X_corrupted));
maxX = max(max(X_corrupted));
X_corrupted = (X_corrupted - minX)/(maxX-minX);
imshow(X_corrupted);
% standardize the original image
minX = min(min(X));
maxX = max(max(X));
X = (X - minX)/(maxX-minX);

%% ==========================learn the coefficents in regression function=================
% In this section, we use gaussian kernels as the basis functions. And we
% do regression analysis each row at a time.

basisNum = 100; % define the number of basis functions.
sigma = 0.01; % define the standard deviation.
Phi_mu = linspace(1, colNum, basisNum)/colNum; % set the mean value of each basis function
Phi_sigma = sigma * ones(1, basisNum); % here we set the standard deviation to the same value for brevity.

% use pixel index as the independent variable in the regression function
x = [1:colNum];
x = (x - min(x)) / (max(x)-min(x));

% select the missing pixels randomly
misRatio = 0.2; % define the ratio of the number of missing pixels and the total number;
misNum = ceil(misRatio * colNum);
misIdx = zeros(rowNum, misNum);
X_restored = X;
Phi1 = [ones(misNum, 1) zeros(misNum, basisNum-1)];

% for each row
ddNum = colNum - misNum;
for i = 1: rowNum
    % select the missing pixels each row
    rndIdx = randperm(colNum);
    misIdx(i, :) = rndIdx(1:misNum);
    ddIdx = rndIdx(misNum+1:end);
    
    % compute the coefficients
    Phi = [ones(ddNum, 1) zeros(ddNum, basisNum-1)];
    for j = 2: basisNum
        Phi(:, j) = normpdf(x(ddIdx)', Phi_mu(j-1), Phi_sigma(j-1)) * sqrt(2*pi) * Phi_sigma(j-1);
    end
    w = inv(Phi' * Phi) * Phi' * X_corrupted(i, ddIdx)';
    
    % restore the missing values
    for j = 2: basisNum
        Phi1(:, j) = normpdf(x(misIdx(i, :))', Phi_mu(j-1), Phi_sigma(j-1)) * sqrt(2*pi) * Phi_sigma(j-1);
    end
    X_restored(i, misIdx(i, :)) = w' * Phi1';
end
X_restored = min(X_restored, 1); 
X_restored = max(X_restored, 0); 
%% show the restored image
figure;
imshow(X_restored);

%% show the corrupted image
X1 = X_corrupted;
for i =1 : rowNum
    X1(i, misIdx(i, :)) = zeros(1, misNum);
end
figure;
imshow(X1);

