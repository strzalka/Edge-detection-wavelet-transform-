function [A, D] = a_trous(I, N)
% I - obraz, N - poziom 
B3 = [1/16 1/4 3/8 1/4 1/16];
h = B3'*B3;
% w ten sposób tworzymy filtr dolnoprzepustowy odpowiedni dla uproszczonego
% algorytmu "a trous" 
A = double(I);
for level = 1:N
approx(:,:,level) = conv2(A, h, 'same');

D(:,:,level) = A - approx(:,:,level);
A = approx(:,:,level);
end