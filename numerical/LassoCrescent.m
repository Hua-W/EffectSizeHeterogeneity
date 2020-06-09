% This file serves at to draw a publishable Lasso Crescent.

delta = 1; %n/p = delta
eps = 0.2; %sparsity level eps = k/p
sigma = 0;
M = 1;
N = 2000;
% The upper curve, with constant prior = 1
[tppup1, fdpup1] = calcLassoPath(delta, eps, [1], [M], sigma, N);

figure(1)
plot(tppup1,fdpup1, 'DisplayName', string(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^\nabla']))
N = length(fdpup1);
upper_lim = fdpup1(N)*1.1;
ylim([0 upper_lim])
xlim([0 1])

hold on
tpplow1=linspace(0, 1, N);
fdplow1=zeros(1,N);
for i = 1:1:N
	fdplow1(i)=fdrlasso(tpplow1(i),delta,eps);
end
plot(tpplow1(1:N),fdplow1(1:N), 'DisplayName', string(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^\Delta']))


hold off
%legend('Location','northwest')
xlabel('TPP')
ylabel('FDP')
%}
A = [tpplow1; fdplow1; tppup1; fdpup1];
fileID = fopen('LassoCrescent_1.txt','w');
fprintf(fileID,'%12.8f\t%12.8f\t%12.8f\t%12.8f\r\n',A);
fclose(fileID);