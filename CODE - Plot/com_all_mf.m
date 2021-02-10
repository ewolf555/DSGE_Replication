clear all;
close all;

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_mf_delta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_df_delta.mat');
com_igp_df_delta = com_igp_df;
com_igp_mf_delta = com_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_mf_theta.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_df_theta.mat');

figure;orient landscape
subplot(2,1,1);
plot(com_igp_mf(1:99),'or');
hold on;
plot(com_igp_df(1:99),'db');
title('The Role of Price Stickiness');
plot(75,com_igp_mf(75),'.r','MarkerSize',30);
plot(75,com_igp_df(75),'.b','MarkerSize',30);
hold off;
xlabel('\theta');
xlim([1 99]);
ylim([-0.2 2]);
set(gca,'XTickLabel',0.1:0.1:1)

subplot(2,1,2);
plot(com_igp_mf_delta(1:100),'or');
hold on;
plot(com_igp_df_delta(1:100),'db');
title('The Role of Shock Persistence');
plot(50,com_igp_mf_delta(50),'.r','MarkerSize',30);
plot(50,com_igp_df_delta(50),'.b','MarkerSize',30);
hold off;
xlabel('\delta');
xlim([1 100]);
ylim([-0.2 2]);
set(gca,'XTickLabel',0.1:0.1:1)

suptitle('G Increase - Fiscal Multipliers')

print('-bestfit','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/compare_com','-dpdf');