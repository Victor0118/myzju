clear;clc;

p=imread('img/woman2.png');
p=double(p);
tmp_work=zeros(8,8);

for i=1:64
    for j=1:64
        tmp_work=tmp_work+p((i*8-7):(i*8),(j*8-7):(j*8));
    end
end

mess=[1 0 1 0 1 0 1 0];
mess=mess*2-1;

tmp_work=tmp_work/(64*64);
reshape_tmp_work=reshape(tmp_work,1,8*8);
water_wgn=zeros(8,8,8);
reshape_water_wgn=zeros(8,1,8*8);

strenght=10;

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


final_work=reshape_tmp_work;
reencode_water(64)=0;
for i=1:8
    reencode_water(1,:)=reencode_water(1,:)+mess(i)*reshape_water_wgn(i,:);
end
t=1/sqrt(reencode_water*reencode_water'/8/8);
reencode_water=reencode_water*t;

cc=[0 0 0 0 0 0 0 0];

final_work=final_work+reencode_water;

mean_wk=final_work-mean(final_work);
mean_wt=reencode_water-mean(reencode_water);
tmp_cc=mean_wk*mean_wt'/sqrt(mean_wk*mean_wk')/sqrt(mean_wt*mean_wk');

%{
for i=1:8
    final_work=final_work+mess(i)*reshape_water_wgn(i,:);
end



for i=1:8
    mean_fw=final_work-mean(final_work);
    mean_wm=reshape_water_wgn(i,:)-mean(reshape_water_wgn(i,:));
    cc(i)=mean_fw*mean_wm'/sqrt(mean_wm*mean_wm')/sqrt(mean_fw*mean_fw');
end
%}
result=ceil(cc);
