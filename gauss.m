X = (-100:1:100);
mean = 0;
variance = 5;
gaussian = (1/sqrt(2*pi*variance))*exp(-1*((X - mean).^2)/(2*variance));
plot(X,gaussian)
