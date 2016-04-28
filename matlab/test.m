clear;
pd = makedist('Normal');
rng default;  % for reproducibility
x = random(pd,1000,1);
histogram(x, 200)
[h, p] = chi2gof(x);