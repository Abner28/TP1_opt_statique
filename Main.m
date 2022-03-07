% TP | Optimisation Statique | Abner Micael

%% Entrées générales
choix = 3;                 % La fonction qu'on va traiter
                           % (i.e.: choix = 2, la deuxième fonction du TP)

n = 3;                      % Dimension du problème
rho = 0.001;                 % Pas d'éxecution
err = 10^-3;                % Erreur
M = 1000;                    % Nb maximum d'intérations

% CI pour dimension n >= 2 (ajouter des lignes pour chaque dimension):
x0 = [linspace(0.1, 0.5, 2);
      linspace(0.1, 0.5, 2);
      linspace(0.1, 0.5, 2)];  % Conditions Initiales

% CI pour dimension 1:
% x0 = linspace(0.3, 0.5, 5);

%% Pas constant
resp_pconst = pas_constant(n, x0, rho, err, M, choix);

%% Pas variable
resp_pvar = pas_variable(n, x0, rho, err, M, choix);

%% fminsearch
resp_fmins = fmin_search(x0, n, choix);

