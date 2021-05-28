%Sameed Quais Excercise Sheet 3
%Ex 2 b
m = 1900 ; %kg
length = 2.40; %m
I_z = 2900 ; %kgm2

% Car A
wf(1) = 0.6; 
wr(1) = 0.4;
c_alpha_r(1) = 100000;
c_alpha_f(1) = 100000;

% Car B
wf(2) = 0.6; 
wr(2) = 0.4;
c_alpha_r(2) = 100000;
c_alpha_f(2) = 100000;

%Car C
wf(3) = 0.6; 
wr(3) = 0.4;
c_alpha_f(3) = 100000;
c_alpha_r(3) = 150000;

%Car D
wf(4) = 0.45; 
wr(4) = 0.55;
c_alpha_f(4) = 150000;
c_alpha_r(4) = 150000;

%Car E
wf(5) = 0.5; 
wr(5) = 0.5;
c_alpha_f(5) = 140000;
c_alpha_r(5) = 160000;

v= linspace(10,60, 500);

for i= 1:5
    l_f = length * wf(i);
    l_r = length * wr(i);
    r1 = 0*v  ;
    r2 = 0*v  ;
    I1 = 0*v  ;
    I2 = 0*v  ;
    k = 0;
    for v_lon = v
        k = k +1;
        A = [ -(c_alpha_r(i)+ c_alpha_f(i)) / m/v_lon, ((c_alpha_r(i) *l_r - c_alpha_f(i) *l_f)/m/v_lon) - v_lon;
            l_r*c_alpha_r(i) - (l_f*c_alpha_f(i) / I_z/v_lon), -(l_f^2 * c_alpha_f(i) + l_r^2 *c_alpha_r(i)/ (I_z * v_lon))];
        eigen = eig(A)
        r1(k) = real(eigen(1));
        I1(k) = imag(eigen(1));
        r2(k) = real(eigen(2));
        I2(k) = imag(eigen(2));
    end
    figure()
    hold on
    plot(r1, I1)
    plot(r2, I2)

end
    


