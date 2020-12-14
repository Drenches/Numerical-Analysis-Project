%% 第2章 第1题
clear; clc;

% 插值节点
h = 0.2;
X = 0.2 : h : 1.0;
Y = [0.98, 0.92, 0.81, 0.64, 0.38];

%% P4
% 计算各阶差分
n = length(X) - 1;
p = zeros(n+1,n+1);
p(:,1) = Y(:);
for k = 1 : n
    p(1:n-k+1,k+1) = diff(p(1:n-k+2,k));
end
q = p(1,:);

%计算p4(xi),差分形式
x = 0.2 * ones(1,4);
l = [0, 1, 11, 10];
x = x + 0.08*l;
t = zeros(1,4);
for k=1:4
    t(k) = (x(k)-X(1))/h;
end
y = zeros(1,4);
y = y + q(1); 
for j=1:4
    z = 1;
    for k = 1:4 % 这里是 4，不是 n(=5)
        z = z*(t(j)-k+1)/k;
        y(j) = y(j) + z*q(k+1);
    end
end
disp('4次Newton插值的计算结果为')
y

%给出p4，差商形式
syms x df d;
df(1) = 1;
d(1) = Y(1);
c = Y(:);
n = length(X);
for j=2:n
    for i=n:-1:j
        c(i) = (c(i)-c(i-1))/(X(i)-X(i-j+1));
    end
end
for i=2:n
    df(i) = df(i-1)*(x-X(i-1));
    d(i) = c(i)*df(i);
end
disp('4次Newton插值多项式为')
P4 = vpa(collect(sum(d)),5)
%% S3
syms x
disp('三次样条插值函数为')
pp = csape(X,Y, 'variational');%调用三次样条函数
q = pp.coefs;
for i=1:4
    S = q(i,:)*[(x-X(i))^3;(x-X(i))^2;(x-X(i));1];
    S = vpa(collect(S),5)
end
%% 求解绘图
figure
x2 = 0.2:0.08:1.08;
dot = [1 2 11 12];
z = x2(dot);
p4 = zeros(1,4);
ezplot(P4, [0.2,1.08]);
hold on
y2 = fnval(pp,x2);
y3 = matlabFunction(P4);
y4 = fnval(pp,z);
plot(x2,y2,'r--')
plot(z, y4,'kp')
for i=1:4
    p4(i) = y3(z(i));
end
plot(z,p4,'b*')
title('4次牛顿插值及三次样条')






