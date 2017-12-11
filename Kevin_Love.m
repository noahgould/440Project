% Import data from CSV file
kLoveData = csvread('Data\Russell_Westbrook.csv',1,1);

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
piecewise = LinearInterpolation(polyYears, kLoveFg);


% Get data points from Lagrange polynomial for FG percentage
syms x
lagrangeFG = zeros(1,7);
piecewiseFG = zeros(1,7);
for i = 1:7
    lagrangeFG(i) = subs(fgPolynomial, x, years(i));
end

for i = 1:length(years)
    for j = 1:length(piecewise) - 1
        if years(i) >= piecewise(j,2) && years(i) < piecewise(j+1, 2)
            pieceToUse = piecewise(j,1);
        end
    end
    if i == 7
        pieceToUse = piecewise(length(pieceWise), 1);
    end
    
    piecewiseFG(i) = subs(pieceToUse, x, years(i));
end

% Plot FG percentage Lagrange polynomial against actual data
plot(years,actKLoveFg,'o',years,lagrangeFG,'-', years,piecewiseFG, '-.');
title('Kevin Love FG Percentage from 2008-2014');
xlabel('Year');
ylabel('FG Percentage');
legend('Actual', 'Lagrange', 'Piecewise Linear');
legend('Location', 'southwest');