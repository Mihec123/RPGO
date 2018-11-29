function w1 = spremembaQ(B,w,param,tocka)
% Opis:
%   spremembaQ  izvede  premik ene Farinove tocke q tako da ostale pusti na
%   mestu. Torej dobimo novi = q_stari pri cemer velja              
%   q_novi(param+1) = tocka
%
% Definicija:
%   w1 = spremembaQ(B,w,param,tocka)
%
% Vhodna  podatka:
%   B   matrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  tocko
% Bezierjeve  krivulje  stopnje n,
%   w   utezi racionalne krivulje
%   param   pove na katerem odseku kontorlnega polinoma smo kjer 
% se stevilcenje zacne z 0 (0<= param <= n-1)
%   tocka   nam doloca nove koordinate q na odseku param
%
% Izhodni  podatek:
%   w1    matrika  velikosti (n+1) x 1, v kateri vsaka komponenta
%   predstavlja utezi popravljene racionalne bezierjeve krivulje tako da
%   dobimo zelene tocke q

A = size(B);
n = A(1)-1;

if param>n-1
    msg = 'parameter param je vecji od n-1';
    error(msg);
end

%preverimo ce tocka res lezi na kontrolnem poligonu
if B(param+1,1) ~= B(param+1+1,1)
    k = (B(param+1+1,2)-B(param+1,2))/(B(param+1+1,1)-B(param+1,1));
    m = tocka(1,2) - k*tocka(1,1);
    if (tocka(1,1) < B(param+1,1) && tocka(1,1) < B(param+1+1,1)) || (tocka(1,1) > B(param+1+1,1) && tocka(1,1) > B(param+1,1)) || abs((k*B(param+1,1)+m)-B(param+1,2)) > 1e-6 || abs((k*B(param+1+1,1)+m)-B(param+1+1,2)) > 1e-6 
        %preverimo ce x kordinata manjsa od obeh kotrolnih tock B ali pa ce
        %vecja od obeh ali ce ni na premici
        msg = 'tocka ne lezi na kontrolnem poligonu na odseku param';
        error(msg);
    end
else
    if tocka(1,1) ~= B(param+1,1) || (tocka(1,2) < B(param+1,2) && tocka(1,2) < B(param+1+1,2)) || (tocka(1,2) > B(param+1+1,2) && tocka(1,2) > B(param+1,1))
        msg = 'tocka ne lezi na kontrolnem poligonu na odseku param';
        error(msg);
    end
end
%konec preverjanja vhodnih podatkov

q = zeros(n,2);

for i =0:n-1  
    q(i+1,:) = w(i+1)/(w(i+1)+w(i+1+1)).*B(i+1,:) + w(i+1+1)/(w(i+1)+w(i+1+1)).*B(i+1+1,:);  
end


w1 = w;
%zacnemo na koncu poravljanja ker vsak q vpliva na sebe in engea prejsnega
%delamo za eno od koordinat x ali y za tisto katero lahko napisemo encabo v eksplicitni obliki
%tako da ne delimo z 0 npr. w_nov =
%w(i,1)*(q(i,1)-B(i+1,1))/(B(i,1)-q(i,1)), ter v prvem koraku namesto q
%uporabljamo tocko ker hocemo da je nov q ima tisto tocko
for i = param:-1:0
    if i == param
        if B(param+1,1) ~= B(param+1+1,1)
            wtemp = w1(i+1+1)*(tocka(1,1)-B(i+1+1,1))/(B(i+1,1)-tocka(1,1));
            w1(i+1) = wtemp;
        else
            wtemp = w1(i+1+1)*(tocka(1,2)-B(i+1+1,2))/(B(i+1,2)-tocka(1,2));
            w1(i+1) = wtemp;
        end
    else
        if B(param+1,1) ~= B(param+1+1,1)
            wtemp = w1(i+1+1)*(q(i+1,1)-B(i+1+1,1))/(B(i+1,1)-q(i+1,1));
            w1(i+1) = wtemp;
        else
            wtemp = w1(i+1+1)*(q(i+1,2)-B(i+1+1,2))/(B(i+1,2)-q(i+1,2));
            w1(i+1) = wtemp;
        end
    end        
end
      

end

