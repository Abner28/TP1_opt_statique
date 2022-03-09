function resp = grad(x, n, choix)
% Question 1.1
if choix == 1
    resp = 3*x(1)^2 - 12*x(1) + 3;
end

% Question 1.2
if choix == 2
    e = 0.001;
    resp = [4*e*x(1)^3 + 12*x(1) - 4; 2*x(2) + 1];
end

% Question 1.3 (f)
if choix == 3
    resp = ones(n,1);
    for i = 1:n
        resp(i) = 2*(x(i)^n - i)*n*x(i)^(n-1);
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

    % Pour simplifier, on va utiliser des variabes symboliques
    syms x_sym [1 n]
    func = norm(A*x_sym.' - b)^(2*m);
    grad = gradient(func, x_sym.');
    resp = vpa(subs(grad, x_sym.', x));
end


% Fin de la fonction grad
end