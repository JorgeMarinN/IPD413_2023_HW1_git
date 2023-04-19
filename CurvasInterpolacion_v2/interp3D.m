% IC/UC
% Author: Enrique Álvarez F. - cealvar@uc.cl
% Date: 14/10/2011
% Modifications:
%   - <DATE>|<AUTHOR>|<DESCRIPTION>
%   - <DATE>|<AUTHOR>|<DESCRIPTION>
%   - <DATE>|<AUTHOR>|<DESCRIPTION>
%   - ...
% File Description: this function returns z(x,y) for a given x value and y 
% value, interpolating if necesary. 

function  [z] = interp3D(x,y,axis_x,axis_y,z_yx)
% x : axis x input value.
% y : axis y input value.
% axis_x : no need to explain.
% axis_y : no need to explain.
% z_yx : mxn matrix with the values of z(y,x).

% Number of elements of axis_x
n = length(axis_x);
% Number of elements of axis_y
m = length(axis_y);
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
% Same as before for y.
min = 1e30;
idy = 1;
for j=1:m 
    res = abs(y-axis_y(j));
    if res<min
        min = res;
        idy = j;
    end
end
% We proceed to determine whether the input value x is in the range 
% [idx-1 idx], [idx idx+1], or [idx].
if (idx==n && x>=axis_x(idx)) || (idx==1 && x<=axis_x(idx))
    sx = 1;
else
    sx = 0;
    x1 = idx;
    x2 = idx+(-1)^(x<axis_x(idx));
end
% Same as before for y.
if (idy==m && y>=axis_y(idy)) || (idy==1 && y<=axis_y(idy))
    sy = 1;
else
    sy = 0;
    y1 = idy;
    y2 = idy+(-1)^(y<axis_y(idy));
end
% We calculate z(x,y) as z(x,y) = k_11*z(x1,y1)+k_12*z(x1,y2)+k_21*z(x2,y1)
% +k_22*z(x2,y2), where the coefficients k_11, k_12, k_21 and k_22 are 
% proportional to the distance between (x,y) and the points (x1,y1),
% (x1,y2), (x2,y1) and (x2,y2), respectively (k_11+k_12+k_21+k_22=1).
if and(sx==1,sy==1)
    z = z_yx(idy,idx);
elseif and(sx==1,sy==0)
    z_y = z_yx(:,idx);
    z = interp(y, axis_y, z_y');
elseif and(sx==0,sy==1)
    z_x = z_yx(idy,:);
    z = interp(x, axis_x, z_x);
else
    % kx1 and kx2
    kx1 = abs(x-axis_x(x2))/abs(axis_x(x1)-axis_x(x2));
    kx2 = 1-kx1;
    % ky1 and ky2
    ky1 = abs(y-axis_y(y2))/abs(axis_y(y1)-axis_y(y2));
    ky2 = 1-ky1;
    k_11 = kx1*ky1;
    k_12 = kx1*ky2;
    k_21 = kx2*ky1;
    k_22 = kx2*ky2;
    z =k_11*z_yx(y1,x1)+k_12*z_yx(y2,x1)+k_21*z_yx(y1,x2)+k_22*z_yx(y2,x2);
end
return