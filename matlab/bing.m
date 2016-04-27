clear;

data = csvread('./../csv/bing.csv', 0, 1, [0 1 999 1]);
figure(1); clf;
histogram(data, 200)
xlabel('Time to Respond (ms)')
ylabel('Frequency')
title('Histogram Relating the Frequency of Response Times for Bing Search')
print -depsc bingraw
print('bingraw', '-dpdf')

datanormal = log10(data);
figure(2); clf;
histogram(datanormal, 200)
xlabel('Log10 of Time to Respond (ms)')
ylabel('Frequency')
title('Histogram Relating the Frequency of Log10 Response Times for Bing Search')
print -depsc bingnorm
print('bingnorm', '-dpdf')

actualmean = mean(data);
mean = mean(datanormal);
actualstd = std(data);
std = std(datanormal);

leftone = mean-std;
lefttwo = mean-2*std;
leftthree = mean-3*std;

rightone = mean+std;
righttwo = mean+2*std;
rightthree = mean+3*std;
rightfour = mean+4*std;

outsideoneleft = length(filterData(datanormal, -999, leftone));
outsidetwoleft = length(filterData(datanormal, -999, lefttwo));
outsidethreeleft = length(filterData(datanormal, -999, leftthree));

outsideoneright = length(filterData(datanormal, rightone, 999));
outsidetworight = length(filterData(datanormal, righttwo, 999));
outsidethreeright = length(filterData(datanormal, rightthree, 999));
outsidefourright = length(filterData(datanormal, rightfour, 999));

onedev = length(filterData(datanormal, leftone, rightone))/1000;
twodev = length(filterData(datanormal, lefttwo, righttwo))/1000;
threedev = length(filterData(datanormal, leftthree, rightthree))/1000;

sorted = sort(datanormal);
ninety = 10^(sorted(900));
ninetyfive = 10^(sorted(950));
ninetynine = 10^(sorted(990));