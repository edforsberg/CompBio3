nrRuns = 100000; 
N = 100;
nrRuns = 1000;
alpha = 1;
beta = 0.80;
qss = round((1-beta/alpha)*N); 
distr = zeros(round(1.5*qss),1); 

for i = 1:nrRuns
    I = qss+10;
    while I ~= 0
        I = I + Infect(alpha,N,I) - Recover(beta,N,I); 
        try
        distr(I+1) = distr(I+1)+1; 
        catch
            distr = [distr;0]; 
        end
    end 
end

xVec = 0:numel(distr)-1; 
gausDistr = normpdf(xVec,qss,8.9);
quasiDistr = quasiDist(xVec,alpha,beta,N);
quasiDistr = quasiDistr/sum(quasiDistr)
distr = distr/sum(distr); 
plot(xVec(2:end),distr(2:end)); 
hold on 
plot(xVec,gausDistr); 
hold on
plot(xVec,quasiDistr);
plot([qss qss],[0 1.2*max(distr)]); 
legend('Simulation','Gaussian','Theoretical','Quasi steady state'); 
title('Normalized position probability distribution over 1E5 runs');
xlabel('I');
ylabel('Probability(I)'); 

function I_S = quasiDist(I,alpha,beta,N)
    I = I./N;
    r0= alpha/beta;
    tmp = 1-1/r0;
    I_S = zeros(1,length(I));
    fun = @(X)log(r0*(1-X));
    for i = 1:length(I)
        I_S(i) = -integral(fun,tmp,I(i));
    end
    I_S = exp(-I_S.*N)
end

