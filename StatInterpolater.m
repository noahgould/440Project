function StatInterpolater(playerName)
    % Import data from CSV file
    fileName = strcat('Data\', strrep(playerName, ' ', '_'));
    fileName = strcat(fileName, '.csv');
    playerData = csvread(fileName,1,1);

    columnNames = {'FG Percentage', '3P Percentage', 'FT Percentage', 'Assists Per Game', 'Points Per Game'};
    columnNames = string(columnNames);

    % Set year range for data
    years = 2008:2014;
    polyYears = years;
    polyYears(4) = [];

    for column = 1:5
        % Get data
        actValues = playerData(:,column)';
        interpolateValues = actValues;
        interpolateValues(4) = [];

        % Calculate Lagrange polynomial for FG percentage
        fgPolynomial = Lagrange(polyYears, interpolateValues);
        piecewise = LinearInterpolation(polyYears, interpolateValues);

        % Get data points from Lagrange polynomial for FG percentage
        syms x
        lagrangeValues = zeros(1,7);
        piecewiseValues = zeros(1,7);
        for i = 1:7
            lagrangeValues(i) = subs(fgPolynomial, x, years(i));
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

            piecewiseValues(i) = subs(pieceToUse, x, years(i));
        end

        % Plot FG percentage Lagrange polynomial against actual data
        subplot(3,2,column)
        plot(years,actValues,'o',years,lagrangeValues,'-', years,piecewiseValues, '-.');
        title(strcat(playerName, {' '}, columnNames(column), ' from 2008-2014'));
        xlabel('Year');
        ylabel(columnNames(column));
        legend('Actual', 'Lagrange', 'Piecewise Linear');
        legend('Location', 'southwest');
    end
end
