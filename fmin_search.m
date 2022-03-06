function resp = fmin_search(x0, n, choix)
resp = [];

for i = 1 : length(x0(1,:))
    aux = fminsearch(@(x) f(x, n, choix), x0(:, i));
    resp(end + 1:end + n) = aux; 
end

resp = resp';

end