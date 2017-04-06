%Classify cells: 
%valid_cells - no_valid_cells - valid_cells_4'(Graphlet gdc11) - valid_cells_5' (Graphlet gdc73) -
%control_cells - tumour_cells

function classify_cells(folder,name)

    %Load rgb image
    Img=imread(['..\Photos\' folder '\' name '\skeleton_final_AP.tif']);

    %Binary in a channel
    BW=rgb2gray(Img);   
    BW(BW>0)=1;    
    BW=double(BW);

    %Labelling img
    L_img=bwlabel(BW);
    
    %% Calculate neighbours
    [neighs_real,sides_cells]=calculate_neighbours(L_img);
    
    %% Valid cells selection
    [valid_cells,no_valid_cells,valid_cells_4,valid_cells_5] = valid_cells_selection (L_img,neighs_real);
    
    %% Tumour cells selection
    
    control_cells = unique(logical(Img(:,:,1)).*L_img);
    tumour_cells=setxor(control_cells,unique(L_img));
    control_cells=control_cells(2:end);
    
    %% Interface cells selection
    control_cells_interface=1-cell2mat(cellfun(@(x) isempty(intersect(tumour_cells,x)) , neighs_real, 'UniformOutput', false));
    control_cells_interface=control_cells_interface(control_cells);
    control_cells_interface=control_cells_interface.*control_cells';
    control_cells_interface=control_cells_interface(control_cells_interface~=0);
    
    tumour_cells_interface=1-cell2mat(cellfun(@(x) isempty(intersect(control_cells,x)) , neighs_real, 'UniformOutput', false));
    tumour_cells_interface=tumour_cells_interface(tumour_cells);
    tumour_cells_interface=tumour_cells_interface.*tumour_cells';
    tumour_cells_interface=tumour_cells_interface(tumour_cells_interface~=0);
    
    
    save(['..\Photos\' folder '\' name '\Classified_cells.mat'],'valid_cells','no_valid_cells','valid_cells_4','valid_cells_5','control_cells','tumour_cells','neighs_real','sides_cells','L_img','tumour_cells_interface','control_cells_interface')
    
end