%demo

%TODO ne sam v eni ampak v veèih toèkah

U = [10 100 0.0999 0.0001];

kontrolne_tocke;
%kontrolne_tocke_d2;

vr_MBB = bezier4_mbb(Bx,By,Bz,Bt,U)
vr_BB  = bezier4(Bx,By,Bz,Bt,U)

no = norm(vr_MBB - vr_BB)