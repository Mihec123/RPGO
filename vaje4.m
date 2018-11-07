%vaje4 (naloga7 in naloga8)

alfa = 0;
P = [-4 1; -2 -1; 0 3; 3 0; 5 2];
ue = alphaparam(P,0)    % [0 1 2 3 4]
uc = alphaparam(P ,0.5) % [0  1.6818  3.7965  5.8563  7.5381]
ut = alphaparam(P,1)    % [0  2.8284  7.3006  11.5432  14.3716]


D = [-5,0;-4 1; -2 -1; 0 3; 3 0; 5 2;7,-1];


B = beziercubspline(uc,D);

plotzlepek( B,linspace(0,1));

%hocemo se pri nekem parametru u iz u_0 do u_m poiskat vrednost na tej
%krivulji