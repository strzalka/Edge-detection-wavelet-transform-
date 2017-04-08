function y=psi(axis,a,h)
v=[1 1; 1 1]/4;
d1=[0 0 0; 0 1 -1; 0 0 0]/2;
d2=[0 0 0; 0 1 0; 0 -1 0]/2;
d3=[0 0 0; 0 1 0; 0 0 -1]/2;
d4=[0 0 0; 0 1 0; -1 0 0]/2;
d=eval(['d' '0'+axis]);
if h>0
y=d;
for i=1:h-1
y=conv2(y,d);
end
else
y=v;
a=a-1;
end
for i=1:a
y=conv2(y,v);
end
end