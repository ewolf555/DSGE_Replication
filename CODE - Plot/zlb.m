clear all;
close all;

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_benchmark.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_igp_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_tax_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_igp_df.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_tax_df.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/names_zlb.mat');

zlb_benchmark = 100*zlb_benchmark;

zlb_igp_mf = 100*zlb_igp_mf;
zlb_tax_mf = 100*zlb_tax_mf;

zlb_igp_df = 100*zlb_igp_df;
zlb_tax_df = 100*zlb_tax_df;

figure;orient landscape
for i=1:1:11
subplot(4,3,i);
plot(zlb_benchmark(i,1:22),'x-k');
hold on;
plot(zlb_igp_mf(i,1:22),'-or');
plot(zlb_igp_df(i,1:22),'-bd');
hold off;
title(names_zlb(i));
xlim([0 16])

if i == 1
legend('No response','MF','DF','Location','southeast')
end

end
subplot(4,3,12)
plot(zlb_benchmark(12,1:22),'x-m');
title(names_zlb(12));
xlim([0 16])
suptitle('Increase in Government Purchases - Liquidity Trap');

print('-fillpage','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/igp_LT','-dpdf')


figure;orient landscape
for i=1:1:11
subplot(4,3,i);
plot(zlb_benchmark(i,1:22),'x-k');
hold on;
plot(zlb_tax_mf(i,1:22),'-or');
plot(zlb_tax_df(i,1:22),'-bd');

hold off;
title(names_zlb(i));
xlim([0 16])

if i == 1
legend('No response','MF','DF','Location','southeast')
end
end
subplot(4,3,12)
plot(zlb_benchmark(12,1:22),'x-m');
title(names_zlb(12));
xlim([0 16])
suptitle('Tax Cut - Liquidity Trap');

print('-fillpage','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/tax_LT','-dpdf')
