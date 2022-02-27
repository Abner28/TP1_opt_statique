% Gradient à pas variable
function  resp = pas_variable(f, x_0, rho, err, N, x)

resp = zeros(length(x_0),N);
resp(:,1) = x_0;

grad = grad_f(f, x);
grad = matlabFunction(grad);

f = matlabFunction(f);

for j = linspace(1, length(x_0), length(x_0))
    xx_0 = x_0(j);

    for i = 2:N 

        x_new = xx_0 - rho*feval(grad, xx_0);

        if feval(f, x_new) < feval(f, xx_0)
            rho = 1.15*rho;
        else
            rho = 0.5*rho;
        end
    
        if abs(x_new - xx_0) < err 
            break
        else
           xx_0 = x_new;
           resp(j,i) =  x_new;
        end
    end
end
end