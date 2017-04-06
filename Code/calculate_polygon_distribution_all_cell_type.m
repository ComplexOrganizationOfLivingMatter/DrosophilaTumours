function calculate_polygon_distribution_all_cell_type( folder,name )

load(['..\Photos\' folder '\' name '\Classified_cells.mat']) 


polygon_distribution_control=calculate_polygon_distribution( sides_cells, intersect(valid_cells,control_cells) );

polygon_distribution_tumour=calculate_polygon_distribution( sides_cells, intersect(valid_cells,tumour_cells) );

polygon_distribution_control_interface=calculate_polygon_distribution( sides_cells, intersect(valid_cells,control_cells_interface) );

polygon_distribution_tumour_interface=calculate_polygon_distribution( sides_cells, intersect(valid_cells,tumour_cells_interface) );



%% Save data

string=['..\Photos\' folder '\' name '\Polygon_distributions.mat'];

save(string,'polygon_distribution_control','polygon_distribution_tumour','polygon_distribution_control_interface','polygon_distribution_tumour_interface')



end

