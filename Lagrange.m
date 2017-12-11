function lPolynomial = Lagrange(xValues, yValues)
    syms x
    % Find size of point set to create empty Li(x) array
    numberPoints = size(xValues, 2);
    L = sym(ones(numberPoints, size(x, 2)));
    
    % Check if xValues and yValues are same length
    if (numberPoints ~= size(yValues, 2))
        fprintf('Input arrays are not of equal size.')
    else
        % Create the Li(x) array
        for i = 1:numberPoints
            for j = 1:numberPoints
                if (i ~= j)
                    L(i, :) = L(i, :) * (x - xValues(j)) / (xValues(i) - xValues(j));
                end
            end
        end
        
        % Create Lagrange Polynomial
        P = 0;
        for i = 1:numberPoints
            P = P + L(i, :) * yValues(i);
        end
        
        lPolynomial = simplify(P);
    end
end