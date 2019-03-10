%task31ctest2

nrRuns = 1000;
alpha = 1;
beta = 0.8;
numN = 10;
nVec = linspace(10,100,numN);
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

semilogy(nVec,tVec);
