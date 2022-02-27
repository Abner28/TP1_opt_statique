% Gradient à pas constant
function  resp = pas_constant(f, x_0, rho, err, N, var, dim)

resp = zeros(length(x_0),N);
resp(:,1) = x_0;

grad = grad_f(f, var);
display(grad)
grad = matlabFunction(grad);

for j = linspace(1, length(x_0), length(x_0))
    xx_0 = x_0(j);

    for i = 2:N 

        x_new = xx_0 - rho*feval(grad, xx_0);
    
        if abs(x_new - xx_0) < err 
            break
        else
           xx_0 = x_new;
           resp(j,i) =  x_new;
        end
    end
end
end