clear;

dataone = csvread('./../csv/bing.csv', 0, 1, [0 1 999 1]);
datatwo = csvread('./../csv/aol.csv', 0, 1, [0 1 999 1]);

data = dataone-datatwo;
datanormal = data;

mean = mean(datanormal);
std = std(datanormal);

leftone = mean-std;
lefttwo = mean-2*std;
leftthree = mean-3*std;
leftfour = mean-4*std;
leftfive = mean-5*std;

rightone = mean+std;
righttwo = mean+2*std;
rightthree = mean+3*std;
rightfour = mean+4*std;
rightfive = mean+5*std;

outsideoneleft = length(filterData(datanormal, -9999999, leftone));
outsidetwoleft = length(filterData(datanormal, -999999, lefttwo));
outsidethreeleft = length(filterData(datanormal, -999999, leftthree));
outsidefourleft = length(filterData(datanormal, -999999, leftfour));
outsidefiveleft = length(filterData(datanormal, -999999, leftfive));

outsideoneright = length(filterData(datanormal, rightone, 999999));
outsidetworight = length(filterData(datanormal, righttwo, 999999));
outsidethreeright = length(filterData(datanormal, rightthree, 999999));
outsidefourright = length(filterData(datanormal, rightfour, 999999));
outsidefiveright = length(filterData(datanormal, rightfive, 999999));

onedev = length(filterData(datanormal, leftone, rightone))/1000;
twodev = length(filterData(datanormal, lefttwo, righttwo))/1000;
threedev = length(filterData(datanormal, leftthree, rightthree))/1000;

sorted = sort(datanormal);
ninety = (sorted(900));
ninetyfive = (sorted(950));
ninetynine = (sorted(990));
actualmean = mean;

figure(1); clf;
newdata = removeoutliers(data, leftfive, rightfive);
histogram(newdata , 200)
xlabel('Difference in Response Times (ms)')
ylabel('Frequency')
title('Histogram of the Frequency of Difference in Response Times for Bing and AOL search')
print -depsc bingvsaol
print('bingvsaol', '-dpdf')

positive = findpositive(data);

pvalue = pvalue('bing', 'aol');