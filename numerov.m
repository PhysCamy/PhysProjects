function result = numerov(x,psi,a,delta,f)
% Author: Cameron Matchett, Date: 22/09/2019
% Returns the Numerov iteration of the solution to d^2(psi)/dx^2 = f(x)*psi
% corresponding to index a.
% Input:
% * x: Array containing values of x in range x0 to x1 with separation
%      delta.
% * psi: Array containing the values of psi preceding the value being
%        calculated.
% * a: Index at which the iteraton is being calculated.
% * delta: Separatiopn of the x-values.
% * f: Lambda function which calculates the value of f(x) in the above
%      differential equation.
% Output:
% * result: Returns the next value of psi using the iteration.

% Using the formula for the Numerov iteration to obtain the next value of
% psi using the two previous values at inices (a-1) and (a-2).

result = (1/(1-((delta^2)/12)*f(x(a))))*((2+(5/6)*(delta^2)*f(x(a-1)))*psi(a-1)-(1-((delta^2)/12)*f(x(a-2)))*psi(a-2));

end