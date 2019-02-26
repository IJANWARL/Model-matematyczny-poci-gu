function [f] = rownania(k,b,ml,mw,F,Ftw,Ftl)

Cd = 0.6;               %wspó³czynnik si³y oporu
SD = 12.9750;         %powierzchnia rzutu cia³a na p³aszczyznê prostopad³¹ do wektora prêdkoœci cia³a
p = 1.2;                 % gêstoœæ powietrza
vw = 0;                  %prêdkoœæ wiatru od przodu poci¹gu

%   x(1)-x1       x(5)-v1
%   x(2)-x2       x(6)-v2
%   x(3)-x3       x(7)-v3
%   x(4)-x4       x(8)-v4



f = @(t,x) [x(5);
               x(6);
               x(7);
               x(8);
              (k*(x(2)-x(1))+b*(x(6)-x(5))+F-Ftl-((Cd*p*(x(5)+vw)^2)*SD/2))/ml;
              (k*(x(1)-x(2))+b*(x(5)-x(6))+k*(x(3)-x(2))+b*(x(7)-x(6))-Ftw)/mw*4;
              (k*(x(2)-x(3))+b*(x(6)-x(7))+k*(x(4)-x(3))+b*(x(8)-x(7))-Ftw)/mw*3;
              (k*(x(3)-x(4))+b*(x(7)-x(8))-Ftw)/mw*2];
end