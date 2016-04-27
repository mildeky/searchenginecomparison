clear;

google = csvread('./../csv/google.csv', 0, 1, [0 1 999 1]);
bing = csvread('./../csv/bing.csv', 0, 1, [0 1 999 1]);
aol = csvread('./../csv/aol.csv', 0, 1, [0 1 999 1]);
yahoo = csvread('./../csv/yahoo.csv', 0, 1, [0 1 999 1]);

figure(1);
subplot(2,2,1), histogram(google, 200);
title('Google Raw Data')
xlabel('Response Time (ms)')
ylabel('Frequency')
hold on
subplot(2,2,2), histogram(bing, 200);
title('Bing Raw Data')
xlabel('Response Time (ms)')
ylabel('Frequency')
subplot(2,2,3), histogram(aol, 200);
title('AOL Raw Data')
xlabel('Response Time (ms)')
ylabel('Frequency')
subplot(2,2,4), histogram(yahoo, 200);
title('Yahoo Raw Data')
xlabel('Response Time (ms)')
ylabel('Frequency')
hold off
print -depsc multiplegraphsraw
print('multiplegraphsraw', '-dpdf')

figure(2);
subplot(2,2,1), histogram(log10(google), 200);
title('Google Normalized Data')
xlabel('Log10 of Response Time (ms)')
ylabel('Frequency')
hold on
subplot(2,2,2), histogram(log10(bing), 200);
title('Bing Normalized Data')
xlabel('Log10 of Response Time (ms)')
ylabel('Frequency')
subplot(2,2,3), histogram(log10(aol), 200);
title('AOL Normalized Data')
xlabel('Log10 of Response Time (ms)')
ylabel('Frequency')
subplot(2,2,4), histogram(log10(yahoo), 200);
title('Yahoo Normalized Data')
xlabel('Log10 of Response Time (ms)')
ylabel('Frequency')
hold off
print -depsc multiplegraphsnorm
print('multiplegraphsnorm', '-dpdf')