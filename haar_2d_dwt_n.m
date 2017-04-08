function J = haar_2d_dwt_n(I, N)
I = double(I);
[nrows ncols] = size(I);
if nrows ~= ncols,
    error(' Only support square images.');
end
num_levels = log2 (nrows);
if num_levels ~= floor(num_levels)
error('Image must have power-of-2 dimensions.');
end
H = haar_basis(2^num_levels);
for kk = num_levels:-l:num_levels-N+l
sz = 2^kk;
P = permutation_matrix(sz);
J(l:sz,l:sz) = P*H(l:sz,l:sz)*J(l:sz,l:sz)*H(l:sz,l:sz)' *P';
end