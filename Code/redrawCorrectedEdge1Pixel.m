%Correct images marta 1 pixel lines

Img=im2bw(Img(:,:,1),0.5);
Img=bwareaopen(Img,20);
Img=bwareaopen(1-Img,20);
Img=watershed(Img);
Img(Img>0)=1;
Img=double(Img);
name='Skeleton_proc_engG4 U-egfr U-psqi_210 2b';
imwrite(Img,[name '.tif'])
