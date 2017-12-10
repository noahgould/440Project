kLoveData = csvread('Data\Kevin_Love.csv',1,1);
disp(kLoveData);

actKLoveFg = kLoveData(:,1);
kLoveFg = actKLoveFg;
kLoveFg(4) = NaN;

years = 2008:2014;

data = kLoveFg;
% for i = 1:length(dataPoints) 
p = pchip(years,data,years);
s = spline(years,data,years);
plot(years,actKLoveFg,'o',years,p,'-',years,s,'-.');
legend('Actual', 'pchip', 'spline', 'Year', 'Data');
% end