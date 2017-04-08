

X=imread('test.jpg');
level = 1;
[c,s] = wavedec2(X,level,'db4');
[chd1,cvd1,cdd1] = detcoef2('all',c,s,level);
subplot(2,2,1), imshow(X),
title('Original Image')
subplot(2,2,2), imshow(chd1),
title('Horizontal Edges')
subplot(2,2,3), imshow(cvd1),
title('Vertical Edges')
subplot(2,2,4), imshow(cdd1),
title('Diagonal Edges')

