clear;clc;
work=imread('img/woman1.png');
work_db=double(work);


list=[0 0 0 0 0 0 0 0;%0
      1 1 1 1 1 1 1 1;%255
      0 1 1 0 0 1 0 1;%101
      1 0 0 1 1 0 1 0;%154
      1 0 0 0 0 0 0 0;%128
      0 1 1 1 1 1 1 1];%127
ls=list*2-1;

strt=1;
wlc(50,6,8)=0;
r_l(50,6)=0;
for i=1:50
    water_wgn=zeros(8,512,512);
    reshape_water_wgn=zeros(8,512*512);
    
    for j=1:8
        water_wgn(j,:,:)=wgn(512,512,1);
        reshape_water_wgn(j,:)=reshape(squeeze(water_wgn(j,:,:)),1,512*512);
        tmp=1/sqrt(reshape_water_wgn(j,:)*reshape_water_wgn(j,:)'/512/512);
        reshape_water_wgn(j,:)=reshape_water_wgn(j,:)*tmp;
    end
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

accuracy=length(find(r_l==1))/50/6;