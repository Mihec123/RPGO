function vr = MBB_tetra( c, U )
%   MBB_tetra  izraèuna  vrednost polinoma treh spremenljivk v modificirani
%   Bernstein-Bezier obliki
% Vhodna  podatka:
%   c   celica  velikosti n+1 x n+1 x n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  treh  spremenljivk  stopnje n v
%       modificirani Bernstein-Bezier  obliki 
%   U   baricentricne koordinate tocke v kateri racunamo vrednost polinoma
%
%   Izhodni  podatek:
%   vr   vrednost  polinoma v baricentricnih koordinatah U

r = U(1);
s = U(2);
t = U(3);
u = U(4);

n = length(c)-1;

ru = r/u;
su = s/u;
tu = t/u;

A = c(n+1,1,1,1);
for i = 1:n
    B = c(n-i+1,i+1,1,1);
    for j = 1:i
        C = c(d-i+1,i-j+1,j+1,1);
        for k = 1:j
            C = C * tu + c(d-i+1,i-j+1,j-k+1,k+1);
        end
        B = B * su + C;
    end
    A = A * ru + B;
end

vr = A * u^n;

