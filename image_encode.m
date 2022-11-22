clear all;
clc;
A = imread('PNG_transparency_demonstration_1.png'); % dinh dang png hoac jpg
if (size(A,3)==3)
    B=rgb2gray(A);
else
    B=A;
end
x=reshape(B',[],1);
if(B(1,1)>255)
    binvecc = logical(dec2bin(x, 16) - '0');
else
    binvecc = logical(dec2bin(x, 8) - '0');
end
bit_steam=reshape(binvecc',1,[]);

writematrix(bit_steam','data.txt'); %xuat ra chuoi bit nhi phan trong file text
type data.txt;
writematrix(dec2bin(size(B,1)),'height.txt'); %xuat ra chuoi bit nhi phan chieu cao cuaanh
type width.txt;
writematrix(dec2bin(size(B,2)),'width.txt'); %xuat ra chuoi bit nhi phan chieu rong cua anh
type height.txt;

% Ma hoa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Khoi phuc

if(B(1,1)>255)
    bits=reshape(bit_steam',16,[])';
    w=uint16(bin2dec(num2str(bits)));
    y=reshape(w',size(B,2),size(B,1))';
    C = mat2gray(y);
    imwrite(C,'output.png')
    imshow(C);
else
    bits=reshape(bit_steam',8,[])';
    w=uint8(bin2dec(num2str(bits)));
    y=reshape(w',size(B,2),size(B,1))';
    C = mat2gray(y);
    imwrite(C,'output.jpg')
    imshow(C);
end