clear;clc;

p=imread('img/woman1.png');imshow(p);
p=double(p);
p_reshape=reshape(p,1,512*512);

water_wgn=zeros(8,512,512);
reshape_water_wgn=zeros(8,512*512);
tmp=[0 0 0 0 0 0 0 0];
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