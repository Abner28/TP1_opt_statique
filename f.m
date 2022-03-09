function func = f(x, n, choix)

% Question 1.1
if choix == 1
    func = x(1)^3 - 6*x(1)^2 + 3*x(1) + 1;
end

% Question 1.2
if choix == 2
    e = 0.001;
    func = e*x(1)^4 + 6*x(1)^2 + x(2)^2 - 4*x(1) + x(2);
end

% Question 1.3 (f)
if choix == 3
    func = 0;
    for i = 1:n
        func = func + (x(i)^n - i)^2;
    end
end

% Question 1.3 (g)
if choix == 4
    m = 3;
    b = ones(n,1);
    A = zeros(n,n);
    
    % Assemblage de la matrice A
    for i = 1:n
        A(i,i) = 2;

        if i < n
            A(i, i + 1) = -1;
            A(i + 1, i) = -1;

        end
    end
    %
    func = norm(A*x(1:n) - b)^(2*m);

end

% Fin de la fonction 
end