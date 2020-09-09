function psi = solve_numerov(f,x,psi0,dpsi0,delta)
% Author: Cameron Matchett, Date: 22/09/2019
% This function solves d^2(psi)/dx^2 = f(x)*psi from x0 to x1 with boundary
% condition: psi(x0) = psi0 and (d(psi)/dx)(x0) = dpsi0.
% Input:
% * f: The function to be called on the right hand side of the equation.
%      This receives x and returns the value of f(x).
% * x: This is an array containing the values of x being integrated over.
%      First value in array is x0 and final value is x1.
% * psi0: The value of psi at x0.
% * dpsi0: The value of d(psi)/dx at x0.
%
% Output:
% * psi: An array containing the values of psi as calculated at each value
%        of x.
%
% Example use:
% >> f = @(x) x^2 ? 1;
% >> x = linspace(0, 1, 100);
% >> psi0=1;
% >> dpsi0 = 0;
% >> psi = solve_numerov(f, x, psi0, dpsi0);
% >> plot(x, psi);

% Creating an array containing the values of f(x):

f_array = [];

% Calculating the values of f for each value of x.

for a = 1:length(x)
    f_array = [f_array, f(x(a))];
end

% Using Taylor expansion to calculate a second value of psi to enable use
% of the Numerov iterative technique. If statement used to distinguish
% between the cases of odd and even solutions.

if psi0 == 0
    psi1 = delta*dpsi0 + ((delta^3)/6)*(f(0)*dpsi0);
else
    psi1 = psi0 + ((delta^2)/2)*f(0)*psi0 + ((delta^4)/24)*(2*psi0 + (f(0)^2)*psi0);
end

% Defining the array to hold the values of psi. Initially contains the
% value obtained from boundary condition and that from Taylor expansion.

psi = [psi0,psi1];

% For loop used to calculate the value of psi at index a using the Numerov
% iteration. The array psi is updated with each iteration to include the
% new value.

for a = 3:length(x)
    psi = [psi,numerov(x,psi,a,delta,f)];
end
    
end
