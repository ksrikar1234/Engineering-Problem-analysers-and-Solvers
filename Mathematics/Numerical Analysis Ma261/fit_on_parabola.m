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

function retval = fit_on_parabola (u , v , i = 0 , j = 0) 
disp("\n--------------------------------------------------------------------------\n   Given original data x , y  are \n")
u
v

printf("   X = x - i : Y = y - j \n \n   where transformation parameters [i,j] are : [ %d ,%d ]" ,i ,j)
disp("\n\n   Transformed X , Y are : ") 
x = u-i
y = v-j 
disp("---------------------------------------------------------------------------\n")
syms  a  b c  n   x_sum    y_sum    x_sq_sum   x_cube_sum  x_power4_sum  x_y_sum  x_sq_y_sum
 
normal_eqs = [ y_sum == n*a + b*x_sum + c*x_sq_sum ; x_y_sum == a*x_sum + b*x_sq_sum + c*x_cube_sum ; x_sq_y_sum == a*x_sq_sum + b*x_cube_sum + c*x_power4_sum ]; 


min_max = (size(x));

n = (min_max(2))

x_sum = (sum(x))

y_sum = (sum(y))

x_sq = (x.^2);

x_sq_sum = (sum(x_sq))

x_3 = (x.^3);

x_cube_sum = (sum(x_3))

x_4  = (x.^4);

x_power4_sum = (sum(x_4))

x_y = (x.*y);

x_y_sum = (sum(x_y))

x_x_y = (x.*x.*y);

x_sq_y_sum = (sum(x_x_y))

i_eq =  eval(normal_eqs)

m = vpasolve(i_eq , [a,b,c])

syms  X Y  A B C I J

eq2 = Y  == A + J +  B*(X-I) + C*((X-I)^2)

J = j
I = i
A = m(1)
B = m(2)
C = m(3)

eq2 = eval(eq2)

eq2 = expand(eq2)




#{ 
x = u;
y = v;
x_sum = (sum(x));

y_sum = (sum(y));

x_sq = (x.^2);

x_sq_sum = (sum(x_sq));

x_3 = (x.^3);

x_cube_sum = (sum(x_3));

x_4  = (x.^4);

x_power4_sum = (sum(x_4));

x_y = (x.*y);

x_y_sum = (sum(x_y));

x_x_y = (x.*x.*y);

x_sq_y_sum = (sum(x_x_y));

i_eq =  eval(normal_eqs);

m = vpasolve(i_eq , [a,b,c]);
/+--------------------------------

syms  X Y  A B C I J

eq2 = Y + J == A*((X+I)^2) + B*(X+I) + C;

J = j;
I = i;
A = m(1);
B = m(2);
C = m(3);
eq2 = eval(eq2)
eq2 = expand(eq2)
eq2 = eval(eq2)
eq2 = eval(eq2)
eq2 = expand(eq2)
eq2 = eval(eq2)

i = m(1);
j = m(2);
k = m(3);
disp("a = ") 
disp(k)
disp("b = ") 
disp(j)
disp("c = ")
disp(i)
#}

