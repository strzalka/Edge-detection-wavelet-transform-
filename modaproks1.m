function J=modaproks1(obraz,N)
I=rgb2gray(obraz);
I=double(I);
[approx, ~] = a_trous(I, N);
J=edge(approx,'canny');
imshow(J);




