%% �����£���3��
clc;clear
A = [10 7 8 7;7 5 6 5;8 6 10 9;7 5 9 10];
newA = [10 7 8.1 7.2;7.08 5.04 6 5;8 5.98 9.89 9;6.99 5 9 9.98];
b = [32 23 33 31]';
x0 = [1 1 1 1]';
%% ���detA��A������ֵ��cond��A����
det(A)
cond(A,2)
eig(A)
%% ���ŷ���
x = newA \ b; %�Ŷ��µĽ�
del_x = x - x0; %�Ŷ��Խ��Ӱ��
norm(del_x,2); 
del_A = newA-A

eA = norm(del_A,2)/norm(A,2)
ex = norm(del_x,2)/norm(x0,2)

