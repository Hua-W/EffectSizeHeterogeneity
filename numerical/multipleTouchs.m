% This file illustrate how to draw lasso paths that have several 
% intersection with the lower boundary found in (Su et al, 2017).

delta = 1; %n/p = delta
eps = 0.2; %sparsity level eps = k/p
sigma = 0;
M = 1;
N = 2000;
% The upper curve, with constant prior = 1
[tppup1, fdpup1] = calcLassoPath(delta, eps, [1], [M], sigma, N);

figure(1)
plot(tppup1,fdpup1, 'DisplayName', string(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^\nabla']))
ylim([0 0.2])
xlim([0 1])

hold on
tpplow1=0.01:0.01:1;
fdplow1=zeros(1,100);
for i = 1:1:100
	fdplow1(i)=fdrlasso(tpplow1(i),delta,eps);
end
plot(tpplow1(1:100),fdplow1(1:100), 'DisplayName', string(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^\Delta']))

% 5 levels
N = 2000;
M = 50;
gamma = [0.2 0.2 0.2 0.2 0.2];
signals = [1/M, M, M^2, M^3, M^4];
[tpp5, fdp5] = calcLassoPath(delta, eps, gamma, signals, sigma, N);
plot(tpp5,fdp5, 'DisplayName', '5 levels')

%10 levels
M = 30;
gamma = zeros(1, 10) + 0.1;
signals = [1/M, M, M^2, M^3, M^4, M^5, M^6, M^7, M^8, M^9];
[tpp10, fdp10] = calcLassoPath(delta, eps, gamma, signals, sigma, N);
plot(tpp10,fdp10, 'DisplayName', '10 levels')

hold off
legend('Location','northwest')
xlabel('TPP')
ylabel('FDP')
%}