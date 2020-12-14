%% ������ ��2��
clc;clear;
%ԭʼ����
x=[0,0.1,0.2,0.3,0.5,0.8,1.0];
y=[1.0,0.41,0.50,0.61,0.91,2.02,2.46];
scatter(x,y,'k');             %����ԭʼ����ɢ��ͼ
hold on

%�����ڲ��������
fitting = polyfit(x,y,3); %3����� ��������
disp('������Ͻ�������ϵ��Ϊ')
fitting
xi = 0:0.001:1.2;
yi = polyval(fitting,xi);   %����ʽ��ֵ
plot(xi,yi,'b');         %�۲����ݵ�

% close;

fitting2 = polyfit(x,y,4); %4����� ��������
disp('�Ĵ���Ͻ�������ϵ��Ϊ')
fitting2
xj = 0:0.001:1.2;
yj = polyval(fitting2,xj);   %����ʽ��ֵ
plot(xj,yj,'r'); 

xlabel('x');
ylabel('y');

% hold on


%% �������������
xk = [0,0.1,0.2,0.3,0.5,0.8,1.0];
yk = zeros(1, length(xk));
for i = 1:length(xk)
    yk(i) = polyval(fitting2, xk(i));
end
scatter(xk,yk,'b');             %������������ɢ��ͼ
hold on    

fitting3 = polyfit(xk,yk,2); %2����� ��������
disp('��������Ͻ�������ϵ��Ϊ')
fitting3
xl = 0:0.001:1.2;
yl = polyval(fitting3,xl);   %����ʽ��ֵ
plot(xl,yl,'k'); 


