function u = parametrizacija(B,alfa,param)
%naredimo alfa parametrizacijo pri parametru alfa in to?kah B
%alfa = 0 enakomerna
%alfa = 1 tetivna
%alfa = 1/2 centripetalna
%param =  1 kvadrati?ni zlepki
%param = 2 kubi?ni zlepki

A = size(B);
d = A(2);
n = A(1);
if param == 1
    m = n-2;
else
    m = n-3;
end

u = zeros(1,m+1);
u(1) = 0;
u(2) = u(1) + norm(B(3,:)-B(1,:))^alfa;
for i = 2:m-1
    u(i+1) = u(i) + norm(B(i+1)-B(i))^alfa;
end
u(end) = u(end-1) + norm(B(end,:)-B(end-2,:))^alfa;



end

