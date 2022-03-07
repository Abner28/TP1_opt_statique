function resp = pas_variable(n, x0, rho, err, M, choix)

% Initialisation du vector 'resp' :
resp = zeros(n*length(x0(1,:)),M);
resp(:,1) = reshape(x0, [], 1); 

% Boucle 'for' pour chercher le minimum :
for j = 1:length(x0(1,:))
    xx0 = x0(1:n, j);                              % On varie x0

    for i = 2:M
        xn = xx0 - rho*grad(xx0, n, choix);
        
        % Règle d'Armijo
        if  (f(xn, n, choix) < f(xx0, n, choix))
            rho = 1.15*rho;
        else
            rho = 0.5*rho;
        end
        %
        
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

% Termimus d'algorithme
end