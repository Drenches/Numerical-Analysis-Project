%% 第三章 第2题
clc;clear;
%原始数据
x=[0,0.1,0.2,0.3,0.5,0.8,1.0];
y=[1.0,0.41,0.50,0.61,0.91,2.02,2.46];
scatter(x,y,'k');             %画出原始数据散点图
hold on

%调用内部函数拟合
fitting = polyfit(x,y,3); %3次拟合 降幂排列
disp('三次拟合降幂排列系数为')
fitting
xi = 0:0.001:1.2;
yi = polyval(fitting,xi);   %多项式求值
plot(xi,yi,'b');         %观测数据点

% close;

fitting2 = polyfit(x,y,4); %4次拟合 降幂排列
disp('四次拟合降幂排列系数为')
fitting2
xj = 0:0.001:1.2;
yj = polyval(fitting2,xj);   %多项式求值
plot(xj,yj,'r'); 

xlabel('x');
ylabel('y');

% hold on


%% 求另外曲线拟合
xk = [0,0.1,0.2,0.3,0.5,0.8,1.0];
yk = zeros(1, length(xk));
for i = 1:length(xk)
    yk(i) = polyval(fitting2, xk(i));
end
scatter(xk,yk,'b');             %画出生成数据散点图
hold on    

fitting3 = polyfit(xk,yk,2); %2次拟合 降幂排列
disp('抛物线拟合降幂排列系数为')
fitting3
xl = 0:0.001:1.2;
yl = polyval(fitting3,xl);   %多项式求值
plot(xl,yl,'k'); 


