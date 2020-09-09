% Author: Cameron Matchett, Date: 22/09/2019
% This script takes in start and end x-values, the step in x, the
% eigenvalue E and the principal quantum number n. It returns plots of the
% analytic solution to d^2(psi)/dx^2 = (x^2 - E)*psi as well as the
% numerical solution obtained using the Numerov method.

% Input variables:

delta = 0.05;
x0 = 0;
x1 = 5;
E = 17;
n = 8;

% Using if statement to decide boundary conditions for oscillator.

if mod(n,2) == 0
    psi0 = 1;
    dpsi0 = 0;
else
    psi0 = 0;
    dpsi0 = 1;
end

% Defining lambda function to calculate the value of the function
% multiplying psi in the differential equation above.

f = @(x) x^2 - E;

% Creating an array of the required x values.

x = x0:delta:x1;

% Using the solve_numerov function to obtain numerical solution of the
% differential equation stated above.

psi = solve_numerov(f,x,psi0,dpsi0,delta);

% Plotting the numerical and analytical solutions to the differential
% equation to enable comparison.

plot(x,psi);
xlim([0 x1]);
ylim([-1 2]);
hold on
plot(x,exp(-0.5*x.^2));
legend('Numerical Solution','Analytical Solution');
xlabel('x')
ylabel('psi(x)');



    
   
