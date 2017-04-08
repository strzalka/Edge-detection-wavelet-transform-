function J=modaproks(I,N)
[approx, ~] = a_trous_dwt(I, N);
J=edge(approx,'canny');
imshow(J);




