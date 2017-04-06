
% Calculate polygon distribution average

%Inicialize parameters to save
polygon_distribution_control_oregon=[];
polygon_distribution_control_interface_oregon=[];
polygon_distribution_tumour_oregon=[];
polygon_distribution_tumour_interface_oregon=[];

polygon_distribution_control_0748=[];
polygon_distribution_control_interface_0748=[];
polygon_distribution_tumour_0748=[];
polygon_distribution_tumour_interface_0748=[];

polygon_distribution_control_uas_gfr=[];
polygon_distribution_control_interface_uas_gfr=[];
polygon_distribution_tumour_uas_gfr=[];
polygon_distribution_tumour_interface_uas_gfr=[];


cd ..\Photos

%Read date files in path
[stat,struc] = fileattrib;
PathCurrent = struc.Name;

date_folders = dir(PathCurrent);
date_folders(1:2)=[];

n_Ore=0;n_0748=0;n_UAS=0;
for i=1:length(date_folders)
    
    %Read photos into date folder
    folder=date_folders(i).name;
    cd (folder)
    
    [stat,struc] = fileattrib;
    PathCurrent = struc.Name;

    photo_folders = dir(PathCurrent);
    photo_folders(1:2)=[];
    
    
    for j=1:length(photo_folders)
            
        name=photo_folders(j).name;
        
        if exist(['..\..\Photos\' folder '\' name '\Polygon_distributions.mat'])==2
                       
            
            load(['..\..\Photos\' folder '\' name '\Polygon_distributions.mat'])

            array_control=cell2mat(polygon_distribution_control(2,:));
            array_control_interface=cell2mat(polygon_distribution_control_interface(2,:));
            array_tumour=cell2mat(polygon_distribution_tumour(2,:));
            array_tumour_interface=cell2mat(polygon_distribution_tumour_interface(2,:));

            %building matrix of polygons distribution by genotype
            name=lower(name);
            if isempty(findstr('oregon',name))==0

                    polygon_distribution_control_oregon=[polygon_distribution_control_oregon;array_control];
                    polygon_distribution_control_interface_oregon=[polygon_distribution_control_interface_oregon;array_control_interface];
                    polygon_distribution_tumour_oregon=[polygon_distribution_tumour_oregon;array_tumour];
                    polygon_distribution_tumour_interface_oregon=[polygon_distribution_tumour_interface_oregon;array_tumour_interface];
            
                    n_Ore=n_Ore+1
                    
            elseif isempty(findstr('u-psq',name))==0

                    polygon_distribution_control_0748=[polygon_distribution_control_0748;array_control];
                    polygon_distribution_control_interface_0748=[polygon_distribution_control_interface_0748;array_control_interface];
                    polygon_distribution_tumour_0748=[polygon_distribution_tumour_0748;array_tumour];
                    polygon_distribution_tumour_interface_0748=[polygon_distribution_tumour_interface_0748;array_tumour_interface];

                    n_0748=n_0748+1
            else

                    polygon_distribution_control_uas_gfr=[polygon_distribution_control_uas_gfr;array_control];
                    polygon_distribution_control_interface_uas_gfr=[polygon_distribution_control_interface_uas_gfr;array_control_interface];
                    polygon_distribution_tumour_uas_gfr=[polygon_distribution_tumour_uas_gfr;array_tumour];
                    polygon_distribution_tumour_interface_uas_gfr=[polygon_distribution_tumour_interface_uas_gfr;array_tumour_interface];

                    n_UAS=n_UAS+1
            
            end

            
        end
    
    end
    
    cd ..\..\Photos
end

cd ..\Code


%Calculate means

average_polygon_distribution_control_oregon=mean(polygon_distribution_control_oregon,1);
average_polygon_distribution_control_interface_oregon=mean(polygon_distribution_control_interface_oregon,1);
average_polygon_distribution_tumour_oregon=mean(polygon_distribution_tumour_oregon,1);
average_polygon_distribution_tumour_interface_oregon=mean(polygon_distribution_tumour_interface_oregon,1);
average_polygon_distribution_control_0748=mean(polygon_distribution_control_0748,1);
average_polygon_distribution_control_interface_0748=mean(polygon_distribution_control_interface_0748,1);
average_polygon_distribution_tumour_0748=mean(polygon_distribution_tumour_0748,1);
average_polygon_distribution_tumour_interface_0748=mean(polygon_distribution_tumour_interface_0748,1);
average_polygon_distribution_control_uas_gfr=mean(polygon_distribution_control_uas_gfr,1);
average_polygon_distribution_control_interface_uas_gfr=mean(polygon_distribution_control_interface_uas_gfr,1);
average_polygon_distribution_tumour_uas_gfr=mean(polygon_distribution_tumour_uas_gfr,1);
average_polygon_distribution_tumour_interface_uas_gfr=mean(polygon_distribution_tumour_interface_uas_gfr,1);

%Calculate errors

std_polygon_distribution_control_oregon=std(polygon_distribution_control_oregon,1)/sqrt(size(polygon_distribution_control_oregon,1));
std_polygon_distribution_control_interface_oregon=std(polygon_distribution_control_interface_oregon,1)/sqrt(size(polygon_distribution_control_interface_oregon,1));
std_polygon_distribution_tumour_oregon=std(polygon_distribution_tumour_oregon,1)/sqrt(size(polygon_distribution_tumour_oregon,1));
std_polygon_distribution_tumour_interface_oregon=std(polygon_distribution_tumour_interface_oregon,1)/sqrt(size(polygon_distribution_tumour_interface_oregon,1));
std_polygon_distribution_control_0748=std(polygon_distribution_control_0748,1)/sqrt(size(polygon_distribution_control_0748,1));
std_polygon_distribution_control_interface_0748=std(polygon_distribution_control_interface_0748,1)/sqrt(size(polygon_distribution_control_interface_0748,1));
std_polygon_distribution_tumour_0748=std(polygon_distribution_tumour_0748,1)/sqrt(size(polygon_distribution_tumour_0748,1));
std_polygon_distribution_tumour_interface_0748=std(polygon_distribution_tumour_interface_0748,1)/sqrt(size(polygon_distribution_tumour_interface_0748,1));
std_polygon_distribution_control_uas_gfr=std(polygon_distribution_control_uas_gfr,1)/sqrt(size(polygon_distribution_control_uas_gfr,1));
std_polygon_distribution_control_interface_uas_gfr=std(polygon_distribution_control_interface_uas_gfr,1)/sqrt(size(polygon_distribution_control_interface_uas_gfr,1));
std_polygon_distribution_tumour_uas_gfr=std(polygon_distribution_tumour_uas_gfr,1)/sqrt(size(polygon_distribution_tumour_uas_gfr,1));
std_polygon_distribution_tumour_interface_uas_gfr=std(polygon_distribution_tumour_interface_uas_gfr,1)/sqrt(size(polygon_distribution_tumour_interface_uas_gfr,1));

%Save
save('..\Data\engG4 UAS-GFP\Polygon_distributions_average.mat','std_polygon_distribution_control_uas_gfr','std_polygon_distribution_control_interface_uas_gfr','std_polygon_distribution_tumour_uas_gfr','std_polygon_distribution_tumour_interface_uas_gfr','average_polygon_distribution_control_uas_gfr','average_polygon_distribution_control_interface_uas_gfr','average_polygon_distribution_tumour_uas_gfr','average_polygon_distribution_tumour_interface_uas_gfr')
save('..\Data\engG4 0748\Polygon_distributions_average.mat','std_polygon_distribution_control_0748','std_polygon_distribution_control_interface_0748','std_polygon_distribution_tumour_0748','std_polygon_distribution_tumour_interface_0748','average_polygon_distribution_control_0748','average_polygon_distribution_control_interface_0748','average_polygon_distribution_tumour_0748','average_polygon_distribution_tumour_interface_0748')
save('..\Data\engG4 Oregon\Polygon_distributions_average.mat','std_polygon_distribution_control_oregon','std_polygon_distribution_control_interface_oregon','std_polygon_distribution_tumour_oregon','std_polygon_distribution_tumour_interface_oregon','average_polygon_distribution_control_oregon','average_polygon_distribution_control_interface_oregon','average_polygon_distribution_tumour_oregon','average_polygon_distribution_tumour_interface_oregon')

