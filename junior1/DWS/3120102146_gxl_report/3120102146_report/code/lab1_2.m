clear;clc;
%path='/Users/ele/Documents/MATLAB/img';
%dir=dir(path);
watermark_wgn=zeros(40,512,512);

for i=1:40
   watermark_wgn_tmp=wgn(512,512,1);
   watermark_wgn(i,:)=reshape(watermark_wgn_tmp,1,512*512);
   tmp=1/sqrt(watermark_wgn(i,:)*watermark_wgn(i,:)'/512/512);
   watermark_wgn(i,:)=watermark_wgn(i,:)*tmp;
end

wlc_work(40)=0;
wlc_coverwork(40)=0;
wlc_coverwork_n(40)=0;

work_uint=imread('img/rec_Hotelling.png');
work_uint=imresize(work_uint,[512,512]);
imshow(work_uint);

work_db=double(work_uint);
work_db=reshape(work_db,1,512*512);

for i=1:40
    coverwork=work_db+watermark_wgn(i,:);
    coverwork_n=work_db-watermark_wgn(i,:);
    wlc_work(i)       =watermark_wgn(i,:)*work_db'/(512*512);
    wlc_coverwork(i)  =watermark_wgn(i,:)*coverwork'/(512*512);
    wlc_coverwork_n(i)=watermark_wgn(i,:)*coverwork_n'/(512*512);
end
wlc_work_mean=mean(wlc_work);
wlc_coverwork_mean=mean(wlc_coverwork);
wlc_coverwork_n_mean=mean(wlc_coverwork_n);
[f1,x1]=ksdensity(wlc_work);
[f2,x2]=ksdensity(wlc_coverwork);
[f3,x3]=ksdensity(wlc_coverwork_n);
plot(x1,f1,x2,f2,x3,f3);

%threshold
threshold=0.5;
threshold_n=-0.5;
%calculate accuracy
accuracy=(length(find(wlc_coverwork>threshold))+length(find(wlc_coverwork_n<-threshold)))/80;
%calculate false positive
fp=0;
index_fp=find(x1>threshold);
fp=fp+trapz(x1(index_fp),f1(index_fp));
index_fp=find(x1<threshold_n);
fp=fp+trapz(x1(index_fp),f1(index_fp));
%calculate false negative
fn=0;
index_fn=find(x2<threshold);
fn=fn+trapz(x2(index_fn),f2(index_fn));
index_fn=find(x3>threshold_n);
fn=fn+trapz(x3(index_fn),f3(index_fn));


