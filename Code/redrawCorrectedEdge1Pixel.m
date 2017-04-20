%Correct images marta 1 pixel lines

Img=im2bw(Img(:,:,1),0.5);
Img=bwareaopen(Img,20);
Img=bwareaopen(1-Img,20);
Img=watershed(Img);
Img(Img>0)=1;
Img=double(Img);
imwrite(Img,'name.tif')
