I0 = 10;
N = 100;
timesteps = 1000;
I = zeros(1,timesteps);
I(1) = I0
alpha = 1;
beta = 0.5;
for i  = 2:timesteps
    I(i) = I(i-1) + Infect(alpha,N,I(i-1)) - Recover(beta,N,I(i-1));
end
plot(1:timesteps,I)
    
    
    
    
    
function p = Infect(alpha,N,I)
    r = rand;
    prob = alpha*(1-I/N)*I/N;
    if(prob>r)
        p = 0;
    else
        p = 1;
    end
end

function p = Recover(beta,N,I)
    r = rand;
    prob = beta*I/N;
    if(prob>r)
        p = 0;
    else
        p = 1;
    end
end