clear all;
close all;

load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/sig_igp_mf.mat');
load('/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/names.mat');

 

figure;orient landscape

for i=1:1:11
subplot(4,3,i);
plot(sig_igp_mf(i,1:22,1),'.-');
hold on;

for j = 2:4:10
    plot(sig_igp_mf(i,1:22,j),'.-');
    
end
hold off;
title(names(i));

if i == 1
legend('\sigma = 0.5','\sigma = 1','\sigma = 3','\sigma = 5','Location','northeast');
end

xlim([0 16])

if i == 1
ylim([-0.15 1.5])
end
if i == 2
ylim([-0.05 0.5])
end
if i == 3
ylim([-1 0.1])
end
if i == 4
ylim([-0.2 2])
end
if i == 5
ylim([-0.1 1])
end
if i == 6
ylim([-0.2 0.8])
end
if i == 7
ylim([-0.5 0.5])
end
if i == 8
ylim([-1.5 0.1])
end
if i == 9
ylim([-0.5 1.1])
end
if i == 10
ylim([0 1])
end
if i == 11
ylim([-0.5 0.5])
end

end

%suptitle('Increase in Government Purchases - Normal Times - Change \sigma');

print('-fillpage','/Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/picture/sigma_igp_mf','-dpdf')


