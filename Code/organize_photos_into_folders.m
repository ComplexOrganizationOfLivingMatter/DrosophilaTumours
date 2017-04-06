%Organize photos into folders

cd ..\photos

read_dates = dir();
read_dates(1:2)=[];

for i=1:size(read_dates,1)
   
    dat=read_dates(i).name;
    
    cd (dat)
    
    read_photos=dir('*.nd2');
              
    for j=1:size(read_photos,1)
       
        photo=read_photos(j).name;
        name=photo(1:end-4);  
        
        if isdir(name)==0
           mkdir(name);
           movefile(photo,[name '\']);
        end
        
    end
    
    cd ..
    
end

cd ..\Code