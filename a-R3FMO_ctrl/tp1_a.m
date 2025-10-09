%% INICIALIZACION DE PARAMETROS
% Frecuencia fundamental = 50 Hz
w0 = 2*pi*50;

% Angulos de disparo
theta_1 = 0 + pi/6;     % alfa_1 = 0
theta_2 = pi/3 + pi/6;  % alfa_2 = pi/3
theta_3 = pi/2 + pi/6;  % alfa_3 = pi/2

% Anchos de pulso
deltat_1 = 5;
deltat_2 = 35;

% Tiempos de disparo para theta 1
desf = 0;
for i = 1:3
    t(1,i) = (theta_1 + desf);
    desf = desf + (2/3)*pi;
end

% Tiempos de disparo para theta 2
desf = 0;
for i = 1:3
    t(2,i) = (theta_2 + desf);
    desf = desf + (2/3)*pi;
end

% Tiempos de disparo para theta 3
desf = 0;
for i = 1:3
    t(3,i) = (theta_3 + desf);
    desf = desf + (2/3)*pi;
end

t = t ./ w0;

R_snubber = 400;
C_snubber = 50e-9;

% Potencias para el R3FMO
Pmo  = 100;
Qmo1 = 50;
Qmo2 = 500;

% Obtengo los colores por defecto del plot
colors = get(groot, 'defaultAxesColorOrder');

%% ENSAYO MO1
theta = 1;
deltat = deltat_1;
P = Pmo; Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = median(Ucc)
icc1 = median(Icc)
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

figure;
xmin = 0.1; xmax = 0.12;

