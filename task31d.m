%task31d

nRuns = 1000; 
alpha = 1;
beta = 0.8;
numN = 5; 
nVec = linspace(10,20,numN); 
tVec = zeros(1,numN); 

for n = 1:numN
    N = nVec(n); 
    I = round(N/2); 
    time = 0; 
for i = 1:nRuns
    time = time + Timesteps(N,I0,alpha,beta); 
end
time = time/nRuns; 
tVec(n) = time; 
end
plot(tVec,nVec); 