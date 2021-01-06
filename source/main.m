clc;clear;
hold on;
x1=[-1:0.1:1];
x2=[-1:0.1:1];
for i=1:21
    for j=1:21
        y(j,i)=f(x1(i),x2(j));
    end
end
contour(x1,x2,y,20)
aa=[1 0 0];
lambda=0.1;
x=[1 1]
plot(x(1),x(2),'r.');
i=1
k=1
f1(k)=f(x(1), x(2));
fold=10
while f1(k)>(1e-10) && i<fold
    k=k+1
    f1(k)=f(x(1), x(2))
    dx=df(x(1), x(2))
    x=x-lambda*dx
    f2=f(x(1), x(2));
    if f2<f1(k)
        lambda=lambda*2; 
    else
        lambda=-(lambda/abs(lambda))*0.1;
        aa=aa+[0 0.01 0];
        i=i+1;
    end
    if i==fold
        aa=[0 0 1];
    end
    plot(x(1),x(2),'.','Color',aa);
end

