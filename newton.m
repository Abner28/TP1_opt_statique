function resp = newton(x0, n, M, choix, err)

% Initialisation du vector 'resp' :
resp = zeros(n*length(x0(1,:)),M);
resp(:,1) = reshape(x0, [], 1); 

% Choix de la fonction à traiter : 
syms x_sym [1 n]
fx = f(x_sym, n, choix);

% Hessienne de la fontion
hess_f = hessian(fx, x_sym);
hess_inv = inv(hess_f);

% Boucle 'for' pour chercher le minimum :
for j = 1:length(x0(1,:))
    xx0 = x0(1:n, j);                              % On varie x0
    
    for i = 2:M
        xn = xx0 - vpa(subs(hess_inv, x_sym.', xx0))*grad(xx0, n, choix);

        if all(abs(xn - xx0) <= err)
                break
        else 
            xx0 = xn;
            index_nonzero = find(resp(:,i));
            
                if isempty(index_nonzero)
                   resp(1:n,i) = xn;
                else
                   resp(index_nonzero(end) + 1 : index_nonzero(end) + n,i) =  xn;            
                end
        end
    end
end

end