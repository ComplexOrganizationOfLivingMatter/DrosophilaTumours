%Get vertices call

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
    
    cd ..\..\Code
    
    for j=1:length(photo_folders)
            
        if exist(['..\Photos\' date_folders(i).name '\' photo_folders(j).name '\Polygon_distributions.mat'])==2
            date_folders(i).name,
            photo_folders(j).name,
            connect_vertices(date_folders(i).name, photo_folders(j).name);
        end
    
    end
    
    cd ..\Photos
end

cd ..\Code\Calling