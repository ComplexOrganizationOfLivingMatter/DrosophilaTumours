function connect_vertices( folder,name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Img=imread(['..\Photos\' folder '\' name '\skeleton_final.tiff']);

L_img=bwlabel(im2bw(Img),8);
[vertices,neighbours_vertices]=get_vertices(L_img);

%Delete duplicated and overlapped vertices
[vertices_2, neighbours_vertices_2] = refine_vertices(vertices,neighbours_vertices);

close all

[H,W,c]=size(L_img);
h=figure;imshow(ones(H,W))
hold on

%This code connects vertices which have 2 neighbours cells common
for i=1:size(neighbours_vertices_2,2)
    cel_vert_1=cat(1,neighbours_vertices_2{1,i})';
    for j=i+1:size(neighbours_vertices_2,2)
        
        cel_vert_2=cat(1,neighbours_vertices_2{1,j})';
        
        cel_common=intersect(cel_vert_1,cel_vert_2);
        
        if length(cel_common)>=2
           XY1=cat(1,vertices_2{1,i});
           XY2=cat(1,vertices_2{1,j})';
            plot([XY1(2) XY2(2)],[XY1(1) XY2(1)],'-k')
            
        end
        
    end
end
hold off

addpath('export_fig_master')

export_fig(['..\Photos\' folder '\' name '\Connected_vertices.tif'], '-native');

Img=imread(['..\Photos\' folder '\' name '\Connected_vertices.tif']);
Img=imresize(Img,[1024,1024]);
imwrite(Img,['..\Photos\' folder '\' name '\Connected_vertices.tif'])

end

