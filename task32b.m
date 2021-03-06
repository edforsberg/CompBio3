clear all; close all; clc;
N = 1500;
K = 1.4;
V = 1;
kC = 2*V;

%rTheo = sqrt(8/((K^3)*(V^3)))*sqrt((K-kC)/kC)
rTheo = sqrt(8/((kC^3)*(V^3)))*sqrt((K-kC)/kC)
timesteps = 20000;
dt = 0.01;

theta = pi*rand(N,1) - pi/2;
omega = tan(V*pi*(rand(N,1)-1/2));
r = zeros(1,timesteps);
for i = 1:timesteps
    r(i) = calculateR(N,theta);
    dtheta = derivative(omega,theta,N,K);
    theta = theta + dt*dtheta;
    
end
plot((1:timesteps)*dt,r)
hold on 
%plot([0,timesteps*dt],[rTheo, rTheo],'r--');
%legend('r, simulated','r, estimation in a)')
plot([0,timesteps*dt],[0, 0],'r--');
legend('r, simulated','r, estimation')
axis([0,200,-0.1,1])
xlabel('time t')
ylabel('r')
tit = sprintf('r vs time t, with N = %d, gamma = %d and K = %f',N,V,K);
title(tit)

function dTheta = derivative(omega,theta,N,K)
    dTheta = omega;
    for i = 1:N
        for j = 1:N
            dTheta(i) = dTheta(i) + K/N*sin(theta(j)-theta(i));
        end
    end
end

function r = calculateR(N,theta)
 asum = 0;
 for i = 1:N
     asum = asum + exp(1j*theta(i));
 end
 asum = asum/N;
 r = norm(asum);
     
end