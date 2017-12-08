x = 2008:2014;
points = [2304 2258 2111 NaN 2036 2089 1743];
ast = [587 651 554 NaN 551 488 511];
rb = [613 554 590 NaN 610 533 416];
actPoints = [2304 2258 2111 1683 2036 2089 1743];
actAst = [587 651 554 387 551 488 511];
actRb = [613 554 590 492 610 533 416];


actKLoveFg = [0.459 0.45 0.47 0.448 0.35 0.457 0.434 ];
kLoveFg = [0.459 0.45 0.47 NaN 0.35 0.457 0.434 ]; 


fg = [0.489 0.503 0.51 NaN 0.565 0.567 0.488];
ft = [0.78 0.767 0.759 NaN 0.753 0.75 0.71];
rpg = [ 7.6 7.3 7.5 NaN 8 6.9 6 ];
apg = [7.2 8.6 7 NaN 7.3 6.3 7.4];
ppg = [ 28.4 29.7 26.7 NaN 26.8 27.1 25.3];
actFg = [0.489 0.503 0.51 0.531 0.565 0.567 0.488];
actFt = [0.78 0.767 0.759 0.771 0.753 0.75 0.71];
actRpg = [ 7.6 7.3 7.5 7.9 8 6.9 6 ];
actApg = [7.2 8.6 7 6.2 7.3 6.3 7.4];
actPpg = [ 28.4 29.7 26.7 27.1 26.8 27.1 25.3];


xq1 = 2008:2014;
dataPoints = [points ast rb fg ft rpg apg ppg];

data = kLoveFg;
% for i = 1:length(dataPoints) 
p = pchip(x,data,xq1);
s = spline(x,data,xq1);
plot(x,actKLoveFg,'o',xq1,p,'-',xq1,s,'-.');
legend('Actual', 'pchip', 'spline', 'Year', 'Data');
% end