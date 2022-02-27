function resp = newton(f, x_0, err, N, x)

resp = zeros(length(x_0),N);
resp(:,1) = x_0;

grad1 = grad_f(f, x);
grad2 = grad_f(grad1, x);

grad1 = matlabFunction(grad1);  % Première derivative
grad2 = matlabFunction(grad2);  % Deuxième derivative


for j = linspace(1, length(x_0), length(x_0))
    xx_0 = x_0(j);

    for i = 2:N 
        x_new = xx_0  - feval(grad1, xx_0)/feval(grad2, xx_0);
    
        if abs(x_new - xx_0) < err 
            break
        else

           xx_0 = x_new;
           resp(j, i) =  x_new;

        end
    end
    
end

end