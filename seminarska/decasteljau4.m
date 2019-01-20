function b = decasteljau4( B,P )
%AVTORJA: ANDRA? NAGLI?, JAN GOLOB
%S pomo?jo rezcveta (blossom4) funkcija izra?una vrednost Bezierjeve
%krivulje s koef. B v to?ki P. P mora biti podana v baricentri?nih
%koordinatah.

[n,~,~]=size(B);
U=zeros(n-1,4);
for i=1:n-1
   U(i,:)=P; 
end
b=blossom4(B,U);
end

