%%%% Algorytm Mallata %%%%%
clear all;
clc;
level = 1;
wname = 'db2';
I=imread('pekniecie1.jpg');
X=double(rgb2gray(I))/255;

% Load original image.

%X=imread('lena.jpg');
%[X,map] = gray2ind(X,128);
% X contains the loaded image. 
% map contains the loaded colormap. 
%nbcol = size(map,1);

%subplot(2,2,1), imshow(X,map), title('zdjecie poczatkowe');
for i=1:level
[obraz(i).cA,obraz(i).cH,obraz(i).cV,obraz(i).cD] = dwt2(X,wname);
X=obraz(i).cA;
end;
%cod_X = wcodemat(X,nbcol); 
%cod_cA1 = wcodemat(obraz(i).cA,nbcol); 
%cod_cH1 = wcodemat(obraz(i).cH,nbcol); 
%cod_cV1 = wcodemat(obraz(i).cV,nbcol); 
%cod_cD1 = wcodemat(obraz(i).cD,nbcol); 

%subplot(2,2,2), imshow(cod_cH1,map), title('detal horyzontalny');
%subplot(2,2,3), imshow(cod_cV1,map), title('detal wertykalny');
%subplot(2,2,4), imshow(cod_cD1,map), title('detal diagonalny');

%cH=ind2gray(cod_cH1,map);
%cV=ind2gray(cod_cV1,map);
%cD=ind2gray(cod_cD1,map);
%image=(cH+cV+cD)/3;
%image=(obraz(level).cH+obraz(level).cV+obraz(level).cD)/3;
figure;
%imshow(image);


[c,s] = wavedec2(I,2,'db1');
[chd1,cvd1,cdd1] = detcoef2('all',c,s,1);

image=(chd1+cvd1+cdd1)/3;
imshow(image);

