// ZLB - Benchmark

var
yV          (long_name='output')
cV          (long_name='consumption')
gV          (long_name='government purchases')
xiV         (long_name='xi')
RV          (long_name='nominal rate')
RV_taylor   (long_name='nominal interest rate Taylor rule')  
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
rrV_ann     (long_name='ann. real rate')
pieyoyV_ann (long_name='ann. inflation(yoy)')
rhoV_ann    (long_name='ann. preference shock')
byoyV       (long_name='debt (yoy)')
;

varexo
epstV epsgV gammaV
;

parameters
beta varphi alpha theta Mp Mw varkappa eta nu psib bss delta sigma lambda epsilonp rho rpie
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
sigma = 1;
epsilonp = Mp / (Mp - 1);
lambda = ((1-theta) * (1-beta*theta) * (1 - alpha))/(theta * (1-alpha+alpha*epsilonp));
rho = 0.005;
rpie = 1.5;




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
0 = (RV - log(beta)) * (lV - cV + eta * RV);

RV = max(log(beta), RV_taylor);

// 7
lV(-1) = lV + pieV - deltamV;

// Government debt
// 8
bV = (1+rho-psib)*bV(-1) + bss*(1+rho)*(RV(-1)-pieV) + gV - tstarV - varkappa*deltamV;
// yoy
byoyV = bV/4;


// Taxes
// 9
tV = psib*bV(-1) + tstarV;

// Financing
// 10 DF
//0 = (RV-log(beta)) * pieV;

// Shock gov
// 12
gV =  epsgV;

// Shock tax
// 13
tstarV = - epstV;

// real interest rate
rrV = RV - pieV(+1); 

// rhoV
rhoV = gammaV;

// inflation yoy
pieyoyV = (pieV(-3) + pieV(-2) + pieV(-1) + pieV) / 4;

pieyoyV_ann = 4*pieyoyV;

// debt output ratio
byrV = byoyV - yV;

// Taylor rule
RV_taylor=rhoV+rpie*pieV;

rrV_ann = 4*rrV+0.02;

pieV_ann =4*pieV;

RV_ann  = (4*RV)+0.02;

rhoV_ann = (4*rhoV)+0.02;
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
gammaV = 0;
lV = 0;
pieV = 0;
muV = 0;
tV = 0;
rrV = 0;
RV_taylor = 0;
RV_ann = 0;
rrV_ann = 4*rrV;
pieV_ann =4*pieV;

RV_ann  = 4*RV;

rhoV_ann = 4*rhoV;
end;

shocks;
var gammaV;
periods 1:1;
values -0.01; 



var epsgV;
periods 1:1;
values 0;

var epstV;
periods 1:6;
values 0;
end;

steady;
check;

simul(periods=200);

zlb_benchmark = [oo_.endo_simul(strmatch('yV',M_.endo_names,'exact'),2:2)]

save /Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/zlb_benchmark_1 zlb_benchmark

