%Ma hoa
clear all;
clc;
A = imread('low_res.jpg');
B=rgb2gray(A);
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
bits=reshape(binvecc',1,[]);

%bits = [1 0 1 1 1 0 0 1];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n+1:(i-1)*n+n/2) = 1;
    x((i-1)*n+n/2:i*n) = -1;
  else
    x((i-1)*n+1:(i-1)*n+n/2) = -1;
    x((i-1)*n+n/2:i*n) = 1;
  end
end
plot(t, x, 'Linewidth', 3);
if(B(1,1)>255)
    xlim([0 16]);
else
    xlim([0 8]);
end

%Giai ma
counter = 0;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1;
    if x(i)>0
      result(counter) = x(i);
    else result(counter) = 0;
    end
  end
end
disp('Manchester Decoding:');
disp(result);

writematrix(result','data.txt'); %Xuat chuoi bit cua hinh anh
writematrix(dec2bin(size(B,1)),'height.txt'); %Xuat chuoi bit chieu cao anh
writematrix(dec2bin(size(B,2)),'width.txt'); %Xuat chuoi bit chieu rong anh