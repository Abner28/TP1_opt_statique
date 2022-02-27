function resp = f_minsearch(f, x_0, X, dim)

resp = [];
f = matlabFunction(f, 'Vars', {X(1:dim)});

for i = 1 : length(x_0(1,:))
    aux = fminsearch(f, transpose(x_0(:, i)));
    resp(end + 1:end + dim) = aux; 
end

resp = transpose(resp);
end