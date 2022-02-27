% Gradient à pas variable
function  resp = pas_variable(f, x_0, rho, err, N, X, dim)

resp = zeros(dim*length(x_0(1,:)),N);
resp(:,1) = reshape(x_0,[],1);

grad = grad_f(f, X(1:dim));
%grad = matlabFunction(grad);

f = matlabFunction(f);
%% New
for j = 1:length(x_0(1,:))
    xx_0 = x_0(1:dim,j);

    for i = 2:N 

        x_new = xx_0 - rho.*subs(grad, X(1:dim), transpose(xx_0));
        
        for k = 1:length(rho)
            if feval(f(k), x_new(k)) < feval(f(k), xx_0(k))
                rho(k) = 1.15*rho(k);
            else
                rho(k) = 0.5*rho(k);
            end
        end
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

%% Old
% f = matlabFunction(f);
% 
% for j = linspace(1, length(x_0), length(x_0))
%     xx_0 = x_0(j);
% 
%     for i = 2:N 
% 
%         x_new = xx_0 - rho*feval(grad, xx_0);
% 
%         if feval(f, x_new) < feval(f, xx_0)
%             rho = 1.15*rho;
%         else
%             rho = 0.5*rho;
%         end
%     
%         if abs(x_new - xx_0) < err 
%             break
%         else
%            xx_0 = x_new;
%            resp(j,i) =  x_new;
%         end
%     end
% end
end