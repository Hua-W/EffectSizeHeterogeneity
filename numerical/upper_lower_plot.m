% This file draws the upper and lower curve of the Lasso trade off curve.
% It uses the functions: 
%    calctau 
%    funcA 
%    fdrlasso 
delta = 1; %n/p = delta
eps = 0.5; %sparsity level eps = k/p
tppup1=ones(1,300);
fdpup1=ones(1,300);
M = 1;


%{
for i = 1:300
	alpha = i*0.02+0.9;
    tppup1(i) = calctpp(alpha, delta, eps, 1, M);
    %tau = calctau(alpha, delta, eps, 1, M);
	%tppup1(i) = 1 - normcdf(alpha - M/tau) + normcdf(- alpha - M/tau); %g3 * (1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50));
	fdpup1(i) = 2 * (1 - eps) * normcdf(-alpha)/(2 * (1 - eps) * normcdf(-alpha)+ eps * tppup1(i)); %eps*(g3*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50))));
end
%
figure(1)
plot(tppup1,fdpup1)
ylim([0 0.27])
xlim([0 1])

hold on
tpplow1=0.01:0.01:1;
fdplow1=zeros(1,100);
for i = 1:1:100
	fdplow1(i)=fdrlasso(tpplow1(i),delta,eps);
end
plot(tpplow1(1:100),fdplow1(1:100))
hold off
legend(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q_*'],['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^*'],'Location','northwest')
xlabel('TPP')
ylabel('FDP')
%}
%------------------ 2 

%{
delta = 1; %n/p = delta
eps = 0.1; %sparsity level eps = k/p
tppup2=ones(1,300);
fdpup2=ones(1,300);
M = 1;

for i = 1:300
	alpha = i*0.02+2.7;%2.98;
    tppup2(i) = calctpp(alpha, delta, eps, 1, M);
    %tau = calctau(alpha, delta, eps, 1, M);
	%tppup1(i) = 1 - normcdf(alpha - M/tau) + normcdf(- alpha - M/tau); %g3 * (1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50));
	fdpup2(i) = 2 * (1 - eps) * normcdf(-alpha)/(2 * (1 - eps) * normcdf(-alpha)+ eps * tppup2(i)); %eps*(g3*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50))));
end
%
figure(2)
plot(tppup2,fdpup2,'Linewidth',1)
ylim([0 0.028])
xlim([0 1])

hold on
tpplow2=0.01:0.01:1;
fdplow2=zeros(1,100);
for i = 1:1:100
	fdplow2(i)=fdrlasso(tpplow2(i),delta,eps);
end
plot(tpplow2(1:100),fdplow2(1:100),'Linewidth',1)
set(gca,'linewidth',1.5)

hold off
%legend(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q_*'],['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^*'],'Location','northwest')
xlabel('TPP')
ylabel('FDP')

%}
%{
%------------------ 3
delta = 1; %n/p = delta
eps = 0.05; %sparsity level eps = k/p
tppup1=ones(1,300);
fdpup1=ones(1,300);
M = 1;

for i = 1:300
	alpha = i*0.02+2.5;
    tppup1(i) = calctpp(alpha, delta, eps, 1, M);
    %tau = calctau(alpha, delta, eps, 1, M);
	%tppup1(i) = 1 - normcdf(alpha - M/tau) + normcdf(- alpha - M/tau); %g3 * (1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50));
	fdpup1(i) = 2 * (1 - eps) * normcdf(-alpha)/(2 * (1 - eps) * normcdf(-alpha)+ eps * tppup1(i)); %eps*(g3*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50))));
end
plot(tppup1,fdpup1)
ylim([0 0.00025])
xlim([0 1])

figure(3)
hold on
tpplow1=0.01:0.01:1;
fdplow1=zeros(1,100);
for i = 1:1:100
	fdplow1(i)=fdrlasso(tpplow1(i),delta,eps);
end
plot(tpplow1(1:100),fdplow1(1:100))
hold off
legend(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q_*'],['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^*'],'Location','northwest')
xlabel('TPP')
ylabel('FDP')


%}
%---------------------- 4
delta = 1; %n/p = delta
eps = 0.2; %sparsity level eps = k/p
tppup1=ones(1,300);
fdpup1=ones(1,300);
M = 1;

for i = 1:300
	alpha = i*0.02+1.97;
    if validAlpha(alpha, eps, delta) == 0
        continue
    end
    tppup1(i) = calctpp(alpha, delta, eps, 1, M);
    %tau = calctau(alpha, delta, eps, 1, M);
	%tppup1(i) = 1 - normcdf(alpha - M/tau) + normcdf(- alpha - M/tau); %g3 * (1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(s,alpha,0,1000,g1,g2,g3,delta)/50));
	fdpup1(i) = 2 * (1 - eps) * normcdf(-alpha)/(2 * (1 - eps) * normcdf(-alpha)+ eps * tppup1(i)); %eps*(g3*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*50))+g2*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*2500))+g1*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)*125000))+(1-g1-g2-g3)*(1-normcdf(alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50)+normcdf(-alpha-fun(eps,alpha,0,1000,g1,g2,g3,delta)/50))));
end

figure(10)
plot(tppup1,fdpup1)
ylim([0 0.2])
xlim([0 1])

hold on
tpplow1=0.01:0.01:1;
fdplow1=zeros(1,100);
for i = 1:1:100
	fdplow1(i)=fdrlasso(tpplow1(i),delta,eps);
end
plot(tpplow1(1:100),fdplow1(1:100))
hold off
%legend(['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q_*'],['\delta=',num2str(delta),' ,\epsilon=',num2str(eps),' ,q^*'],'Location','northwest')
xlabel('TPP')
ylabel('FDP')
