clear;clc;

path='/Users/ele/Documents/MATLAB/img';
dir=dir(path);

watermark_wgn=wgn(512,512,1);
watermark_wgn_d=reshape(watermark_wgn,1,512*512);
%make sure the length of watermark_wgn_d is 1
tmp=1/sqrt(watermark_wgn_d*watermark_wgn_d'/512/512);
watermark_wgn_d=watermark_wgn_d*tmp;

wlc_work(size(dir,1)-3)=0;
wlc_coverwork(size(dir,1)-3)=0;
wlc_coverwork_n(size(dir,1)-3)=0;

for i=4:size(dir,1)
    img=['/Users/ele/Documents/MATLAB/img/',dir(i).name];
    work_uint=imread(img);
    work_size=size(work_uint);
    if numel(work_size)==3
        work_uint=rgb2gray(work_uint);
    end
    work_uint=imresize(work_uint,[512,512]);
    work_db=double(work_uint);
    coverwork=work_db+watermark_wgn;
    coverwork_n=work_db-watermark_wgn;
%    coverwork_uint8=uint8(coverwork);
%    coverwork_n_uint8=uint8(coverwork_n);
    
    work_db_d      =reshape(work_db,      1,512*512);
    coverwork_d    =reshape(coverwork,    1,512*512);
    coverwork_n_d  =reshape(coverwork_n,  1,512*512);
    wlc_work(i-3)       =watermark_wgn_d*work_db_d'/(512*512);
    wlc_coverwork(i-3)  =watermark_wgn_d*coverwork_d'/(512*512);
    wlc_coverwork_n(i-3)=watermark_wgn_d*coverwork_n_d'/(512*512);
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
accuracy=(length(find(wlc_coverwork>threshold))+length(find(wlc_coverwork_n<-threshold)))/2/(size(dir,1)-3);
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