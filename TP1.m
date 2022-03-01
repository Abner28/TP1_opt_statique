% TP | Optmisation Statique | Abner Micael
 
n = 3;
X = (sym('x',[1 n]));
N = 30;
e = 10^-3;  % epsilon

%% Gradient à pas constant (beaucoup sensible avec le combinasion rho&x0)
% À changer avec la dimension du problème
% x0_pc = [0.5 1 ; 0 2];
% x0_pc = 0.5 : 5;
% dim_pc = 2;
% rho_pc = 0.05;  % Plus petit que 0.2
% rho_pc = [0.05; 0.2];
% 
% err_pc = 0.01;
% 
% resp_pc = pas_constant(f(X, e), x0_pc, rho_pc, err_pc, N, X, dim_pc);

%% Gradient à pas variable (Règle d'Armijo)
% À changer avec la dimension du problème
%x0_pv = [0.5 1 ; 0 2];
% x0_pv = [transpose(linspace(-5,1,n)), transpose(linspace(2,4,n)), transpose(linspace(0,0.5,n))];
% %x0_pv = 0.5:5;
% %dim_pv = 1;
% %rho_pv = 0.02;
% rho_pv = linspace(0.05,1 , n).';
% %
% err_pv = 0.01;
% 
% resp_pv = pas_variable(f(X, e), x0_pv, rho_pv, err_pv, N, X, n);

%% Méthode de Newton
% À changer avec la dimension du problème
x0_newton = [transpose(linspace(-5,1,n)), transpose(linspace(2,4,n)), transpose(linspace(0,0.5,n))];
%x0_newton = 0.5:5;
%dim_newton = 2;

err_newton = 0.001;
resp_newton = newton(f(X, e), x0_newton, err_newton, N, X, n);

%% fminsearch
% x0_fmin = [0.5 1 5 0.01; 0 2 3 0.05];
% x0_fmin = 0.5 : 5;
x0_fmin = [transpose(linspace(-5,1,n)), transpose(linspace(2,4,n)), transpose(linspace(0,0.5,n))];
%x0_newton = 0.5:5;
% dim_fmin = 2;

 resp_fminsearch = f_minsearch(f(X, e), x0_fmin, X, n);

% % Display
% figure(1)
% plot(x, f1(x))
% hold on
% xlabel('x')
% ylabel('f(x)')
% grid on
%

fonction = f(X,e)
%% Fonctions
function func = f(X, e)

%Question 1.1
%func = X(1).^3 - 6*X(1).^2 + 3*X(1) + 1; 

%Question 1.2
%func = e*X(1)^4 + 6*X(1)^2 + X(2)^2 - 4*X(1) + X(2);

%Question 1.3
func = 0;
for i = 1:length(X)
    func = func + (X(i)^length(X) - i)^2; 
end

end