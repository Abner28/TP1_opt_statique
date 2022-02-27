function resp = f_minsearch(f, x_0)

resp = zeros(length(x_0),2);
resp(:,1) = x_0;

f = matlabFunction(f);

for i = 1:length(x_0)
    resp(i, 2) = fminsearch(f, x_0(i));

end