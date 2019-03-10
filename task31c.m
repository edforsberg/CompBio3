I0 = 10;
N = 100;
nrRuns = 1000;
I = I0;
alpha = 1;
beta = 0.8;
deathCel = cell(1,nrRuns); 

for i = 1:nrRuns
    IVec = []; 
    I = I0;
    while I ~= 0
        I = I + Infect(alpha,N,I) - Recover(beta,N,I);
        IVec = [IVec; I]; 
    end 
    deathCel{i} = IVec; 
end

lengths = cellfun('length', deathCel)';
maxLength = max(lengths); 
deathMat = zeros(nrRuns,maxLength); 

for i = 1:nrRuns
    deathMat(i,1:lengths(i)) = deathCel{i}';     
end

accDeath = zeros(1,maxLength); 
absDeath = zeros(1,maxLength);

for i = 1:maxLength    
    nrNonZeros = sum(deathMat(:,i) ~= 0);   
    sumI = sum(deathMat(:,i));
    absDeath(i) = sumI/nrRuns;  
    accDeath(i) = sumI/nrNonZeros;
end

a = 1000;
timeVec = 1:a;
subplot (1,2,1)
plot(timeVec, absDeath(1:a)); 
hold on
plot(timeVec, accDeath(1:a)); 
title('Average number of I');
xlabel('t'); 
ylabel('Average I(t)'); 
legend('I_{abs}(t)','I_{acc}(t)'); 



    

