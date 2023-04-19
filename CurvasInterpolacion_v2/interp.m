% IC/UC
% Author: Enrique Álvarez F. - cealvar@uc.cl
% Date: 14/10/2011
% Modifications:
%   - 03/09/2020|Agustin Campeny - arcampeny@uc.cl|Port to SKY130
%   - 30/09/2020|Javier Contreras|Functioncore optimization
%   - <DATE>|<AUTHOR>|<DESCRIPTION>
%   - ...
% File Description: this function returns y(x) for a given x value, 
% interpolating if necesary. 

function  [y] = interp(x,axis_x,y_x)
% x : axis x input value.
% axis_x : no need to explain.
% y_x : vector of n elements with the values of y(x).

% Number of elements of y_x
n = length(y_x);
% We look for the nearest value of axis_x to the input x, then we store the
% index idx which contains the information about where (in the axis x) is 
% located the input value x.
min = 1e30;
idx = 1;
for j=1:n
    res = abs(x-axis_x(j));
    if res<min
        min = res;
        idx = j;
    end
end
% We proceed to determine whether the input value x is in the range 
% [idx-1 idx], [idx idx+1], or [idx].
if (idx==n && x>=axis_x(idx)) || (idx==1 && x<=axis_x(idx))
    s = 1;
else
    s = 0;
    x1 = idx;
    x2 = idx+(-1)^(x<axis_x(idx));
end
% We calculate y(x) as y(x) = k_1*y(a)+k_2*y(b), where the coefficients 
% k_1 and k_2 are proportional to the distance between x and the points 
% x1 and x2, respectively (k_1+k_2=1).
if s==1
    y = y_x(idx);
else
    k_1 = abs(x-axis_x(x2))/abs(axis_x(x2)-axis_x(x1));
    k_2 = 1-k_1;
    y = k_1*y_x(x1)+k_2*y_x(x2);
end
return