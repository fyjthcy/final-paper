clc;
clear;
inDir = './out_image/paozhen/';
dirs=dir(inDir);
dircell=struct2cell(dirs);

%outDir = './out_image/paozhen/';
inName = 'p_01';  
ext = '.bmp';

imNameStr = [];
for i=3:length(dircell)
    imNameCell=dircell(1,i);
    tmp_str=cell2mat(imNameCell);
    if tmp_str(9:12) == '.bmp'
       imNameStr = [imNameStr;tmp_str];
    end
end

for i=1:length(imNameStr)
    imName_path=[inDir imNameStr(i,:)];
    image=imread(imName_path);
    str=['slic.exe ' imName_path ' ' num2str(10) ' ' num2str(100)];
    dos(str);
    fprintf('\nfinish %d\n',i)
%     frame.labels=readDAT(frame.image,frame.imName_path);
end





