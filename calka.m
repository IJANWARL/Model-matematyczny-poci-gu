function c = calka(x,y)
Lx = length(x);
c=zeros(1,Lx);
for i = 2:Lx
    c(1,i) = c(1,i-1) + (y(1,i) + y(1,i-1)) * (x(1,i) - x(1,i-1))/2;
end
end

