delta = 1; %n/p = delta
eps = 0.2; %sparsity level eps = k/p
tppup1=zeros(1,200);
fdpup1=zeros(1,200);
M = 1;
sigma = 0;
% The upper curve, with constant prior = 1
for i = 1:200
	alpha = i*0.02+1.96;
    tppup1(i) = calctpp(alpha, delta, eps, 1, M, sigma);
	fdpup1(i) =  calcfdp(alpha, eps, tppup1(i)); 
end

figure(1)
plot(tppup1,fdpup1, 'DisplayName', string(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q_*']))
ylim([0 0.2])
xlim([0 1])

hold on
tpplow1=0.01:0.01:1;
fdplow1=zeros(1,100);
for i = 1:1:100
	fdplow1(i)=fdrlasso(tpplow1(i),delta,eps);
end
plot(tpplow1(1:100),fdplow1(1:100), 'DisplayName', string(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^*']))

%one at 0.5
tpp5 = zeros(1, 200);
tpp235 = zeros(1,200);
fdp5 = zeros(1,200);
fdp235 = zeros(1,200);
M = 10;
for i = 1:200
	alpha = i*0.02+1.96;
    tpp5(i) = calctpp(alpha, delta, eps, [0.5 0.5], [1/M, M], sigma);
    tpp235(i) = calctpp(alpha, delta, eps, [0.5 0.3 0.2], [1/M M M^3], sigma);
    fdp5(i) = calcfdp(alpha, eps, tpp5(i));
    fdp235(i) =  calcfdp(alpha, eps, tpp235(i));  
end
plot(tpp5,fdp5, 'DisplayName', '0.5, 0.5')
plot(tpp235, fdp235, 'DisplayName', '0.2, 0.3, 0.5')

hold off
legend('Location','northwest')
xlabel('TPP')
ylabel('FDP')
%}