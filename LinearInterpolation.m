function piecewiseLinear = LinearInterpolation(xValues, yValues)
    
    numberOfPoints = length(xValues);
    syms x;
    L = sym(ones(numberOfPoints - 1, 2));
    for i = 1:numberOfPoints - 1
        L(i) = yValues(i) + ((yValues(i+1) - yValues(i))/(xValues(i+1) - xValues(i)))*(x - xValues(i));
        L(i,2) = xValues(i);
    end
    piecewiseLinear = simplify(L);
    
end
    
    
    