% ROW AND COLUMN CONVOLUTION ALGORITHM
% Jest to algorytm zaproponowany przez prof. Yahia Al-Halabi w artykule 
% "New wavelet-based techniques for edge detection" w Journal of
% Theoretical and Applied Information Technology 
% (http://www.jatit.org/volumes/research-papers/Vol23No1/5Vol23No1.pdf) 

%Wczytanie oraz przygotowanie obrazu do analizy. Obraz powinien byæ w skali
%szaroœci oraz macierz¹ typu uint8. 
function ConvolutionAlgorithm(obraz,wname);
I=rgb2gray(obraz);
I=double(I)/255;
[N,M] = size(I); 

%Utworzenie filtra górnoprzepustowego dla wybranej falki 
%HPD - high pass decomposition filter
[LO_D,HI_D,LO_R,HI_R] = wfilters(wname);

%Dla ka¿dego wiersza i ka¿dej kolumny wykonujemy splot z filtrem
%górnoprzepustowym.

for i=1:N
   %RDiff = Convolution (HI_D, IM(i, :))
    RDiff(i,:)= conv2(HI_D,I(i,:));  
end

for j=1:M
    %CDiff = Convolution (HI_D, IM( :, j));
    I1=I';
    CDiff(j,:)= conv2(HI_D,I1(j,:));
    CDiff1=CDiff';
end

%Nastêpnie uzyskane w ten sposób 2 obrazy (jeden przy splocie po kolumnach,
%drugi po wierszach) ³¹czymy w jeden obraz. 
for i=1:N
   for j=1:M
      EM(i,j)=abs(CDiff1(i,j))+abs(RDiff(i,j)); 
   end
end

% W algorytmie w tym miejscu nastêpuje jeszcze skalowanie tak, aby wartoœæ
% ka¿dego elementu w macierzy by³a z zakresu <0,1>. Nie jest to konieczne -
% ju¿ teraz wartoœæ ka¿dego elementu macierzy EM mieœci siê w tym zakresie.



%Tresholding - eliminacja progowa
%S³u¿y do pokazania najbardziej istotnych pikseli. Zmieniaj¹c wartoœæ progu
%mo¿na zmieniæ iloœæ pokazywanych krawêdzi. 
prog=0.1;
for i=1:N
   for j=1:M
      if EM(i,j)<prog
      EM1(i,j)=0;
      else
      EM1(i,j)=1;
      end
   end
end

%Wyœwietlenie wyniku algorytmu oraz obrazu pocz¹tkowego do porównania
subplot(1,2,1); imshow(I), title('Obraz poczatkowy');
subplot(1,2,2); imshow(EM1), title('Wykryte krawêdzie');