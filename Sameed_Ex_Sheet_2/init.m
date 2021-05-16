% Exercise sheet 2 , Sameed Quais
%% Linear bicycle model
length = 2.44 ;
lf = 1.04 ;
lr = 1.40 ;
c_alpha_f = 156000;
c_alpha_r = 193000;
mass = 1919;
Ix = 1700;
Iy = 2200;
Iz = 2937;
g = 9.81;
wff = 0.577;
wfr = 0.423;
delta_max = deg2rad(37.3) ;

% Initial conditions:
x0 = 0 ;
y0 = 0;
psi0 = 0*pi/180;
psid0 = 0;
v_lon0 = 5;
v_lat0 = 0;

%% For Kinematic bicycle model of Ex sheet 1 
% constants
length_rare = 1.4;
length_front = 1.04 ;
input_velocity = v_lon0;
%input_velocity = 20;
kp = -0.0235;
kd = -0.0238;

%initial conditions
initial_x0 = 0;
initial_y0 = 0 ;%-0.1; %-0.1 inorder to keep close to the reference point
initial_psi = 0;

%% steering angle inputs
steering_input_switch =  3;  % 1 = constant steering
                             % 2 = steering ramp
                             % 3 = sinusoidal steering input
steering_constant = deg2rad(10) ;
steering_rate = deg2rad(2) ;
steering_omega = 0.25 ; % sinusoidal steering frequency [Hz]
