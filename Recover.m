function p = Recover(beta,N,I)
    r = rand;
    prob = beta*I/N;
    if(prob<r)
        p = 0;
    else
        p = 1;
    end
end