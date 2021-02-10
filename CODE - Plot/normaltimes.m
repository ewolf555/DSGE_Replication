clear all;
close all;

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/igp_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/tax_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/igp_df.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/tax_df.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/names.mat');

figure;orient landscape

for i=1:1:11
subplot(4,3,i);
plot(igp_mf(i,1:22),'-or');
hold on;
plot(igp_df(i,1:22),'-db');
title(names(i));

xlim([0 16])
ylim([min(min(igp_mf(i,1:22)),min(igp_df(i,1:22)))-0.25 max(max(igp_mf(i,1:22)),max(igp_df(i,1:22)))+0.25])

if i == 1
legend('mf','df','Location','northeast');

end
end;
suptitle('Increase in Government Purchases - Normal Times');

print('-fillpage','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/Picture/igp_nt','-dpdf')


figure;orient landscape

for i=1:1:11
subplot(4,3,i);
plot(tax_mf(i,1:22),'-or');
hold on;
plot(tax_df(i,1:22),'-db');
title(names(i));

xlim([0 16])
ylim([min(min(tax_mf(i,1:22)),min(tax_df(i,1:22)))-0.25 max(max(tax_mf(i,1:22)),max(tax_df(i,1:22)))+0.25]);
if i == 1
legend('mf','df','Location','northeast');
end
end;
suptitle('Tax Cut - Normal Times');

print('-fillpage','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/Picture/tax_nt','-dpdf')

