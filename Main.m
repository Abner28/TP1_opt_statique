% TP | Optimisation Statique | Abner Micael
close all

%% Entrées générales
choix = 3;                  % La fonction qu'on va traiter
                            % (i.e.: choix = 2, la deuxième fonction du TP)

n = 3;                      % Dimension du problème
rho = 0.0001;               % Pas d'éxecution
err = 10^-3;                % Erreur
M = 1000;                   % Nb maximum d'intérations

% CI pour dimension n >= 2 (ajouter des lignes pour chaque dimension):
x0 = [linspace(2.5, 2.5, 1);
      linspace(1, 1, 1);
     linspace(3, 3, 1);
     ];  % Conditions Initiales

% CI pour dimension 1:
%  x0 = linspace(1, 2, 3);

%% Pas constant
resp_pconst = pas_constant(n, x0, rho, err, M, choix);

%% Pas variable
resp_pvar = pas_variable(n, x0, rho, err, M, choix);

%% fminsearch
resp_fmins = fmin_search(x0, n, choix);

%% Newton
resp_newton = newton(x0, n, M, choix, err);

%% Plots
plots(x0, resp_pconst, resp_newton, resp_pvar, resp_fmins, n)