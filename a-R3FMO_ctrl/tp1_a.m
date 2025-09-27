%% INICIALIZACION DE PARAMETROS
% Frecuencia fundamental = 50 Hz
w0 = 2*pi*50;

% Angulos de disparo
theta_1 = 0 + pi/6;     % alfa_1 = 0
theta_2 = pi/3 + pi/6;  % alfa_2 = pi/3
theta_3 = pi/2 + pi/6;  % alfa_3 = pi/2

% Anchos de pulso
deltat_1 = 0.05;
deltat_2 = 0.35;

% Tiempos de disparo para theta 1
t11 = (theta_1)/w0;
t21 = (theta_1 + (2/3)*pi)/w0;
t31 = (theta_1 + (4/3)*pi)/w0;

% Tiempos de disparo para theta 2
t12 = (theta_2)/w0;
t22 = (theta_2 + (2/3)*pi)/w0;
t32 = (theta_2 + (4/3)*pi)/w0;

% Tiempos de disparo para theta 3
t13 = (theta_3)/w0;
t23 = (theta_3 + (2/3)*pi)/w0;
t33 = (theta_3 + (4/3)*pi)/w0;

% Potencias para el R3FMO
Pmo  = 100;
Qmo1 = 50;
Qmo2 = 500;

%% ENSAYO MO1
% alfa = 0, deltat = 5%, Q = 50VAR
t1 = t11, t2 = t21, t3 = t31;
deltat = deltat_1;
P = Pmo, Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=0º, \Deltat=5%, Q=50VAr'], 'FontWeight', 'bold');

%% ENSAYO MO2
% alfa = 0, deltat = 5%, Q = 500VAR
t1 = t11, t2 = t21, t3 = t31;
deltat = deltat_1;
P = Pmo, Q = Qmo2;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=0º, \Deltat=5%, Q=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO3
% alfa = 0, deltat = 35%, Q = 50VAR
t1 = t11, t2 = t21, t3 = t31;
deltat = deltat_2;
P = Pmo, Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=0º, \Deltat=35%, Q=50VAr'], 'FontWeight', 'bold');

%% ENSAYO MO4
% alfa = 0, deltat = 35%, Q = 500VAR
t1 = t11, t2 = t21, t3 = t31;
deltat = deltat_2;
P = Pmo, Q = Qmo2;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=0º, \Deltat=35%, Q=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO5
% alfa = 60, deltat = 5%, Q = 50VAR
t1 = t12, t2 = t22, t3 = t32;
deltat = deltat_1;
P = Pmo, Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q=50VAr'], 'FontWeight', 'bold');

%% ENSAYO MO6
% alfa = 60, deltat = 5%, Q = 500VAR
t1 = t12, t2 = t22, t3 = t32;
deltat = deltat_1;
P = Pmo, Q = Qmo2;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.08 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,   
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO7
% alfa = 60, deltat = 35%, Q = 50VAR
t1 = t12, t2 = t22, t3 = t32;
deltat = deltat_2;
P = Pmo, Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=35%, Q=50VAr'], 'FontWeight', 'bold');

%% ENSAYO MO8
% alfa = 60, deltat = 35%, Q = 500VAR
t1 = t12, t2 = t22, t3 = t32;
deltat = deltat_2;
P = Pmo, Q = Qmo2;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=35%, Q=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO9
% alfa = 90, deltat = 5%, Q = 50VAR
t1 = t13, t2 = t23, t3 = t33;
deltat = deltat_1;
P = Pmo, Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=90º, \Deltat=5%, Q=50VAr'], 'FontWeight', 'bold');

%% ENSAYO MO10
% alfa = 90, deltat = 5%, Q = 500VAR
t1 = t13, t2 = t23, t3 = t33;
deltat = deltat_1;
P = Pmo, Q = Qmo2;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=90º, \Deltat=5%, Q=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO11
% alfa = 90, deltat = 35%, Q = 50VAR
t1 = t13, t2 = t23, t3 = t33;
deltat = deltat_2;
P = Pmo, Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=90º, \Deltat=35%, Q=50VAr'], 'FontWeight', 'bold');

%% ENSAYO MO12
% alfa = 90, deltat = 35%, Q = 500VAR
t1 = t13, t2 = t23, t3 = t33;
deltat = deltat_2;
P = Pmo, Q = Qmo2;

sim("TP1_SIM_R3FMO_ctrl");
Vt1 = th1(:,2);
It1 = th1(:,1);

figure;
subplot(2,1,1),
plot(tout, Vs1, '--', 'DisplayName', 'Vs1'), hold on,
plot(tout, Vs2, '--', 'DisplayName', 'Vs2'), hold on,
plot(tout, Vs3, '--', 'DisplayName', 'Vs3'), hold on,
plot(tout, Vc, 'LineWidth', 1.5, 'DisplayName', 'Vcarga'), hold on,
plot(tout, Vt1, 'DisplayName', 'Vt1'), hold on,
plot(tout, Ucc, ':k', 'LineWidth', 2, 'DisplayName', 'Ucc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(tout, Ic, 'LineWidth', 1.5, 'DisplayName', 'Icarga'), hold on,
plot(tout, It1, 'DisplayName', 'It1'), hold on,
plot(tout, Icc, ':k', 'LineWidth', 2, 'DisplayName', 'Icc'), grid on,
axis([0 0.16 -inf inf]),
legend('show'), xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=90º, \Deltat=35%, Q=500VAr'], 'FontWeight', 'bold');