subplot(3,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t1, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t1, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t1, vt11), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t1, ic1, 'LineWidth', 1.5), hold on,
plot(t5, ic5, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('ic(Q_1)', 'ic(Q_2)'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=0º, \Deltat=5%, Q_1 = 50VAr, Q_2 = 500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO2
theta = 2;
deltat = deltat_1;
P = Pmo; Q = Qmo1;

sim("TP1_SIM_R3FMO_ctrl");
t2 = tout;
vc2 = Vc;
ic2 = Ic;
ucc2 = median(Ucc)
icc2 = median(Icc)
vt12 = th1(:,2);
it12 = th1(:,1);
vdisp2 = vdisp;

figure;
xmin = 0.1; xmax = 0.12;

subplot(3,1,1),
plot(t2, vs(:,1), '--'), hold on,
plot(t2, vs(:,2), '--'), hold on,
plot(t2, vs(:,3), '--'), hold on,
plot(t2, vc2, t6, vc6, 'LineWidth', 1.5), hold on,
plot(t2, 200.*vdisp2(:,1), 'Color', colors(1,:)), hold on,
plot(t2, 200.*vdisp2(:,2), 'Color', colors(3,:)), hold on,
plot(t2, 200.*vdisp2(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc(Q_1)', 'vc(Q_2)'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t2, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t2, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t2, vt12, t6, vt16), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1(Q_1)', 'vt1(Q_2)');

subplot(3,1,3),
plot(t2, ic2, t6, ic6, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('ic(Q_1)', 'ic(Q_2)'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q_1=50VAR, Q_2=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO3a
theta = 3;
deltat = deltat_1;
P = Pmo; Q = Qmo1;
R_snubber = 400;
C_snubber = 50e-9;

sim("TP1_SIM_R3FMO_ctrl");
t3 = tout;
vc3 = Vc;
ic3 = Ic;
ucc3 = median(Ucc)
icc3 = median(Icc)
vt13 = th1(:,2);
it13 = th1(:,1);
vdisp3 = vdisp;

figure;
xmin = 0.02; xmax = 0.04;

subplot(3,1,1),
plot(t3, vs(:,1), '--'), hold on,
plot(t3, vs(:,2), '--'), hold on,
plot(t3, vs(:,3), '--'), hold on,
plot(t3, vc3, t7, vc7, 'LineWidth', 1.5), hold on,
plot(t3, 200.*vdisp3(:,1), 'Color', colors(1,:)), hold on,
plot(t3, 200.*vdisp3(:,2), 'Color', colors(3,:)), hold on,
plot(t3, 200.*vdisp3(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc(Q_1)', 'vc(Q_2)'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t3, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t3, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t3, vt13, t7, vt17), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1(Q_1)', 'vt1(Q_2)');

subplot(3,1,3),
plot(t3, ic3, t7, ic7, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('ic(Q_1)', 'ic(Q_2)'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q_1=50VAR, Q_2=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO3b
theta = 3;
deltat = deltat_1;
P = Pmo; Q = Qmo1;
R_snubber = 1e5;
C_snubber = .2e-9;

sim("TP1_SIM_R3FMO_ctrl");
t3 = tout;
vc3 = Vc;
ic3 = Ic;
ucc3 = median(Ucc)
icc3 = median(Icc)
vt13 = th1(:,2);
it13 = th1(:,1);
vdisp3 = vdisp;

figure;
xmin = 0.02; xmax = 0.04;

subplot(3,1,1),
plot(t3, vs(:,1), '--'), hold on,
plot(t3, vs(:,2), '--'), hold on,
plot(t3, vs(:,3), '--'), hold on,
plot(t3, vc3, t7, vc7, 'LineWidth', 1.5), hold on,
plot(t3, 200.*vdisp3(:,1), 'Color', colors(1,:)), hold on,
plot(t3, 200.*vdisp3(:,2), 'Color', colors(3,:)), hold on,
plot(t3, 200.*vdisp3(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc(Q_1)', 'vc(Q_2)'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t3, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t3, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t3, vt13, t7, vt17), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1(Q_1)', 'vt1(Q_2)');

subplot(3,1,3),
plot(t3, ic3, t7, ic7, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('ic(Q_1)', 'ic(Q_2)'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q_1=50VAR, Q_2=500VAr'], 'FontWeight', 'bold');

%% ENSAYO MO5
theta = 1;
deltat = deltat_1;
P = Pmo; Q = Qmo2;
C_snubber = 50e-9;

sim("TP1_SIM_R3FMO_ctrl");
t5 = tout;
vc5 = Vc;
ic5 = Ic;
ucc5 = median(Ucc)
icc5 = median(Icc)
vt15 = th1(:,2);
it15 = th1(:,1);
vdisp5 = vdisp;

figure;
xmin = 0.02; xmax = 0.04;

subplot(3,1,1),
plot(t5, vs(:,1), '--'), hold on,
plot(t5, vs(:,2), '--'), hold on,
plot(t5, vs(:,3), '--'), hold on,
plot(t5, vc5, 'LineWidth', 1.5), hold on,
plot(t5, 200.*vdisp5(:,1), 'Color', colors(1,:)), hold on,
plot(t5, 200.*vdisp5(:,2), 'Color', colors(3,:)), hold on,
plot(t5, 200.*vdisp5(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t5, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t5, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t5, vt15), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t5, it15), hold on,
plot(t5, ic5, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=0º, \Deltat=5%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO MO6
theta = 2;
deltat = deltat_2;
P = Pmo; Q = Qmo2;
C_snubber = 50e-9;

sim("TP1_SIM_R3FMO_ctrl");
t6 = tout;
vc6 = Vc;
ic6 = Ic;
ucc6 = median(Ucc)
icc6 = median(Icc)
vt16 = th1(:,2);
it16 = th1(:,1);
vdisp6 = vdisp;

figure;
xmin = 0.02; xmax = 0.04;

subplot(3,1,1),
plot(t6, vs(:,1), '--'), hold on,
plot(t6, vs(:,2), '--'), hold on,
plot(t6, vs(:,3), '--'), hold on,
plot(t6, vc6, 'LineWidth', 1.5), hold on,
plot(t6, 200.*vdisp6(:,1), 'Color', colors(1,:)), hold on,
plot(t6, 200.*vdisp6(:,2), 'Color', colors(3,:)), hold on,
plot(t6, 200.*vdisp6(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t6, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t6, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t6, vt16), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t6, it16), hold on,
plot(t6, ic6, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO MO7
theta = 3;
deltat = deltat_1;
P = Pmo; Q = Qmo2;
R_snubber = 1e5;
C_snubber = .2e-9;

sim("TP1_SIM_R3FMO_ctrl");
t7 = tout;
vc7 = Vc;
ic7 = Ic;
ucc7 = median(Ucc)
icc7 = median(Icc)
vt17 = th1(:,2);
it17 = th1(:,1);
vdisp7 = vdisp;

% figure;
% xmin = 0.02; xmax = 0.04;
% 
% subplot(3,1,1),
% plot(t7, vs(:,1), '--'), hold on,
% plot(t7, vs(:,2), '--'), hold on,
% plot(t7, vs(:,3), '--'), hold on,
% plot(t7, vc7, 'LineWidth', 1.5), hold on,
% plot(t7, 200.*vdisp7(:,1), 'Color', colors(1,:)), hold on,
% plot(t7, 200.*vdisp7(:,2), 'Color', colors(3,:)), hold on,
% plot(t7, 200.*vdisp7(:,3), 'Color', colors(2,:)), grid on,
% axis([xmin xmax -inf inf]),
% legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'), ylabel('Tension [V]');
% 
% subplot(3,1,2),
% plot(t7, vs(:,1)-vs(:,3), '--k'), hold on,
% plot(t7, vs(:,1)-vs(:,2), '--r'), hold on,
% plot(t7, vt17), grid on,
% axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
% legend('vs1-vs2', 'vs1-vs3', 'vt1');
% 
% subplot(3,1,3),
% plot(t7, it17), hold on,
% plot(t7, ic7, 'LineWidth', 1.5), grid on,
% axis([xmin xmax -inf inf]),
% legend('it1', 'ic'),
% xlabel('Tiempo [s]'), ylabel('Corriente [A]');
% 
% sgtitle(['Ensayo del R3FMO controlado con: ' ...
%     '\alpha=90º, \Deltat=5%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO CON t1=0, alfa=0
theta = 1;
deltat = deltat_2;
P = Pmo; Q = Qmo1;
t(theta,1) = 0;
R_snubber = 1e5;
C_snubber = .2e-9;

sim("TP1_SIM_R3FMO_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = median(Ucc)
icc1 = median(Icc)
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

figure;
xmin = 0.01; xmax = 0.04;

subplot(3,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t1, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t1, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t1, vt11), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t1, it11), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=0º, \Deltat=5%, Q = 50VAr, t_1=0'], 'FontWeight', 'bold');

%% ENSAYO CON t1=0, alfa=60
theta = 2;
deltat = deltat_2;
P = Pmo; Q = Qmo1;
t(theta,1) = 0;
R_snubber = 1e5;
C_snubber = .2e-9;

sim("TP1_SIM_R3FMO_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = median(Ucc)
icc1 = median(Icc)
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

figure;
xmin = 0.01; xmax = 0.04;

subplot(3,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t1, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t1, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t1, vt11), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t1, it11), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=35%, Q = 50VAr, t_1=0'], 'FontWeight', 'bold');

%% ENSAYO CON t1=0, alfa=90
theta = 3;
deltat = deltat_2;
P = Pmo; Q = Qmo1;
t(theta,1) = 0;
R_snubber = 1e5;
C_snubber = .2e-9;

sim("TP1_SIM_R3FMO_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = median(Ucc)
icc1 = median(Icc)
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

figure;
xmin = 0.01; xmax = 0.04;

subplot(3,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t1, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t1, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t1, vt11), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t1, it11), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=90º, \Deltat=35%, Q = 50VAr, t_1=0'], 'FontWeight', 'bold');

%% ENSAYO CON Vt1=0
theta = 1;
deltat = deltat_1;
P = Pmo; Q = Qmo1;
R_snubber = 1e5;
C_snubber = .2e-9;

sim("TP1_SIM_R3FMO_ctrl_FallaCC.slx");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = median(Ucc)
icc1 = median(Icc)  
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

figure;
xmin = 0.01; xmax = 0.04;

subplot(3,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t1, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t1, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t1, vt11), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t1, it11), hold on,
plot(t1, -is1), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'If(A)', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    'T1 en cortocircuito, Q = 50VAr'], 'FontWeight', 'bold');