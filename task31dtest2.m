%task31ctest2

nrRuns = 100;
alpha = 1;
beta = 0.768;
numN = 10;
nVec = linspace(10,120,numN);
tVec = zeros(1,numN);

for n = 1:numN
    N = nVec(n);
    t = 0;
    for i = 1:nrRuns
        I = floor((1- beta/alpha)*N);
        while I ~= 0
            t = t+1;
            I = I + Infect(alpha,N,I) - Recover(beta,N,I);
        end
    end
    tVec(n) = t/nrRuns;
end

tAnalytical = AnalyticalText(alpha, beta, nVec);
% tAnalytical = tAnalytical.*nVec; 
tAnalytical = tAnalytical*tVec(end)/tAnalytical(end); 
semilogy(nVec,tVec);
hold on
semilogy(nVec,tAnalytical);
xlabel('N'); 
ylabel('ln T_{ext}'); 
title('Simulation results of T_{ext} as a function of N'); 
legend('simulation', 'analytical prediction'); 

