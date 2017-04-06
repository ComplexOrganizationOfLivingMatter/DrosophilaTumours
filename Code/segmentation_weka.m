function segmentation_weka (dat,photo)

cd ..\Photos
cd (dat)
cd (photo)

Img=imread('Classification result 2.jpg');
Noise=50;

%Enhance image and intensity treshold
I=adapthisteq(Img);

Int_mean=mean(mean(I));


I2=I;

I2(I<Int*0.6)=0;
I2(I>=Int*0.6)=255;

%Binary image
BW=im2bw(I2);

%Delete noise
BWmin= bwareaopen(BW,Noise);

% Fill holes
BW1 = imdilate(BWmin,1);

%Opening and closing to delete dots and compact cells.
se = strel('disk',2);
BW2 = imopen(BW1,se);

se = strel('disk',2);
BW3 = imclose(BW2,se);

BW= bwareaopen(BW3,Noise);

%Skeleton
BW_water=watershed(BW,8);

%Save
imwrite(double(BW_water),'skeleton.jpg');

cd ..\..\..\Code

end