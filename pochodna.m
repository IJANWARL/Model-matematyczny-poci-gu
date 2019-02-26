function d = pochodna(x,y)
Lx = length(x);
dx = x(3:Lx)-x(2:Lx-1);
dy = y(3:Lx)-y(2:Lx-1);
d = [NaN dy./dx NaN];
end