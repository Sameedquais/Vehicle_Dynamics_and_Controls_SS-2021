%Ex sheet 3 
%% q3 b
init

l = 2.68 ; %m
l_f = 1.58; %m
l_r = 1.10; %m
c_alpha_f = 80000; % N/rad
c_alpha_r = 80000; % N/ra
m = 1573; %kg
Iz = 2873; %kgm2
v_lon = 120*10^3 / 3600; %m/sec

A = [-(c_alpha_r + c_alpha_f)/ (m*v_lon), ((c_alpha_r*l_r - c_alpha_f*l_f)/m*v_lon) - v_lon;
    (c_alpha_r*l_r - c_alpha_f*l_f)/Iz*v_lon, -(c_alpha_r*(l_r^2)+c_alpha_f*(l_f^2))/Iz*v_lon];
e = eig(A);
B = [c_alpha_f/m ;
    (c_alpha_f*l_f)/Iz];
C = [0, 1];
D = [ 0 ];
sys = ss(A, B, C, D);
%% For checking the open loop system is stable or not
pzmap(sys)

%% Check system controallability through controllability matrix
% ref: https://www.mathworks.com/help/control/ref/ss.ctrb.html
% Compute controllability matrix
Co = ctrb(A,B);

% Determine the number of uncontrollable states
unco = length(A) - rank(Co)

%% Check system observability
Ob = obsv(A,C);
unob = length(A) - rank(Ob)

%% q3f
%condition 1
cond_1 = (Iz*(c_alpha_r + c_alpha_f)+m*(c_alpha_f*(l_f^2)+c_alpha_r*(l_r)^2))/(m*v_lon*c_alpha_f*l_f)
%condition 2
cond_2 = (m*(v_lon^2)*(c_alpha_r*l_r - c_alpha_f*l_f)+ (c_alpha_f * c_alpha_r)*(l^2)/ (v_lon* c_alpha_f*c_alpha_r*l))

%% q3g
k = -0.01;
K = [0 k];
e_cl = eig(A+B*K)
b = (Iz*(c_alpha_r + c_alpha_f)+m*(c_alpha_f*(l_f^2)+c_alpha_r*(l_r)^2))/(m*Iz*v_lon)- ((c_alpha_f*l_f*k)/Iz);
c = (m*(v_lon^2)*(c_alpha_r*l_r - c_alpha_f*l_f)+ (c_alpha_f * c_alpha_r)*(l^2)/ (m*Iz*(v_lon)^2)) - (c_alpha_f*c_alpha_r*l*k)/m*Iz*v_lon;
e_verify = roots([1,b,c])

a_lat = 4;
l = 2.40 ;
% Car A
wf(1) = 0.6; 
wr(1) = 0.4;
c_alpha_f(1) = 100000;
c_alpha_r(1) = 100000;

R = 400;

delta_kin = atan(l/R);
k = (wf(1)/c_alpha_f(1)) - (wr(1)/c_alpha_r(1));
delta = delta_kin + k * (v_lon^2/R);
%init
%mass = 1900;
%length = 2.4;
%Iz = 2900;
steering_rate = delta;
sim('Linear_Bicycle_Model');
plot(out.output_omega.Time, out.output_omega.Data)










