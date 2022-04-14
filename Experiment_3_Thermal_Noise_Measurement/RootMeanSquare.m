t = 0:0.001:1-0.001;
x = cos(2*pi*100*t);

y1 = rms(x)

y2 = sqrt(mean((x-mean(x)).^2))
