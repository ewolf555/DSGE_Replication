clear all;
close all;

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_tax_mf_delta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_mf_delta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_tax_df_delta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_df_delta.mat');


figure;orient landscape
subplot(2,1,1);
plot(com_tax_mf(1:100),'or');
hold on;
plot(com_tax_df(1:100),'db');
plot(50,com_tax_mf(50),'.r','MarkerSize',30);
plot(50,com_tax_df(50),'.b','MarkerSize',30);
hold off;
legend('mf','df','Location','northwest');
xlabel('Delta');
title('Tax cut');
xlim([1 100]);
ylim([-0.2 1]);
set(gca,'XTickLabel',0.1:0.1:1)

subplot(2,1,2);
plot(com_igp_mf(1:100),'or');
hold on;
plot(com_igp_df(1:100),'db');
title('Increase in Government Purchases');
plot(50,com_igp_mf(50),'.r','MarkerSize',30);
plot(50,com_igp_df(50),'.b','MarkerSize',30);
hold off;
xlabel('Delta');
xlim([1 100]);
ylim([-0.2 2]);
set(gca,'XTickLabel',0.1:0.1:1)

suptitle('Fiscal Multipliers: The Role of Shock Persistence');

print('-bestfit','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/Fiscal Multipliers: The Role of Shock Persistence','-dpdf');