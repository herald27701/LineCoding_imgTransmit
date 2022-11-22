fid = fopen('data.txt');
z=textscan(fid,'%s');

h=fopen('height.txt');
he=textscan(h,'%s');
w=fopen('width.txt');
wi=textscan(w,'%s');

hei=char(he{1});
wid=char(wi{1});

heig=logical(hei(:)'-'0');
widt=logical(wid(:)'-'0');

height=double(bin2dec(num2str(heig)));
width =double(bin2dec(num2str(widt)));

variables = str2mat(z{1, 1});
bit_steam=logical(variables-'0')';
bits=reshape(bit_steam',16,[])';
w=uint16(bin2dec(num2str(bits)));
y=reshape(w',width,height)';
C = mat2gray(y);
imwrite(C,'output.png');
imshow(C); 