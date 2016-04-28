function [ p ] = pvalue( setone, settwo )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if strcmp(setone, 'aol')
    setone = './../csv/aol.csv';
elseif strcmp(setone, 'bing')
    setone = './../csv/bing.csv';
elseif strcmp(setone, 'google')
    setone = './../csv/google.csv';
else
    setone = './../csv/yahoo.csv';
end

if strcmp(settwo, 'aol')
    settwo = './../csv/aol.csv';
elseif strcmp(settwo, 'bing')
    settwo = './../csv/bing.csv';
elseif strcmp(settwo, 'google')
    settwo = './../csv/google.csv';
else
    settwo = './../csv/yahoo.csv';
end

dataone = csvread(setone, 0, 1, [0 1 999 1]);
datatwo = csvread(settwo, 0, 1, [0 1 999 1]);

datanormalone = log10(dataone);
datanormaltwo = log10(datatwo);

meanone = mean(datanormalone);
meantwo = mean(datanormaltwo);

stdone = std(datanormalone);
stdtwo = std(datanormaltwo);

num = meanone-meantwo;
denom = sqrt((stdone^2 / length(datanormalone)) + (stdtwo^2 / length(datanormaltwo)));
z = (num) / (denom);

if z > 0
    p = 1 - normcdf(z,0,1);
else
    p = normcdf(z,0,1);
end

end

%rightthreeone = meanone+3*stdone;
%leftthreeone = meanone-3*stdone;
%rightthreetwo = meantwo+3*stdtwo;
%leftthreetwo = meantwo-3*stdtwo;

%datanormalone = removeoutliers(datanormalone, leftthreeone, rightthreeone);
%datanormaltwo = removeoutliers(datanormaltwo, leftthreetwo, rightthreetwo);

%meanone = mean(datanormalone);
%meantwo = mean(datanormaltwo);

%stdone = std(datanormalone);
%stdtwo = std(datanormaltwo);