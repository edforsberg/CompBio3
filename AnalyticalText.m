function Text = AnalyticalText(alpha, beta, N)
r0 = alpha/beta; 
s0 = log(r0)-(1-1/r0); 
Text = exp(N.*sqrt(r0).*s0); 
end
