## Copyright (C) 2021 Srikar Kadiyam
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} fit_on_line(@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Srikar Kadiyam <kadiyamsrikarej200@gmail.com>
## Created: 2021-01-06

function retval = fit_on_line (x, y )

syms  a  b  n   x_sum    y_sum    x_sq_sum    x_y_sum
 
normal_eqs = [ y_sum == n*a + b*x_sum ; x_y_sum == a*x_sum + b*x_sq_sum ]; 

x_sum = vpa(sum(x));

min_max = vpa(size(x));

n = vpa(min_max(2));

x_sum = vpa(sum(x));

y_sum = vpa(sum(y));

x_sq = vpa(x.^2);

x_sq_sum = vpa(sum(x_sq));

x_y = vpa(x.*y);

x_y_sum = vpa(sum(x_y));

i_eq =  eval(normal_eqs);

m = vpasolve(i_eq , [a,b]);


i = m(1);
j = m(2);

disp("a = " ) 
disp(i)
disp("b = ") 
disp(j)

endfunction
