% TP | Optmisation Statique | Abner Micael

syms x1 x2 
X = [x1, x2];
N = 100;
e = 10^-3;  % epsilon

%% Gradient à pas constant
% À changer avec la dimension du problème
x0_pc = [0.5 1 ; 0 2];
dim_pc = 2;
rho_pc = [0.05; 0.2];
%
err_pc = 0.01;

resp_pc = pas_constant(f(X, e), x0_pc, rho_pc, err_pc, N, X, dim_pc);

%% Gradient à pas variable (Règle d'Armijo)
% À changer avec la dimension du problème
% x0_pv = [0.5 1 ; 0 2];
% dim_pv = 2;
% rho_pv = [0.05; 0.2];
% %
% err_pv = 0.001;
% 
% resp_pv = pas_variable(f(X, e), x0_pv, rho_pv, err_pv, N, X, dim_pv);

% %% Méthode de Newton
% x0_newton = 1:0.5:5;
% err_newton = 0.001;
% 
% resp_newton = newton(f(X, e), x0_newton, err_newton, N, X);
% %% fminsearch
% x0_fmin = 1:0.5:3;
% resp_fminsearch = f_minsearch(f(X, e), x0_fmin);

% 
% % Display
% figure(1)
% plot(x, f1(x))
% hold on
% xlabel('x')
% ylabel('f(x)')
% grid on
%

%% Fonctions
function func = f(X, e)
%func = X(1).^3 - 6*X(1).^2 + 3*X(1) + 1;
func = e*X(1)^4 + 6*X(1)^2 + X(2)^2 - 4*X(1) + X(2);
end