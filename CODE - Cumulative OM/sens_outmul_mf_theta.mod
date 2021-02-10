com_tax_mf = zeros(200,1);
com_igp_mf = zeros(200,1);
com_igp_mf_2 = zeros(200,1);
com_igp_mf_3 = zeros(200,1);

for i=0.01:0.01:0.99;

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
theta = i;
Mp = 1.125;
Mw = 1.28;
varkappa = 1/3;
eta = 7;
nu = 0;
psib = 0.02;
bss = 2.4;
delta = 0.5;
sigma = 1;
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
muV = xiV - ((alpha + varphi) / (1 - alpha)) * yV;

// Money Demand
// 6 
lV = cV - eta * RV;

// 7
lV(-1) = lV + pieV - deltamV;

// Government debt
// 8
bV = (1+rho-psib)*bV(-1) + bss*(1+rho)*(RV(-1)-pieV) + gV - tstarV - varkappa*deltamV;

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

index = int8(i*100);
com_igp_mf(index) = (1-delta)*max(cumsum(yV));
com_igp_mf_2(index) = max(cumsum(yV))/max(cumsum(gV));
com_igp_mf_3(index) = sum(yV)/sum(gV);

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
values 0;

var epstV;
periods 1:1;
values 1;
end;

steady;
check;

simul(periods=200);

index = int8(i*100);
com_tax_mf(index) = (1-delta)*max(cumsum(yV));


end;

save /Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_tax_mf_theta com_tax_mf
save /Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_mf_theta com_igp_mf