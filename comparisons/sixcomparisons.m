clear;

google = csvread('./../csv/google.csv', 0, 1, [0 1 999 1]);
bing = csvread('./../csv/bing.csv', 0, 1, [0 1 999 1]);
aol = csvread('./../csv/aol.csv', 0, 1, [0 1 999 1]);
yahoo = csvread('./../csv/yahoo.csv', 0, 1, [0 1 999 1]);

googlevsbing = google - bing;
googlevsaol = google - aol;
googlevsyahoo = google - yahoo;
bingvsaol = bing - aol;
bingvsyahoo = bing - yahoo;
aolvsyahoo = aol - yahoo;

gvbmean = mean(googlevsbing);
gvamean = mean(googlevsaol);
gvymean = mean(googlevsyahoo);
bvamean = mean(bingvsaol);
bvymean = mean(bingvsyahoo);
avymean = mean(aolvsyahoo);

gvbsort = sort(googlevsbing);
gvasort = sort(googlevsaol);
gvysort = sort(googlevsyahoo);
bvasort = sort(bingvsaol);
bvysort = sort(bingvsyahoo);
avysort = sort(aolvsyahoo);

gvbmed = gvbsort(500);
gvamed = gvasort(500);
gvymed = gvysort(500);
bvamed = bvasort(500);
bvymed = bvysort(500);
avymed = avysort(500);

gvbstd = std(googlevsbing);
gvastd = std(googlevsaol);
gvystd = std(googlevsyahoo);
bvastd = std(bingvsaol);
bvystd = std(bingvsyahoo);
avystd = std(aolvsyahoo);

gvbleftfive = gvbmean-5*gvbstd;
gvbrightfive = gvbmean+5*gvbstd;
gvaleftfive = gvamean-5*gvastd;
gvarightfive = gvamean+5*gvastd;
gvyleftfive = gvymean-5*gvystd;
gvyrightfive = gvymean+5*gvystd;
bvaleftfive = bvamean-5*bvastd;
bvarightfive = bvamean+5*bvastd;
bvyleftfive = bvymean-5*bvystd;
bvyrightfive = bvymean+5*bvystd;
avyleftfive = avymean-5*avystd;
avyrightfive = avymean+5*avystd;

googlevsbing = removeoutliers(googlevsbing, gvbleftfive, gvbrightfive);
googlevsaol = removeoutliers(googlevsaol, gvaleftfive, gvarightfive);
googlevsyahoo = removeoutliers(googlevsyahoo, gvyleftfive, gvyrightfive);
bingvsaol = removeoutliers(bingvsaol, bvaleftfive, bvarightfive);
bingvsyahoo = removeoutliers(bingvsyahoo, bvyleftfive, bvyrightfive);
aolvsyahoo = removeoutliers(aolvsyahoo, avyleftfive, avyrightfive);

figure(1)
subplot(2,3,1), histogram(googlevsbing, 200);
title('Google vs Bing')
ylabel('Frequency')
hold on
subplot(2,3,2), histogram(googlevsaol, 200);
title('Google vs AOL')
xlabel('Difference in Response Times (ms)')
subplot(2,3,3), histogram(googlevsyahoo, 200);
title('Google vs Yahoo')
subplot(2,3,4), histogram(bingvsaol, 200);
title('Bing vs AOL')
ylabel('Frequency')
subplot(2,3,5), histogram(bingvsyahoo, 200);
title('Bing vs Yahoo')
xlabel('Difference in Response Times (ms)')
subplot(2,3,6), histogram(aolvsyahoo, 200);
title('AOL vs Yahoo')
hold off
print -depsc sixcomparisons
print('sixcomparisons', '-dpdf')
print('sixcomparisons', '-dpng')