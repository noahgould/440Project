% Import data from CSV file
kLoveData = csvread('Data\Kevin_Love.csv',1,1);

% Set year range for data
years = 2008:2014;
polyYears = years;
polyYears(4) = [];

% Get FG percentage data
actKLoveFg = kLoveData(:,1)';
kLoveFg = actKLoveFg;
kLoveFg(4) = [];

% Calculate Lagrange polynomial for FG percentage
fgPolynomial = Lagrange(polyYears, kLoveFg);

% Get data points from Lagrange polynomial for FG percentage
syms x
fgData = zeros(1,7);
for i = 1:7
    fgData(i) = subs(fgPolynomial, x, years(i));
end

% Plot FG percentage Lagrange polynomial against actual data
plot(years,actKLoveFg,'o',years,fgData,'-');
title('Kevin Love FG Percentage from 2008-2014');
xlabel('Year');
ylabel('FG Percentage');
legend('Actual', 'Lagrange');