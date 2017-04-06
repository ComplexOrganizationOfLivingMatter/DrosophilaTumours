function adapter_skeleton_ps (dat, photo)

    cd ..\Photos
    cd (dat)
    cd (photo)

    if exist('skeleton_improved.jpg','file')==2


        Img=imread('skeleton_improved.jpg');
        I=Img;
        I(Img<200)=0;
        I=im2bw(I);
        se=strel('square',3);
        I_erode=imerode(I,se);
        I_water=watershed(1-I_erode,8);
        I2=double(I_water);
        BW=bwareaopen(I2,20);
        
        I_water_2=watershed(1-BW);
        I_water_2(I_water_2>0)=1;
        Skel_final=double(I_water_2);
        Skel_final=bwareaopen(Skel_final,20);
        
        
        Skel_final=logical(Skel_final);
        
        delete('skeleton_final.jpg')
        imwrite(Skel_final,'skeleton_final.tiff');
 

    end

    cd ..\..\..\Code
end