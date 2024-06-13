%
for j = 1:4
    n = 5 * j;
    
    xeq = linspace(-5, 5, n+1);
    xcheb = 5 * cos((0:n)*pi./n);
    
    f = chebfun(' 1 / (1 + x^2) ', [-5, 5]);
%
    peq = chebfun.interp1(xeq, f);
    
    if (j == 1)
        plot(f, 'k', 'LineWidth', 2)
        hold on;
    end
    plot(peq, 'LineWidth', 2)
    hold on;
%}
%{
    pcheb = chebfun.interp1(xcheb, f);
    
    if (j == 1)
        plot(f, 'k', 'LineWidth', 2)
        hold on;
    end
    plot(pcheb, 'LineWidth', 2)
    hold on;
%}
end
%}
%{
n = 20;

xcheb = 5 * cos((0:n)*pi./n);
f = chebfun(' 1 / (1 + x^2) ', [-5, 5]);
pcheb = chebfun.interp1(xcheb, f);

plot(f - pcheb, 'r', 'LineWidth', 2)
title("Plot of the Difference f(x) - p_{20}(x)")
%}
%
title("Equidistant Nodes")
legend("Function", "n=5", "n=10", "n=15", "n=20")
ylim([-1, 2])
%}