function resp = newton(f, x_0, err, N, X, dim)

resp = zeros(dim*length(x_0(1,:)),N);
resp(:,1) = reshape(x_0,[],1);

grad = grad_f(f, X(1:dim));
hess_inv = inv(hessian(f));

for j = 1:length(x_0(1,:))
    xx_0 = x_0(1:dim,j);

    for i = 2:N 
        x_new = xx_0 - subs(hess_inv, X(1:dim), transpose(xx_0))*subs(grad, X(1:dim), transpose(xx_0));

        if all(abs(x_new - xx_0) <= err)
            index_nonzero = find(resp(:,i));
            
            if isempty(index_nonzero)
                 resp(1:dim,i) = x_new;
            else
               resp(index_nonzero(end) + 1 : index_nonzero(end) + dim,i) =  x_new;
            end
            break
        else
           xx_0 = x_new;
           index_nonzero = find(resp(:,i));

           if isempty(index_nonzero)
               resp(1:dim,i) = x_new;
           else
               resp(index_nonzero(end) + 1 : index_nonzero(end) + dim,i) =  x_new;
           end

        end
    end
    
end

end