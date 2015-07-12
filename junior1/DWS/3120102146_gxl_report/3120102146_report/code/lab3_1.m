clear;clc;

path='/Users/ele/Documents/MATLAB/img';
dir=dir(path);
water_wgn=zeros(8,8,8);
reshape_water_wgn=zeros(8,1,8*8);

strenght=sqrt(8);
threshold=0.65;threshold_n=-0.65;

list=[0 0 0 0 0 0 0 0;%0
      1 1 1 1 1 1 1 1;%255
      0 1 1 0 0 1 0 1;%101
      1 0 0 1 1 0 1 0;%154
      1 0 0 0 0 0 0 0;%128
      0 1 1 1 1 1 1 1];%127
ls=list*2-1;

%create watermark
for i=1:8
    tmp_r=1;
    while tmp_r>0.1
        tmp_r=0.01;
        water_wgn(i,:,:)=wgn(8,8,1);
        reshape_water_wgn(i,:,:)=reshape(squeeze(water_wgn(i,:,:)),1,8*8);
        t=1/sqrt(reshape_water_wgn(i,:)*reshape_water_wgn(i,:)'/8/8);
        reshape_water_wgn(i,:)=reshape_water_wgn(i,:)*t;
        for j=1:i-1
        %tmp_r=abs(reshape_water_wgn(i,:)*reshape_tmp_work'/8/8);
        tmp=abs(reshape_water_wgn(i,:)*reshape_water_wgn(j,:)'/8/8);
        if tmp>tmp_r
            tmp_r=tmp;
        end
        end
    end
end

%reencode

tmp_cc(size(dir,1),6)=0;
tmp_cc2(size(dir,1),6)=0;
for i=4:size(dir,1)
    img=['/Users/ele/Documents/MATLAB/img/',dir(i).name];
    work_uint=imread(img);
    work_size=size(work_uint);
    if numel(work_size)==3
        work_uint=rgb2gray(work_uint);
    end
    work_uint=imresize(work_uint,[512,512]);
    work_db=double(work_uint);
    
    tmp_work=zeros(8);
    for j=1:64
        for k=1:64
            tmp_work=tmp_work+work_db((j*8-7):(j*8),(k*8-7):(k*8));
        end
    end
    tmp_work=tmp_work/64/64;
    reshape_tmp_work=reshape(tmp_work,1,64);
    
    for j=1:6
        reencode_water(64)=0;
        for k=1:8
            reencode_water(1,:)=reencode_water(1,:)+ls(j,k)*reshape_water_wgn(k,:);
        end
        t=1/sqrt(reencode_water*reencode_water'/8/8);
        reencode_water=reencode_water*t;
        
        final_work=reshape_tmp_work+strenght*reencode_water;
        mean_wk=final_work-mean(final_work);
        mean_wt=reencode_water-mean(reencode_water);
        tmp_cc(i,j)=mean_wk*mean_wt'/sqrt(abs(mean_wk*mean_wk'))/sqrt(abs(mean_wt*mean_wt'));
        
        mean_wk2=reshape_tmp_work-mean(reshape_tmp_work);
        tmp_cc2(i,j)=mean_wk2*mean_wt'/sqrt(abs(mean_wk2*mean_wk2'))/sqrt(abs(mean_wt*mean_wk'));
    end
end

index=find(tmp_cc>threshold);
accuracy=length(index)/6/(size(dir,1)-3);

reshape_cc=reshape(tmp_cc(4:end,:),1,(size(tmp_cc,1)-3)*6);
[f1,x1]=ksdensity(reshape_cc);

reshape_cc2=reshape(tmp_cc2(4:end,:),1,(size(tmp_cc2,1)-3)*6);
[f2,x2]=ksdensity(reshape_cc2);
plot(x1,f1,x2,f2);
%calculate false positive
fp=0;
index_fp=find(x2>threshold);
fp=fp+trapz(x2(index_fp),f2(index_fp));
index_fp=find(x2<threshold_n);
fp=fp+trapz(x2(index_fp),f2(index_fp));
%calculate false negative
fn=0;
index_fn=find(x1<threshold);
fn=fn+trapz(x1(index_fn),f1(index_fn));
