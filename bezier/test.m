%test
t = 0.5;
B = [0 0; 1 2; 3 3; 4 -1; 0 2];
b = bezier(B,linspace(0,1,10000));

k= 6;
BS = beziersub(B,t,k);
B1 = [];
for i = 1:2^k
B1 = [B1;BS{end,i}];
end
r = RazdaljaTockKrivulja( B1,b )