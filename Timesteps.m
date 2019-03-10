function t = Timesteps(N,I0,alpha,beta)
I = I0; 
time = 0; 
while I > 0 
    probInfection = alpha*(1-I/N)*I; 
    probRecover = beta*I/N;
    time = time+exprnd(probInfection);     
    if rand() < probRecover/(probRecover+probInfection)
        I = I-1;
    else
        I = I+1; 
    end    
end
t = time; 