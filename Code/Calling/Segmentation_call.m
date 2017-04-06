%%Segmentation_call

cd ..\..\Photos

%Read date files in path
[stat,struc] = fileattrib;
PathCurrent = struc.Name;

date_folders = dir(PathCurrent);
date_folders(1:2)=[];

for i=1:length(date_folders)
    
    %Read photos into date folder
    cd (date_folders(i).name)
    
    [stat,struc] = fileattrib;
    PathCurrent = struc.Name;

    photo_folders = dir(PathCurrent);
    photo_folders(1:2)=[];
    
    for j=1:length(photo_folders)
        
       cd (photo_folders(j).name)
       
       if exist('Classification result 2.jpg')==2
           
           cd ..\..\..\Code
           
           segmentation_weka(date_folders(i).name, photo_folders(j).name)
           
           cd ..\Photos
           cd (date_folders(i).name)
           cd (photo_folders(j).name)
          
       end
       
       cd ..
        
    end
    
    cd ..
end

cd ..\Code\Calling