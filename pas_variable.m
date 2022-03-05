% Gradient à pas variable
function  resp = pas_variable(f, x_0, rho, err, N, X, dim)

resp = zeros(dim*length(x_0(1,:)),N);
resp(:,1) = reshape(x_0,[],1);

grad = grad_f(f, X(1:dim));
%grad = matlabFunction(grad);

for j = 1:length(x_0(1,:))
    xx_0 = x_0(1:dim,j);

    for i = 2:N 

        x_new = xx_0 - rho*subs(grad, X(1:dim), transpose(xx_0));
        
        
        if (subs(f, X(1:dim), transpose(x_new)) < subs(f, X(1:dim), transpose(xx_0)))
            rho = 1.15*rho;
        else
            rho = 0.5*rho;
        end

        if all(abs(x_new - xx_0) <= err)
            index_nonzero = find(resp(:,i));
            
            if isempty(index_nonzero)
                 resp(1:dim,i) = x_new;
            else
               index_nonzero = max(1, index_nonzero(end));
               resp(index_nonzero(end) + 1 : index_nonzero(end) + dim,i) =  x_new;
            end
            break

        else
           xx_0 = x_new;
           index_nonzero = find(resp(:,i));

           if isempty(index_nonzero)
               resp(1:dim,i) = x_new;
           else
               index_nonzero = max(1, index_nonzero(end));
               resp(index_nonzero(end) + 1 : index_nonzero(end) + dim,i) =  x_new;
           end

        end
    end
end

end