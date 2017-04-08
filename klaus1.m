 clear all
 close all
 colormap gray
 klaus = imread('C:\Users\Tomek\Documents\MATLAB\Wizyjne - projekt\klaus.jpg','jpg');
 klaus = double(klaus);
 im = klaus(:,:,1)+klaus(:,:,2)+klaus(:,:,3);
 ima = im(1:2048, 501:2548);
 ima2048 = ( ima - min(min(ima)) )/(max(max(ima))-min(min(ima)));
 %----ima2048-----huge klaus image 2048 x 2048 ------------------
  save klaus2048.mat ima2048
  save klaus2048.asc ima2048 -ascii
 %----- now downsampling with averaging for lower resolutions
 for  i= 2 : 2 : 2048
     for j = 2 : 2 : 2048
         ima1024(i/2, j/2) = 1/4* ...
         (ima2048(i-1,j-1)+ima2048(i-1,j)+ima2048(i,j-1)+ima2048(i,j));
     end
  end
 %----ima1024----- klaus image 1024 x 1024 ------------------
 save klaus1024.mat ima1024
 save klaus1024.asc ima1024 -ascii

  for  i= 2 : 2 : 1024
     for j = 2 : 2 : 1024
         ima512(i/2, j/2) = 1/4* ...
         (ima1024(i-1,j-1)+ima1024(i-1,j)+ima1024(i,j-1)+ima1024(i,j));
     end
  end
 %----ima512------klaus image 512 x 512 ----------------------
  save klaus512.mat ima512
  save klaus512.asc ima512 -ascii

  for  i= 2 : 2 : 512
     for j = 2 : 2 : 512
         ima256(i/2, j/2) = 1/4* ...
         (ima512(i-1,j-1)+ima512(i-1,j)+ima512(i,j-1)+ima512(i,j));
     end
  end
 %----ima256------klaus image 256 x 256----------------------
 save klaus256.mat ima256
 save klaus256.asc ima256 -ascii

  for  i= 2 : 2 : 256
     for j = 2 : 2 : 256
         ima128(i/2, j/2) = 1/4* ...
         (ima256(i-1,j-1)+ima256(i-1,j)+ima256(i,j-1)+ima256(i,j));
     end
  end
  %----ima128------klaus image 128 x 128 ----------------------
  save klaus128.mat ima128
  save klaus128.asc ima128 -ascii

  for  i= 2 : 2 : 128
     for j = 2 : 2 : 128
         ima64(i/2, j/2) = 1/4* ...
         (ima128(i-1,j-1)+ima128(i-1,j)+ima128(i,j-1)+ima128(i,j));
     end
  end
  %----ima64------klaus image 64 x 64 -------------------------
  save klaus64.mat ima64
  save klaus64.asc ima64 -ascii
 
 figure(1)
   colormap gray
   subplot(2,3,1), imagesc(ima2048)
   subplot(2,3,2), imagesc(ima1024)
   subplot(2,3,3), imagesc(ima512)
   subplot(2,3,4), imagesc(ima256)
   subplot(2,3,5), imagesc(ima128)
   subplot(2,3,6), imagesc(ima64)
   print -deps  klaus6.eps    % Encapsulated PostScript