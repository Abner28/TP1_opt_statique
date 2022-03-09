function resp = plots(x0, resp_pconst, resp_newton, resp_pvar, resp_fmins, n)

% Si pas constant :
subplot(3,1,1)
c_map = lines();
for i = 1:n*length(x0(1,:))
    it_pconst = find(resp_pconst(i,:));
    % Pas constant
    plot( 1:it_pconst(end), resp_pconst(i,1:it_pconst(end)), "Color", c_map(i,:), linewidth = 2)
    hold on
    % fminsearch
    plot(it_pconst(end),resp_fmins(i,1), 'x', "Color", c_map(i,:), markersize = 8, linewidth = 2)
    hold on
end
ylabel("Évolution des x0")
title("Pas constant")
grid on

% Si pas variable :
subplot(3,1,2)
c_map = lines();
for i = 1:n*length(x0(1,:))
    it_pvar = find(resp_pvar(i,:));
    % Pas variables
    plot( 1:it_pvar(end), resp_pvar(i,1:it_pvar(end)),'-.', "Color", c_map(i,:), linewidth = 2)
    hold on
    % fminsearch
    plot(it_pvar(end),resp_fmins(i,1), 'x', "Color", c_map(i,:), markersize = 8, linewidth = 2)
    hold on
end
ylabel("Évolution des x0")
title("Pas Variable")
grid on
%legend()

% Si Newton:
subplot(3,1,3)
c_map = lines();
for i = 1:n*length(x0(1,:))
    it_pn = find(resp_newton(i,:));
    % Méthode de Newton (Plot)
    plot( 1:it_pn(end), resp_newton(i,1:it_pn(end)),'-o', "Color", c_map(i,:), linewidth = 2)
    hold on
    % fminsearch
    plot(it_pn(end),resp_fmins(i,1), 'x', "Color", c_map(i,:), markersize = 8, linewidth = 2)
    hold on
end
xlabel("Nb d'itérations")
ylabel("Évolution des x0")
title("Newton")
grid on
%legend()
end