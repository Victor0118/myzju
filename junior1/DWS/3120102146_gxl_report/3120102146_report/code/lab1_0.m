clc;clear;
work_uint=imread('img/woman1.png');
work_db=double(work_uint);
watermark_wgn=wgn(512,512,1);
coverwork=work_db+watermark_wgn;
coverwork_n=work_db-watermark_wgn;
coverwork_uint8=uint8(coverwork);
coverwork_n_uint8=uint8(coverwork_n);
imshow(coverwork_uint8);
figure;
imshow(work_uint);
%imshow(coverwork_n_uint8);

watermark_wgn_d=reshape(watermark_wgn,1,512*512);
work_db_d      =reshape(work_db,      1,512*512);
coverwork_d    =reshape(coverwork,    1,512*512);
coverwork_n_d  =reshape(coverwork_n,  1,512*512);
wlc_work       =watermark_wgn_d*work_db_d'/(512*512);
wlc_coverwork  =watermark_wgn_d*coverwork_d'/(512*512);
wlc_coverwork_n=watermark_wgn_d*coverwork_n_d'/(512*512);

