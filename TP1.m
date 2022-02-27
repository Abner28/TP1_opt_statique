% TP | Optmisation Statique | Abner Micael

syms x x1 x2 
var = [x, x1, x2];
N = 1000;
e = 0.01;  % epsilon

%% Gradient à pas constant
x0_pc = 2:0.5:4;
rho_pc = 0.02;
err_pc = 0.001;

resp_pc = pas_constant(f(var, e), x0_pc, rho_pc, err_pc, N, var);

%% Gradient à pas variable (Règle d'Armijo)
% x0_pv = 2:0.5:4;
% rho_pv = 0.02;
% err_pv = 0.001;
% 
% resp_pv = pas_variable(f(var, e), x0_pv, rho_pv, err_pv, N, var);
% 
% %% Méthode de Newton
% x0_newton = 1:0.5:5;
% err_newton = 0.001;
% 
% resp_newton = newton(f(var, e), x0_newton, err_newton, N, var);
% %% fminsearch
% x0_fmin = 1:0.5:3;
% resp_fminsearch = f_minsearch(f(var, e), x0_fmin);

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
function func = f(var, e)
func = var(1).^3 - 6*var(1).^2 + 3*var(1) + 1;
%func = e*var(2)^4 + 6*var(2)^2 + var(3)^2 - 4*var(2) + var(3);
end