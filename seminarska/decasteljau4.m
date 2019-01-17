function b = decasteljau4( B,P )
%S pomoèjo rezcveta (blossom4) funkcija izraèuna vrednost Bezierjeve
%krivulje s koef. B v toèki P. P mora biti podana v baricentriènih
%koordinatah.

[n,~,~]=size(B);
U=zeros(n-1,4);
for i=1:n-1
   U(i,:)=P; 
end
b=blossom4(B,U);
end

