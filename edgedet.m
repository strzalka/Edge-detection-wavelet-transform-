function J = edgedet (obraz, N)
I=rgb2gray(obraz);
% undecimated wavelet transform - Stacjonarna Transformata Falkowa 
% UDWT - SWT (Stationary Wavelet Transform)
% ~ - wspó³czynniki aproksymacji, które nie s¹ u¿ywane
% detail - wspó³czynniki detali 
[~, detail] = a_trous(I, N);
% detail jest macierz¹ o wymiarach (a,b,N), gdzie a i b to wymiary obrazu,
% a N to poziom SWT  
% modu³ z falkowych wspó³czynników detali
D = abs( detail(:,:,N) );
% D to macierz wartoœci bezwzglêdnej wspó³czynników detali najwy¿szego
% rzêdu. W ten sposób otrzymujemy tylko liczby dodatnie - liczby
% najbardziej odleg³e od zera odpowiadaj¹ najostrzejszym krawêdziom. 
% odfiltrowanie najbardziej istotnych pikseli
J = (D>filter2(ones(3)/9,D)).*(D>mean2(D));
% zachowywane s¹ tylko te piksele, których wartoœæ jest wiêksza od ich
% najbli¿szego otoczenia, oraz jednoczeœnie od œredniej wartoœci
% "Wyczyszczenie" krawêdzi obrazu 
[R C] = size(J);
J(1:3, :) = 0;
J(R-2:R, :) = 0;
J(:, 1:3) = 0;
J(:, C-2:C) = 0;
subplot(1,2,1); imshow(I), title('Obraz poczatkowy');
subplot(1,2,2); imshow(J), title('Wykryte krawêdzie');