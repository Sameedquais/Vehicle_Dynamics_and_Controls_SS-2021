% Ex sheet 3 q2d,e
v_lon = 20
a_lat = 4;
length = 2.40 ;
% Car A
wf(1) = 0.6; 
wr(1) = 0.4;
c_alpha_f(1) = 100000;
c_alpha_r(1) = 100000;

% Car B
wf(2) = 0.65; 
wr(2) = 0.35;
c_alpha_f(2) = 150000;
c_alpha_r(2) = 150000;

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

R = 0 * v_lon;
R = [400 400 400];
R = 400
k =  zeros(3,5);
delta = zeros(3,5);
figure()

for i=1:1
    R(i) = v_lon(i)^2 / a_lat ;
    delta_kin = atan(length/R(i));
    for j = 1:1 % number of cars
        k(i,j) = (wf(j)/c_alpha_f(j)) - (wr(j)/c_alpha_r(j));
        delta(i,j) = delta_kin + k(i,j) * a_lat;
    end
    init
    mass = 1900;
    length = 2.4;
    Iz = 2900;
    for t = 1:1
        steering_constant = delta(i,t);
        sim('Linear_Bicycle_Model');
        plot(out.output_omega.Time, out.output_omega.Data)
        hold on
    end
    hold off
end
