clear all;
close all;

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_tax_mf_theta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_mf_theta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_tax_df_theta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_df_theta.mat');


figure;orient landscape
subplot(2,1,1);
plot(com_tax_mf(1:99),'or');
hold on;
plot(com_tax_df(1:99),'db');
plot(75,com_tax_mf(75),'.r','MarkerSize',30);
plot(75,com_tax_df(75),'.b','MarkerSize',30);
hold off;
legend('mf','df','Location','northwest');
xlabel('Theta');
title('Tax cut');
xlim([1 99]);
ylim([-0.2 1]);
set(gca,'XTickLabel',0.1:0.1:1)

subplot(2,1,2);
plot(com_igp_mf(1:99),'or');
hold on;
plot(com_igp_df(1:99),'db');
title('Increase in Government Purchases');
plot(75,com_igp_mf(75),'.r','MarkerSize',30);
plot(75,com_igp_df(75),'.b','MarkerSize',30);
hold off;
xlabel('Theta');
xlim([1 99]);
ylim([-0.2 2]);
set(gca,'XTickLabel',0.1:0.1:1)

suptitle('Fiscal Multipliers: The Role of Price Stickiness');

print('-bestfit','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/Fiscal Multipliers: The Role of Price Stickness','-dpdf');