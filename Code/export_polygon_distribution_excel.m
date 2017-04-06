%Write polygon distribution in excel


load('..\Data\engG4 UAS-GFP\Polygon_distributions_average.mat')
load('..\Data\engG4 Oregon\Polygon_distributions_average.mat')
load('..\Data\engG4 0748\Polygon_distributions_average.mat')


xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_control_0748,'Hoja1','E7' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_tumour_0748,'Hoja1','E8' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_control_interface_0748,'Hoja1','E9' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_tumour_interface_0748,'Hoja1','E10' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_control_oregon,'Hoja1','E14' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_tumour_oregon,'Hoja1','E15' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_control_interface_oregon,'Hoja1','E16' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_tumour_interface_oregon,'Hoja1','E17' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_control_uas_gfr,'Hoja1','E21' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_tumour_uas_gfr,'Hoja1','E22' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_control_interface_uas_gfr,'Hoja1','E23' );
xlswrite(['..\Polygon_distributions ' date],average_polygon_distribution_tumour_interface_uas_gfr,'Hoja1','E24' );

xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_control_0748,'Hoja1','O7' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_tumour_0748,'Hoja1','O8' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_control_interface_0748,'Hoja1','O9' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_tumour_interface_0748,'Hoja1','O10' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_control_oregon,'Hoja1','O14' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_tumour_oregon,'Hoja1','O15' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_control_interface_oregon,'Hoja1','O16' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_tumour_interface_oregon,'Hoja1','O17' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_control_uas_gfr,'Hoja1','O21' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_tumour_uas_gfr,'Hoja1','O22' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_control_interface_uas_gfr,'Hoja1','O23' );
xlswrite(['..\Polygon_distributions ' date],std_polygon_distribution_tumour_interface_uas_gfr,'Hoja1','O24' );
