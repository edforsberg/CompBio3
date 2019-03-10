I0 = 25;
N = 50;
nrRuns = 100;
timesteps = 100000;
%I = zeros(1,timesteps);
I = I0;
alpha = 0.8;
beta = 1;
deathPoint = zeros(1,nrRuns);
for i = 1:nrRuns
    counter = 0;
    I = I0;
    while I ~= 0
        counter = counter +1;
        I = I + Infect(alpha,N,I) - Recover(beta,N,I);
    end
    deathPoint(i) = counter;
end
plot(1:nrRuns,deathPoint)
    
%for i  = 2:timesteps
 %       I(i) = I(i-1) + Infect(alpha,N,I(i-1)) - Recover(beta,N,I(i-1));
%end 
    
    
function p = Infect(alpha,N,I)
    r = rand;
    prob = alpha*(1-I/N)*I/N;
    if(prob<r)
        p = 0;
    else
        p = 1;
    end
end

function p = Recover(beta,N,I)
    r = rand;
    prob = beta*I/N;
    if(prob<r)
        p = 0;
    else
        p = 1;
    end
end