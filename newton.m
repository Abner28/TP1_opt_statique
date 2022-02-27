function resp = newton(f, x_0, err, N, X, dim)

resp = zeros(dim*length(x_0(1,:)),N);
resp(:,1) = reshape(x_0,[],1);

% grad1 = grad_f(f, x);
% grad2 = grad_f(grad1, x);
% grad1 = matlabFunction(grad1);  % Première derivative
% grad2 = matlabFunction(grad2);  % Deuxième derivative

grad = grad_f(f, X(1:dim));
hess_inv = inv(hessian(f));

for j = 1:length(x_0(1,:))
    xx_0 = x_0(1:dim,j);

    for i = 2:N 
        %x_new = xx_0  - feval(grad1, xx_0)/feval(grad2, xx_0);
        x_new = xx_0 - subs(hess_inv, X(1:dim), transpose(xx_0))*subs(grad, X(1:dim), transpose(xx_0));

        if all(abs(x_new - xx_0) <= err)
            xx_0 = x_new;
            resp(dim*j - 1 : dim*(1 + j) - 2 ,i) =  x_new;
            break
        else
           xx_0 = x_new;
           resp(dim*j - 1 : dim*(1 + j) - 2 ,i) =  x_new;

        end
    end
    
end

resp = transpose(resp);
end