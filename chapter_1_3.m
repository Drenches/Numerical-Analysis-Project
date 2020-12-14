%% �ڶ��� ��3��
clear;clc;

% ��ֵ�ڵ�
X = [0 1 4 9 16 25 36 49 64];
Y = [0 1 2 3 4 5 6 7 8];

%% L8
m = length(X);
L = ones(m,m);
for k = 1 : m
    V = 1;
    for i = 1 : m
        if k ~= i
            V = conv(V,poly(X(i))) / (X(k) - X(i));
        end
    end
    L1(k, :) = V; 
    l(k, :) = poly2sym(V);
end
% fprintf('������Ϊ��\n');
% for k=1:m
%     fprintf('q%d(x)=%s\n',k,l(k));
% end
L = Y * l;
disp('�������ն���ʽΪ')
L = vpa(collect(L),5)
L = matlabFunction(L);

%% S3
syms x
disp('����������ֵ����Ϊ')
pp = csape(X,Y, 'variational');%����������������
q = pp.coefs;
for i=1:4
    S = q(i,:)*[(x-X(i))^3;(x-X(i))^2;(x-X(i));1];
    S = vpa(collect(S),5)
end
%% ��ͼ
%0-64�߶�
xi = 0:64;
len = length(xi);
yi = zeros(1,len);
for i=1:len
    yi(i) = L(xi(i));
end
figure
plot(xi,yi)
hold on
plot(X,Y,'b*');
y2 = fnval(pp,xi);
plot(xi,y2,'r--');
title('64�߶���8����������������������ֵ')
%0-1�߶�
xj = 0:1;
len = length(xj);
yj = zeros(1,len);
for i=1:len
    yj(i) = L(xj(i));
end
figure
plot(xj,yj)
hold on
plot(X(1:2),Y(1:2),'b*');
y2 = fnval(pp,xj);
plot(xj,y2,'r--');
title('1�߶���8����������������������ֵ')
%% ��ֵ����Ա�
x4 = [0.1:0.1:1];
len_1 = length(x4);
y4 = zeros(1,len_1);
for i=1:len_1
    y4(i) = L(x4(i));
end
disp('׼ȷֵΪ')
sqrt(x4)
disp('���������ֵ���Ϊ')
y4
disp('ƽ��������Ϊ')
e4 = abs((y4-sqrt(x4)))./sqrt(x4);
e4 = mean(e4(:))
disp('����������ֵ���Ϊ')
y5 = fnval(pp,x4)
disp('ƽ��������Ϊ')
e5 = abs((y5-sqrt(x4)))./sqrt(x4);
e5 = mean(e5(:))
