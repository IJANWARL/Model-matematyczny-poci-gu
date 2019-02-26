function [wykres] =  Funkcja(F,mt,zakres,luz,okres,wybor,kp,kd,ki)

    %Newag Dragon

    F=F*1000;
    mt=mt*1000;
    
    if wybor==2
        F=linspace(0,F,zakres*10);
    elseif wybor==3
        F=F*sin(0:((2*okres*pi)/(10*zakres)):2*okres*pi);
    else
         F=zeros(1,zakres*10)+F;
    end
    

    g = 9.80665;          %przyspieszenie ziemskie
    f = 5e-2;               %wpsó³czynnika tarcia ttocznego stal o stal
    R = 0.94;               %œrednica ko³a poci¹gu
    k = 2;                   %wspó³czynnik sprê¿ystoœci
    b = 2000;              %wspó³czynnik t³umienia

    ml = 1.19e5;          %masa lokomotywy
    Nl = ml*g;             %si³a nacisku logomotywy
    Ftl = f*Nl/R;          %si³a tarcia tocznego lokomotywy

    mpw = 2e4;            %masa pustego wagonu
    mw = mt+mpw;       %masa wagonu
    Nw = mw*g;           %si³a nacisku logomotywy
    Ftw = f*Nw/R;        %si³a tarcia tocznego lokomotywy

    dokladnosc=100;
    tt = linspace(0,0.1,dokladnosc+1);


    wykres = zeros(zakres*10,8);
    
    c=0;
    d=0;
    y=0;
    
    for i = 2:zakres*10
         
        if (F(i)-y)*kp-Ftl-Ftw<0
             r=0;
             Stw=0;
             Stl=0;
         else
              r=F(i);
              Stw=Ftw;
              Stl=Ftl;
         end

         %PID
         
         e = r - y;
         
         u = kp*e + ki*c + kd*d;         
         
        [f] = rownania(k,b,ml,mw,u,Stw,Stl);
        [t,x] = ode45(f,tt,[wykres(i-1,1) wykres(i-1,2) wykres(i-1,3) wykres(i-1,4) wykres(i-1,5) wykres(i-1,6) wykres(i-1,7) wykres(i-1,8)]);

        wykres(i,1)=x(dokladnosc,1);
        wykres(i,2)=x(dokladnosc,2);
        wykres(i,3)=x(dokladnosc,3);
        wykres(i,4)=x(dokladnosc,4);
        wykres(i,5)=x(dokladnosc,5);
        
        yyf=zeros(1,dokladnosc+1);
        
        for j = 1:dokladnosc+1
            yyf(1,j)=x(j,5);
        end
        
         yf=calka(tt,yyf);
         cf=calka(tt,e-yf);
         df=pochodna(tt,e-yf);
         
         y = yf(1,dokladnosc+1);
         c = cf(1,dokladnosc+1);
         d = df(1,dokladnosc-1);      

        if wykres(i,1)-wykres(i,2)>luz
            wykres(i,2)=wykres(i,1)+luz;
        elseif wykres(i,1)-wykres(i,2)<0
            wykres(i,2)=wykres(i,1);
        end

        if wykres(i,2)-wykres(i,3)>luz
            wykres(i,3)=wykres(i,2)+luz;
        elseif wykres(i,2)-wykres(i,3)<0
            wykres(i,3)=wykres(i,2);
        end

       if wykres(i,3)-wykres(i,4)>luz
            wykres(i,4)=wykres(i,3)+luz;
        elseif wykres(i,3)-wykres(i,4)<0
            wykres(i,4)=wykres(i,3);
       end
            
       
    end

    
     for i = 1:zakres*10
    
        wykres(i,2)=wykres(i,2)-25;
        wykres(i,3)=wykres(i,3)-50;
        wykres(i,4)=wykres(i,4)-75;
      
     end  
    
    
end


