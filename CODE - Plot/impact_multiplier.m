% Plot Impact Muliplier 
close all;
clear all;


load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_0.mat');
mf_0 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_2.mat');
mf_2 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_3.mat');
mf_3 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_4.mat');
mf_4 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_5.mat');
mf_5 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_6.mat');
mf_6 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_7.mat');
mf_7 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_8.mat');
mf_8 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_9.mat');
mf_9 = impact_zlb_igp_mf;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_mf_10.mat');
mf_10 = impact_zlb_igp_mf;

mf = [mf_0 mf_0 mf_2 mf_3 mf_4 mf_5 mf_6 mf_7 mf_8 mf_9 mf_10];

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_0.mat');
df_0 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_2.mat');
df_2 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_3.mat');
df_3 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_4.mat');
df_4 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_5.mat');
df_5 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_6.mat');
df_6 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_7.mat');
df_7 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_8.mat');
df_8 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_9.mat');
df_9 = impact_zlb_igp_df;
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/resultsIM/impact_zlb_igp_df_10.mat');
df_10 = impact_zlb_igp_df;

df = [df_0 df_0 df_2 df_3 df_4 df_5 df_6 df_7 df_8 df_9 df_10];

b = [0:10];

figure;
stairs(b,mf,'-or');
hold on;
stairs(b,df,'-db');
h = refline([0 1]);
h.Color = 'k';
legend('mf','df',' 1 to 1 - Effect','Location','SouthOutside','Orientation','horizontal');
axes('position',[.25 .5 .25 .25]);
box on;
indexOfInterest = (b > 1) & (b < 5);
stairs(b(indexOfInterest),mf(indexOfInterest),'-or');
hold on;
stairs(b(indexOfInterest),df(indexOfInterest),'-db');
h = refline([0 1]);
h.Color = 'k';
title('Highlight Shock Period 2-4')
axis tight;



print('-bestfit','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/impact_om','-dpdf')



