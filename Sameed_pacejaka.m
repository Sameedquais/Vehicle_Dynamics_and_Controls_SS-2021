% Q3
% Pacejka tire model
% --------------------------------------------------------------------------------------------------
% OUTPUTS
% front tire parameters: B_f, C_f, D_f, E_f
% rear tire parameters: B_r, C_r, D_r, E_r
% --------------------------------------------------------------------------------------------------


init
alpha = linspace(-0.5,+0.5,1000);
coefficient_friction = 0.95 ;


% 2) Pacejka tire model ----------------------------------------------------------------------------

Fz_f = g * (wff* mass); % weight on front tire
Fz_r = g * (wfr* mass); % weight on rear tire
                                                                                    
% 2.1) Front tire

C_f = 1.5;                    % shape factor
D_f = 4800 / (coefficient_friction * Fz_f); % peak factor
E_f = 0.5;                    % curvature factor

B_f_min = 0.001;
B_f_max = 1000;
alpha_lin = 0.0001;
while B_f_max - B_f_min > 0.001
    B_f = (B_f_max+B_f_min)/2;
    F_f_test = D_f * sin( C_f * atan( B_f*alpha_lin - E_f * (B_f*alpha_lin - atan(B_f*alpha_lin)) ) ) * coefficient_friction * Fz_f;
    if F_f_test >= c_alpha_f * alpha_lin
        B_f_max = B_f;
    else
        B_f_min = B_f;
    end
end
B_f = (B_f_max+B_f_min)/2;  % stiffness factor

F_f = D_f * sin( C_f * atan( B_f*alpha - E_f * (B_f*alpha - atan(B_f*alpha)) ) ) * coefficient_friction * Fz_f;

% 2.2) Rear tire

C_r = 1.5;                    % shape factor
D_r = 6300 / (coefficient_friction * Fz_r); % peak factor
E_r = 0.5;                  % curvature factor

B_r_min = 0.001;
B_r_max = 1000;
alpha_lin = 0.0001;
while B_r_max - B_r_min > 0.001
    B_r = (B_r_max+B_r_min)/2;
    F_r_test = D_r * sin( C_r * atan( B_r*alpha_lin - E_r * (B_r*alpha_lin - atan(B_r*alpha_lin)) ) ) * coefficient_friction * Fz_r;
    if F_r_test >= c_alpha_r * alpha_lin
        B_r_max = B_r;
    else
        B_r_min = B_r;
    end
end
B_r = (B_r_max+B_r_min)/2;  % stiffness factor

F_r = D_r * sin( C_r * atan( B_r*alpha - E_r * (B_r*alpha - atan(B_r*alpha)) ) ) * coefficient_friction * Fz_r;

% 3) Plot tire models ------------------------------------------------------------------------------

% % 3.1) Front tire
% 
 figure()
 hold on
 grid on
 title('front lateral tire force')
 plot(alpha,c_alpha_f*alpha,'k');
 plot(alpha,F_f,'r');
 axis([-0.5 0.5 -5000 5000])
 legend('linear tire force','nonlinear tire force')
 
% % 3.2) Rear tire
 figure()
 hold on
 grid on
 title('rear lateral tire force')
 plot(alpha,c_alpha_r*alpha,'k');
 plot(alpha,F_r,'r');
 axis([-0.5 0.5 -7000 7000])
 legend('linear tire force','nonlinear tire force')
