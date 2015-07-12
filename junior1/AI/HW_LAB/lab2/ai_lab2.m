clear all;
clc;
%%load train/test data
load('USPS_test.mat');
load('USPS_train.mat');

k=20;%set the number of nearest neighbors
label_test_tmp=zeros(size(data_test,1),1);%record knn result
label_unique=unique(label_train);%get number of class
dist=zeros(size(data_train,1),1);%record each
%%classify for each test data
for j=1:size(data_test,1)
    cnt=zeros(length(label_unique),1);
   for i=1:size(data_train,1)
       dist(i)=norm(data_train(i,:)-data_test(j,:));%calculate distance
   end
   [d,index]=sort(dist);%order the sort result and get the index
   for i=1:k%count the label of k nearest data
       ind=find(label_unique==label_train(index(k)));
       cnt(ind)=cnt(ind)+1;
   end
   [num,ind]=max(cnt);%get the max cnt number and index
   label_test_tmp(j)=label_unique(ind);%decide which label j beloned
end
right_rate=sum((label_test-label_test_tmp)==0)/size(data_test,1);%calculate classification accuracies