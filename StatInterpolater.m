function playerData = StatInterpolater(playerName)
    % Import data from CSV file
    fileName = strcat('Data\', strrep(playerName, ' ', '_'));
    fileName = strcat(fileName, '.csv');
    playerData = csvread(fileName,1,1);

    % Set year range for data
    years = 2008:2014;
    polyYears = years;
    polyYears(4) = [];

    % Get FG percentage data
    actFg = playerData(:,1)';
    interpolateFg = actFg;
    interpolateFg(4) = [];

    % Calculate Lagrange polynomial for FG percentage
    fgPolynomial = Lagrange(polyYears, interpolateFg);
    piecewise = LinearInterpolation(polyYears, interpolateFg);


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
            pieceToUse = piecewise(length(piecewise), 1);
        end

        piecewiseFG(i) = subs(pieceToUse, x, years(i));
    end

    % Plot FG percentage Lagrange polynomial against actual data
    plot(years,actFg,'o',years,lagrangeFG,'-', years,piecewiseFG, '-.');
    title(strcat(playerName, ' FG Percentage from 2008-2014'));
    xlabel('Year');
    ylabel('FG Percentage');
    legend('Actual', 'Lagrange', 'Piecewise Linear');
    legend('Location', 'southwest');
end