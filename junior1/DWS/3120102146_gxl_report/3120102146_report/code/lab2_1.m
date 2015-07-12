clear;clc;
path='/Users/ele/Documents/MATLAB/img';
dir=dir(path);

water_wgn=zeros(8,512,512);
reshape_water_wgn=zeros(8,512*512);
list=[0 0 0 0 0 0 0 0;%0
      1 1 1 1 1 1 1 1;%255
      0 1 1 0 0 1 0 1;%101
      1 0 0 1 1 0 1 0;%154
      1 0 0 0 0 0 0 0;%128
      0 1 1 1 1 1 1 1];%127
ls=list*2-1;
%creat 8 watermark
for i=1:8
   water_wgn(i,:,:)=wgn(512,512,1);
   reshape_water_wgn(i,:)=reshape(squeeze(water_wgn(i,:,:)),1,512*512);
   tmp=1/sqrt(reshape_water_wgn(i,:)*reshape_water_wgn(i,:)'/512/512);
   reshape_water_wgn(i,:)=reshape_water_wgn(i,:)*tmp;
end

wlc(size(dir,1),6,8)=0;
r_l(size(dir,1),6)=0;
strt=1;%strength of watermark
for i=4:size(dir,1)
    %initial img
    img=['/Users/ele/Documents/MATLAB/img/',dir(i).name];
    work_uint=imread(img);
    work_size=size(work_uint);
    if numel(work_size)==3
        work_uint=rgb2gray(work_uint);
    end
    work_uint=imresize(work_uint,[512,512]);
    work_db=double(work_uint);
    
    %add watermark
    for j=1:6
        reshape_work_db=reshape(work_db,1,512*512);
        for k=1:8
           reshape_work_db=reshape_work_db+ls(j,k)*strt*reshape_water_wgn(k,:);
        end
        
        for k=1:8
            wlc(i,j,k)=reshape_work_db*reshape_water_wgn(k,:)'/512/512/strt;
        end
        tmp_r=[2 2 2 2 2 2 2 2];
        index= find(wlc(i,j,:)>0.65);
        tmp_r(index)=1;
        index=find(wlc(i,j,:)<-0.65);
        tmp_r(index)=0;
        if tmp_r==list(j,:)
            r_l(i,j)=1;
        end
    end
end
accuracy=length(find(r_l==1))/(size(dir,1)-3)/6;
%{
water(512)=0;
for i=1:8
    water=water+squeeze(reshape_water_wgn(i,:,:));
end
tmp=1/sqrt(water*water'/512/512);
water=water*tmp;
water=water*sqrt(8);
for i=1:8
    tmp_r=1;
    while tmp_r>0.01
        water_wgn(i,:,:)=wgn(512,512,1);
        reshape_water_wgn(i,:)=reshape(squeeze(water_wgn(i,:,:)),1,512*512);
        tmp_r=abs(reshape_water_wgn(i,:)*p_reshape'/512/512);
    end
    tmp(i)=1/sqrt(reshape_water_wgn(i,:)*reshape_water_wgn(i,:)'/512/512);
    reshape_water_wgn(i,:)=reshape_water_wgn(i,:)*tmp(i);
end


%0
for i=1:8
    p_reshape=p_reshape+reshape_water_wgn(i,:);%squeeze(water_wgn(i,:,:));
    p=p+squeeze(water_wgn(i,:,:));
end
figure;
imshow(uint8(p));

res=[0 0 0 0 0 0 0 0];%res(8)=0;
for i=1:8
    res(i)=p_reshape*reshape_water_wgn(i,:)';
end
res=res/(512*512);
%res=ceil(res);
%}