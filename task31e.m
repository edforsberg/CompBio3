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
distr = distr/sum(distr); 
plot(xVec,distr); 
hold on 
plot(xVec,gausDistr); 
hold on
plot([qss qss],[0 1.2*max(distr)]); 
legend('simulation','gausian', 'quasi strady state'); 
title('Normalized position distribution over 1E5 runs');
xlabel('n');
ylabel('Probability(I = n)'); 

