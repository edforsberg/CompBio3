function p = Infect(alpha,N,I)
    r = rand;
    prob = alpha*(1-I/N)*I/N;
    if(prob<r)
        p = 0;
    else
        p = 1;
    end
end
