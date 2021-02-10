clear all;
close all;

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/welfare_zlb_benchmark.mat');
welfare_zlb_benchmark_small = welfare_zlb_benchmark*100;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/welfare_zlb_igp_df_small.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/welfare_zlb_igp_mf_small.mat');
welfare_zlb_igp_mf_small = welfare_zlb_igp_mf_small*100;
welfare_zlb_igp_df_small = welfare_zlb_igp_df_small*100;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/welfare_igp_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/welfare_igp_df.mat');

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_benchmark.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_igp_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/zlb_igp_df.mat');

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/igp_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/igp_df.mat');


figure;orient landscape
subplot(1,2,1);

plot(welfare_igp_mf(1:22),'-or');
hold on;
plot(welfare_igp_df(1:22),'-db');
title('G increase: Normal Times');
xlim([0 16]);
legend('MF','DF','Location','southeast');
ylim([min(welfare_zlb_benchmark_small)-0.2 0.2])

subplot(1,2,2);
plot(welfare_zlb_igp_mf_small(1:22),'-or');
hold on;
plot(welfare_zlb_igp_df_small(1:22),'-db');
plot(welfare_zlb_benchmark_small(1:22),'-kx');
title('G increase: Liquidity Trap');
xlim([0 16]);
ylim([min(welfare_zlb_benchmark_small)-0.2 0.2])
legend('MF','DF','No response','Location','southeast');

print('-bestfit','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/welfare_all','-dpdf')


%Loss - Liquidity Trap
y_bench = zlb_benchmark(1,:);
pie_bench = zlb_benchmark(4,:);
y_mf = zlb_igp_mf(1,:);
pie_mf = zlb_igp_mf(4,:);
y_df = zlb_igp_df(1,:);
pie_df = zlb_igp_df(4,:);

loss_bench_small = (y_bench.^2*0.03 + pie_bench.^2)*100;
loss_mf_small = (y_mf.^2*0.03 + pie_mf.^2)*100;
loss_df_small = (y_df.^2*0.03 + pie_df.^2)*100;


loss_bench_med = (y_bench.^2*0.5 + pie_bench.^2)*100;
loss_mf_med = (y_mf.^2*0.5 + pie_mf.^2)*100;
loss_df_med = (y_df.^2*0.5 + pie_df.^2)*100;


loss_bench_big = (y_bench.^2*0.8 + pie_bench.^2)*100;
loss_mf_big = (y_mf.^2*0.8 + pie_mf.^2)*100;
loss_df_big = (y_df.^2*0.8 + pie_df.^2)*100;



figure;orient landscape

subplot(1,3,1);
plot(loss_mf_small(1:16),'-or');
hold on;
plot(loss_df_small(1:16),'-db');
plot(loss_bench_small(1:16),'-kx');
legend('mf','df','No response','Location','northeast');
title('Low');
xlim([0 16]);
ylim([0 2]);

subplot(1,3,2);
plot(loss_mf_med(1:16),'-or');
hold on;
plot(loss_df_med(1:16),'-db');
plot(loss_bench_med(1:16),'-kx');
title('Medium');
xlim([0 16]);
ylim([0 2]);

subplot(1,3,3);
plot(loss_mf_big(1:16),'-or');
hold on;
plot(loss_df_big(1:16),'-db');
plot(loss_bench_big(1:16),'-kx');
title('High');
xlim([0 16]);
ylim([0 2]);


print('-bestfit','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/loss_LT','-dpdf')



%Loss - Normal Times
y_mf = igp_mf(1,:);
pie_mf = igp_mf(4,:);
y_df = igp_df(1,:);
pie_df = igp_df(4,:);


loss_mf_small = y_mf.^2*0.3 + pie_mf.^2;
loss_df_small = y_df.^2*0.3 + pie_df.^2;


loss_mf_med = y_mf.^2*0.5 + pie_mf.^2;
loss_df_med = y_df.^2*0.5 + pie_df.^2;


loss_mf_big = y_mf.^2*0.8 + pie_mf.^2;
loss_df_big = y_df.^2*0.8 + pie_df.^2;



figure;orient landscape
subplot(1,3,1);

plot(loss_mf_small(1:16),'-or');
hold on;
plot(loss_df_small(1:16),'-db');
legend('mf','df','Location','northeast');
title('Low');
xlim([0 16]);
ylim([0 4.5]);

subplot(1,3,2);
plot(loss_mf_med(1:16),'-or');
hold on;
plot(loss_df_med(1:16),'-db');
title('Medium');
xlim([0 16]);
ylim([0 4.5]);

subplot(1,3,3);
plot(loss_mf_big(1:16),'-or');
hold on;
plot(loss_df_big(1:16),'-db');
title('High');
xlim([0 16]);
ylim([0 4.5]);

print('-bestfit','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/loss_NT','-dpdf')
