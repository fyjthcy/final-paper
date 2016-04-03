clc;
clear;
inDir = './inn_image/paozhen/';
outDir = './out_image/paozhen/';
inName = 'p_01';  
ext = '.bmp';


num_parts = 16;

inTemp = im2double(imread([inDir inName ext]));
[height, width, dim] = size(inTemp);

if(height ~=  2192 || width ~= 2192 || dim ~= 3)
    disp('input image size error...');
    return;
end
% img_num=1;
for i = 0:num_parts-1
   for j = 0:num_parts-1
       outTemp = inTemp(1+i*(height/num_parts):(i+1)*(height/num_parts),1+j*(height/num_parts):(j+1)*(height/num_parts),:);
       if i*num_parts+j+1<10
           outName = [inName '_00' num2str(i*num_parts+j+1)];
       end
       if i*num_parts+j+1<100 && i*num_parts+j+1>=10
           outName = [inName '_0' num2str(i*num_parts+j+1)]; 
       end
       if i*num_parts+j+1>=100
           outName = [inName '_' num2str(i*num_parts+j+1)];
       end
       imwrite(outTemp,[outDir outName ext]);
%        img_num=img_num+1;
   end
end



