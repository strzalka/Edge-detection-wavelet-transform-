width=4;
ssq=1;

[x,y]=meshgrid(-width:0.1:width,-width:0.1:width);
dgau2D=-x.*exp(-(x.*x+y.*y)/(2*ssq))/(pi*ssq);
surf(dgau2D);