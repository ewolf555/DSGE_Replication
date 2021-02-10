for i=0.5:0.5:5;

var
yV          (long_name='output')
cV          (long_name='consumption')
gV          (long_name='government purchases')
xiV         (long_name='xi')
RV          (long_name='nominal rate')
deltamV     (long_name='money growth')
bV          (long_name='debt')
tstarV      (long_name='t-shock')
rhoV        (long_name='preference shock')
lV          (long_name='real money')
pieV        (long_name='inflation(qar)')
pieyoyV     (long_name='inflation(yoy)')
muV         (long_name='mu')
tV          (long_name='taxes')
rrV         (long_name='real rate')
byrV        (long_name='debt-output ratio')
RV_ann      (long_name='ann. nominal rate')
pieV_ann    (long_name='ann. inflation(qar)')
rrV_ann     (long_name='real rate annualized')
//bV_ann      (long_name='ann. debt')
pieyoyV_ann (long_name='ann. inflation(yoy)')
deltamyoyV  (long_name='money growth (yoy)')
byoyV       (long_name='debt (yoy)')
byryoyV
;

varexo
epstV epsgV
;

parameters
beta varphi alpha theta Mp Mw varkappa eta nu psib bss delta sigma lambda epsilonp rho
;

beta = 0.995;
varphi = 5;
alpha = 0.25;
theta = 0.75;
Mp = 1.125;
Mw = 1.28;
varkappa = 1/3;
eta = 7;
nu = 0;
psib = 0.02;
bss = 2.4;
delta = 0.5;
sigma = i;
epsilonp = Mp / (Mp - 1);
lambda = ((1-theta) * (1-beta*theta) * (1 - alpha))/(theta * (1-alpha+alpha*epsilonp));
rho = 0.005;


model;

// 1
yV = cV + gV;

// New IS
// 2
xiV = xiV(+1) + (RV - pieV(+1) - rhoV);
// 3
xiV = -sigma * cV + nu * lV;

// New Phillips
// 4
pieV = beta * pieV(+1) - lambda * muV; 
// 5
muV = xiV - ((alpha+varphi) / (1-alpha)) * yV;

// Money Demand
// 6 
lV = cV - eta * RV;

// 7
lV(-1) = lV + pieV - deltamV;

// Government debt
// 8
bV = (1+rho-psib)*bV(-1) + bss*(1+rho)*(RV(-1)-pieV) + gV - tstarV - varkappa*deltamV;

// year on year
//byoyV = (1+rho-psib)*byoyV(-1) + bss*(1+rho)*(RV_ann(-1)-pieyoyV_ann) + gV - tstarV - varkappa*deltamyoyV;

// Taxes
// 9
tV = psib*bV(-1) + tstarV;

// Financing
// 10 MF
deltamV = (1/varkappa) * (gV-tstarV + bss*(1+rho)*(RV(-1)-pieV));

// debt
// 12
gV = delta*gV(-1) + epsgV;

// taxes star
// 13
tstarV = delta * tstarV(-1) - epstV;

// real interest rate
rrV = RV - pieV(+1); 

// rhoV
rhoV = 0;

// inflation yoy
pieyoyV = (pieV(-3) + pieV(-2) + pieV(-1) + pieV) / 4;

// debt output ratio
byrV = bV - yV;

// spending multiplier
// ??

RV_ann = 4*RV;

pieV_ann = 4*pieV;

rrV_ann = 4*rrV;

pieyoyV_ann = 4*pieyoyV;

deltamyoyV = (deltamV(-3) + deltamV(-2) + deltamV(-1) + deltamV) / 4;

byryoyV = byoyV -yV;
byoyV = bV / 4;

end;



initval;
yV = 0;
cV = 0;
gV = 0;
xiV = 0;
RV = 0;
deltamV = 0; 
bV = 0;
tstarV = 0;
rhoV = 0;
lV = 0;
pieV = 0;
muV = 0;
tV = 0;
rrV = 0;
rhoV= 0;
pieyoyV = 0;
end;

shocks;
var epsgV;
periods 1:1;
values 1;

var epstV;
periods 1:1;
values 0;
end;

steady;
check;

simul(periods=200);



%gali_names = ['yV'; 'cV'; 'rrV_ann'; 'pieV_ann'; 'pieyoyV'; 'RV_ann'; 'bV'; 'byrV'; 'deltamV'; 'gV'; 'tV']


igp_mf = [oo_.endo_simul(strmatch('yV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('cV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('rrV_ann',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('pieV_ann',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('pieyoyV_ann',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('RV_ann',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('byoyV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('byryoyV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('deltamV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('gV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('tV',M_.endo_names,'exact'),2:30)];

sig_igp_mf(:,:,int8(2*i)) = igp_mf;

%figure;
%for i=1:1:20
%subplot(4,5,i);
%plot(oo_.endo_simul(i,2:17),'-db');
%title(M_.endo_names_long(i,:));
%if i == 1
%legend('df','Location','northeast');
%end;
%end;
%suptitle('Increase in Government Purchases - (DF)');


shocks;
var epsgV;
periods 1:1;
values 0;

var epstV;
periods 1:1;
values 1;
end;

steady;
check;

simul(periods=200);

tax_mf = [oo_.endo_simul(strmatch('yV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('cV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('rrV_ann',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('pieV_ann',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('pieyoyV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('RV_ann',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('byoyV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('byryoyV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('deltamV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('gV',M_.endo_names,'exact'),2:30);...
            oo_.endo_simul(strmatch('tV',M_.endo_names,'exact'),2:30)];

sig_tax_mf(:,:,int8(2*i)) = tax_mf;

%figure;
%for i=1:1:20
%subplot(4,5,i);
%plot(oo_.endo_simul(i,2:17),'-db');
%title(M_.endo_names_long(i,:));
%if i == 1
%legend('df','Location','northeast');
%end;
%end;
%suptitle('Tax Cut - (DF)');

end;

save /Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/sig_tax_mf sig_tax_mf
save /Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/sig_igp_mf sig_igp_mf