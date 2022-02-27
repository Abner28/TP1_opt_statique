function grad = grad_f(f,x)
%grad_f = 3*x.^2 - 12*x + 3;
grad = gradient(f, x);
end