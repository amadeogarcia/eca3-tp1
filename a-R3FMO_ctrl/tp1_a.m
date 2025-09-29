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
xmin = 0.02; xmax = 0.06;

subplot(3,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'), ylabel('Tension [V]');

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
    '\alpha=0º, \Deltat=5%, Q=50VAR'], 'FontWeight', 'bold');

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
xmin = 0.02; xmax = 0.06;

subplot(3,1,1),
plot(t2, vs(:,1), '--'), hold on,
plot(t2, vs(:,2), '--'), hold on,
plot(t2, vs(:,3), '--'), hold on,
plot(t2, vc2, 'LineWidth', 1.5), hold on,
plot(t2, 200.*vdisp2(:,1), 'Color', colors(1,:)), hold on,
plot(t2, 200.*vdisp2(:,2), 'Color', colors(3,:)), hold on,
plot(t2, 200.*vdisp2(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t2, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t2, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t2, vt12), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t2, it12), hold on,
plot(t2, ic2, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q=50VAR'], 'FontWeight', 'bold');

%% ENSAYO MO3
theta = 3;
deltat = deltat_1;
P = Pmo; Q = Qmo1;
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
xmin = 0.02; xmax = 0.06;

subplot(3,1,1),
plot(t3, vs(:,1), '--'), hold on,
plot(t3, vs(:,2), '--'), hold on,
plot(t3, vs(:,3), '--'), hold on,
plot(t3, vc3, 'LineWidth', 1.5), hold on,
plot(t3, 200.*vdisp3(:,1), 'Color', colors(1,:)), hold on,
plot(t3, 200.*vdisp3(:,2), 'Color', colors(3,:)), hold on,
plot(t3, 200.*vdisp3(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t3, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t3, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t3, vt13), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t3, it13), hold on,
plot(t3, ic3, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=90º, \Deltat=5%, Q=50VAR'], 'FontWeight', 'bold');

%% ENSAYO MO4
theta = 3;
deltat = deltat_2;
P = Pmo; Q = Qmo1;
C_snubber = 250e-9;

sim("TP1_SIM_R3FMO_ctrl");
t4 = tout;
vc4 = Vc;
ic4 = Ic;
ucc4 = median(Ucc)
icc4 = median(Icc)
vt14 = th1(:,2);
it14 = th1(:,1);
vdisp4 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(3,1,1),
plot(t4, vs(:,1), '--'), hold on,
plot(t4, vs(:,2), '--'), hold on,
plot(t4, vs(:,3), '--'), hold on,
plot(t4, vc4, 'LineWidth', 1.5), hold on,
plot(t4, 200.*vdisp4(:,1), 'Color', colors(1,:)), hold on,
plot(t4, 200.*vdisp4(:,2), 'Color', colors(3,:)), hold on,
plot(t4, 200.*vdisp4(:,3), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t4, vs(:,1)-vs(:,3), '--k'), hold on,
plot(t4, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t4, vt14), grid on,
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),
legend('vs1-vs2', 'vs1-vs3', 'vt1');

subplot(3,1,3),
plot(t4, it14), hold on,
plot(t4, ic4, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FMO controlado con: ' ...
    '\alpha=90º, \Deltat=35%, Q=50VAR'], 'FontWeight', 'bold');