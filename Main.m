% TP | Optimisation Statique | Abner Micael

%% Entrées générales
choix = 3;                 % La fonction qu'on va traiter
                           % (i.e.: choix = 2, la deuxième fonction du TP)

n = 5;                      % Dimension du problème
rho = 0.001;                 % Pas d'éxecution
err = 10^-5;                % Erreur
M = 500;                    % Nb maximum d'intérations

% CI pour dimension n >= 2 (ajouter des lignes pour chaque dimension):
x0 = [linspace(1, 1, 1);
      linspace(1, 1, 1);
      linspace(1, 1, 1);
      linspace(1, 1, 1);
      linspace(1, 1, 1)];  % Conditions Initiales

% CI pour dimension 1:
%x0 = linspace(0.3, 0.5, 5);

%% Pas constant
resp_pconst = pas_constant(n, x0, rho, err, M, choix);

% subplot(3,1,1)
% xlabel("Nb de itération")
% ylabel("Convergence en chaque direction")
% grid on
% title("Méthode : Gradient à pas fixe")
% for i = 1:n
%     plot()
%     hold on
% end

%% fminsearch
resp_fmins = fmin_search(x0, n, choix);

