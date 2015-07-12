clear all; close all; clc;
%%load image and mask
load('AI/lab3/corrupted.mat');
%load('AI/lab3/Mask.mat');

[rownum,colnum,dimnum]=size(X_corrupted);
X_restored=X_corrupted;
Mask=ceil(X_corrupted);

%%for each dimension
for i=1:dimnum
    tmp_X_corrupted=X_corrupted(:,:,i);
    tmp_Mask=Mask(:,:,i);
    
    
    basisnum = 50; % define the number of basis functions
    sigma = 0.01; % define the standard deviation.
    Phi_mu = linspace(1, colnum, basisnum)/colnum; % set the mean value of each basis function
    Phi_sigma = sigma * ones(1, basisnum); % here we set the standard deviation to the same value for brevity.
    
    % use pixel index as the independent variable in the regression function
    x = 1:colnum;
    x = (x - min(x)) / (max(x)-min(x));
    
    for j=1:rownum
       tmp_Mask_row=tmp_Mask(j,:);
       misnum=sum(tmp_Mask_row<1);
%       misidx = zeros(rownum, misnum);
       [tmpa,tmpb]=sort(tmp_Mask_row);
       misidx=tmpb(1:misnum);
       ddidx = tmpb(misnum+1:end);
       ddnum = colnum - misnum;
       
       Phi1 = [ones(misnum, 1) zeros(misnum, basisnum-1)];
       
       
       % compute the coefficients
       Phi = [ones(ddnum, 1) zeros(ddnum, basisnum-1)];
       for k = 2: basisnum
           Phi(:, k) = normpdf(x(ddidx)', Phi_mu(k-1), Phi_sigma(k-1)) * sqrt(2*pi) * Phi_sigma(k-1);
       end
       w = (Phi' * Phi) \ Phi' * tmp_X_corrupted(j, ddidx)';%w = inv(Phi' * Phi) * Phi' * X_corrupted(i, ddIdx)';
       
       for k = 2: basisnum
           Phi1(:, k) = normpdf(x(misidx)', Phi_mu(k-1), Phi_sigma(k-1)) * sqrt(2*pi) * Phi_sigma(k-1);
       end
       X_restored(j, misidx,i) = w' * Phi1';
    end 
end
X_restored = min(X_restored, 1);
X_restored = max(X_restored, 0);
%% show the restored image
figure;
imshow(X_restored);
save('img_result.mat','X_restored');
imwrite(X_restored,'img_result.png');