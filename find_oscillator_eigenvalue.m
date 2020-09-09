function [E] = find_oscillator_eigenvalue(E0)
% Author: Cameron Matchett, Date: 22/09/2019
% Finding the eigenvalue for harmonic oscillator potential by iteration
% with starting value E0.
% Input:
% * E0: The initial guess of the eigenvalue.
% Output:
% * E: Value of the eigenvalue near the initial guess of the system with
%      harmonic oscillator potential.
% Example use:
% >> E = find_oscillator_eigenvalue(1.2);
% >> disp(E);

delta = 0.05;
x0 = 0;
x1 = 5;
n = 3;

% Defining initial conditions based on whether we have even or odd n.

if mod(n,2) == 0
    psi0 = 1;
    dpsi0 = 0;
else
    psi0 = 0;
    dpsi0 = 1;
end

E = E0;

f = @(x) x^2 - E;

x = x0:delta:x1;

psi1 = solve_numerov(f,x,psi0,dpsi0,delta);

% Determining the required direction of change in E by considering the sign
% of the wavefunction at the final x value.

if n < 2
    if psi1(101) > 0
        diff = 0.0001;
    else 
        diff = -0.0001;
    end
else
    if psi1(101) > 0
        diff = -0.0001;
    else 
        diff = 0.0001;
    end
end

% Using a while loop to carry out the iterative process of updating the
% value of E until the numerical solution closely matches the analytical
% solution.

while abs(psi1(101)) > 0.1
    
    E = E + diff;
    f = @(x) x^2 - E;
    psi1 = solve_numerov(f,x,psi0,dpsi0,delta);
    
end

E = round(E);
    
end