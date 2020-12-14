%% 第五章，第3题
clc;clear
A = [10 7 8 7;7 5 6 5;8 6 10 9;7 5 9 10];
newA = [10 7 8.1 7.2;7.08 5.04 6 5;8 5.98 9.89 9;6.99 5 9 9.98];
b = [32 23 33 31]';
x0 = [1 1 1 1]';
%% 求解detA、A的特征值、cond（A）等
det(A)
cond(A,2)
eig(A)
%% 干扰分析
x = newA \ b; %扰动下的解
del_x = x - x0; %扰动对解的影响
norm(del_x,2); 
del_A = newA-A

eA = norm(del_A,2)/norm(A,2)
ex = norm(del_x,2)/norm(x0,2)

