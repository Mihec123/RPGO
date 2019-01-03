%demo

% to bi bil lahko dodatek ?
%izraèun koeficientov pri razvoju v taylorja od polinoma p glede na toèki x0,y0
% a = polyToTaylor( p , x0, y0)

%koeficienti taylorja glede na 
a = [00 01 02;
    10 11 NaN;
    20 NaN NaN];

u = 1;
v = 2;

p = evaluatePoly(a,u,v);

