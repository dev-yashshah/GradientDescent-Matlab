X = (-pi:0.01:pi);
Y = cos(X);

ext_X = [X; X.^2; X.^3; X.^4];

plot(X,Y,'.','color','b');
hold on;

w = randn(1,size(ext_X,1));
b = randn;

learningRate = 0.001;

num_samples = size(X,2);

for i=1:10000
    pCpW=zeros(1,size(ext_X,1));
    pCpB=0;

    for j=1:num_samples
        pCpW = pCpW + (w * ext_X(:,j) + b - Y(j)) * ext_X(:,j)';
        pCpB = pCpB + (w * ext_X(:,j) + b - Y(j));
    end
    
    pCpW = pCpW/num_samples;
    pCpB = pCpB/num_samples;

    w = w - learningRate * pCpW;
    
    b = b - learningRate * pCpB;
end

calc_Y = (w * ext_X) + b;
plot(X, calc_Y, '.','color','r')
hold on;