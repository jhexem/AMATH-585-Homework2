vals = [5 10 20];

for j = 1:3
    n = vals(j);

    xia = -1 + (2 * (0:n) / n);
    xib = cos(((2 * (0:n) + 1) * pi) / (2 * n + 2));
    xic = cos(((0:n) * pi) / n);
    
    numPoints = 20;
    A = zeros(n, numPoints);
    B = zeros(n, numPoints);
    C = zeros(n, numPoints);
    
    for k = 1:n
        aPoints = linspace(xia(k), xia(k+1), numPoints+1);
        bPoints = linspace(xib(k), xib(k+1), numPoints+1);
        cPoints = linspace(xic(k), xic(k+1), numPoints+1);
        
        A(k, :) = aPoints(1:end-1);
        B(k, :) = bPoints(1:end-1);
        C(k, :) = cPoints(1:end-1);
    end
    
    xa = [reshape(A.', 1, []) xia(end)];
    xb = [reshape(B.', 1, []) xib(end)];
    xc = [reshape(C.', 1, []) xic(end)];
    
    fxia = lambdan(xa, xia);
    fxib = lambdan(xb, xib);
    fxic = lambdan(xc, xic);
%{
    plot(xa, log10(fxia), 'LineWidth', 2)
    hold on;
    title("Log Base 10 of the Lebegue Function for Part a")
%}
%{
    plot(xb, fxib, 'LineWidth', 2)
    hold on;
    title("Lebegue Function for Part b")
%}
%
    plot(xc, fxic, 'LineWidth', 2)
    hold on;
    title("Lebegue Function for cos((i*pi)/n)")
%}
end

legend("n=5", "n=10", "n=20")

%%
function prod = li(i, x, points)
    n = length(points);
    prod = ones(1, length(x));

    for j = 1:n
        if (j ~= i)
            prod = prod .* ((x - points(j)) / (points(i) - points(j)));
        end
    end
end

function sum = lambdan(x, points)
    n = length(points);
    sum = 0;

    for i = 1:n
        sum = sum + abs(li(i, x, points));
    end
end