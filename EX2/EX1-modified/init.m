% constants
length_rare = 1.4;
length_front = 1.04 ;
input_velocity = 100;
kp = -0.0235;
kd = -0.0238;

%initial conditions
initial_x0 = 0;
initial_y0 = -0.1; %-0.1 inorder to keep close to the reference point
initial_psi = 0;

%steering angle inputs
steering_input_switch =  1;  % 1 = constant steering
                             % 2 = steering ramp
                             % 3 = sinusoidal steering input
steering_constant = deg2rad(10) ;
steering_rate = deg2rad(2) ;
steering_omega = 0.25 ; % sinusoidal steering frequency [Hz]
delta_max = deg2rad(37.3) ;