clc;clear;
%{
a=0;
t=0;
 while true
    b = a;
    a = a + 1;
    t = t + 1;
    if b > 100 || t > 1000
        break;
    end
end
 %}
t_d = [100,100,100,100,100]; 

for i = 1:5
    t_d(i)= 5*i;
end