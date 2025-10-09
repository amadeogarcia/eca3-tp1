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
for i = 1:6
    t(1,i) = (theta_1 + desf);
    desf = desf + (pi/3);
end

% Tiempos de disparo para theta 2
desf = 0;
for i = 1:6
    t(2,i) = (theta_2 + desf);
    desf = desf + (pi/3);
end

% Tiempos de disparo para theta 3
desf = 0;
for i = 1:6
    t(3,i) = (theta_3 + desf);
    desf = desf + (pi/3);
end

t = t ./ w0;

% Potencias para el R3FOC
Poc  = 5000;
Qoc1 = 500;
Qoc2 = 5000;

% Obtengo los colores por defecto del plot
colors = get(groot, 'defaultAxesColorOrder');

R_snubber = 1e5;
C_snubber = .2e-9;
%% ENSAYO OC1
% alfa = 0, deltat = 5%, Q = 500VAR
theta = 1;
deltat = deltat_1;
P = Poc; Q = Qoc1;

sim("TP1_SIM_R3FOC_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = Ucc;
icc1 = Icc;
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
plot(t1, th1(:,2)), hold on,
plot(t1, Vc, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t1, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t1, th1(:,1)), hold on,
plot(t1, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=0º, \Deltat=5%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO OC2
% alfa = 0, deltat = 5%, Q = 5000VAR
theta = 1;
deltat = deltat_1;
P = Poc; Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t2 = tout;
vc2 = Vc;
ic2 = Ic;
ucc2 = Ucc;
icc2 = Icc;
vt12 = th1(:,2);
it12 = th1(:,1);
vdisp2 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t2, vs(:,1), '--'), hold on,
plot(t2, vs(:,2), '--'), hold on,
plot(t2, vs(:,3), '--'), hold on,
plot(t2, th1(:,2)), hold on,
plot(t2, Vc, 'LineWidth', 1.5), hold on,
plot(t2, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t2, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t2, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t2, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t2, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t2, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t2, th1(:,1)), hold on,
plot(t2, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=0º, \Deltat=5%, Q=5000VAR'], 'FontWeight', 'bold');

%% COMPARATIVA 1
% alfa=0, Q=500 vs Q=5000
figure;
xmin = 0.02; xmax = 0.04;

subplot(3,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t1, vc1, t2, vc2, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
%plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), hold on,
%plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,5), 'Color', colors(3,:)), grid on,
%plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
legend('vs1', 'vs2', 'vs3', 'vc(Q=500)', 'vc(Q=5000)'),
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),

subplot(3,1,2)
plot(tout, vs(:,1)-vs(:,3), '--k'), hold on,
%plot(tout, vs(:,2)-vs(:,1), '--'), hold on,
plot(tout, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t1, vt11, t2, vt12), grid on,
legend('vs1-vs2', 'vs1-vs3', 'vt1(Q=500)', 'vt1(Q=5000)')
axis([xmin xmax -inf inf]), ylabel('Tension [V]')

subplot(3,1,3),
%plot(t1, it11, t2, it12), hold on,
plot(t1, ic1, t2, ic2, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('ic(Q=500)', 'ic(Q=5000)'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

median(ucc1)
median(ucc2)
median(icc1)
median(icc2)

sgtitle(['Comparacion del R3FOC controlado con: ' ...
    '\alpha=0º, \Deltat=5% para distintas Q'], 'FontWeight', 'bold');

%% ENSAYO OC3
% alfa = 0, deltat = 35%, Q = 500VAR
theta = 1;
deltat = deltat_2;
P = Poc; Q = Qoc1;

sim("TP1_SIM_R3FOC_ctrl");
t3 = tout;
vc3 = Vc;
ic3 = Ic;
ucc3 = Ucc;
icc3 = Icc;
vt13 = th1(:,2);
it13 = th1(:,1);
vdisp3 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t3, vs(:,1), '--'), hold on,
plot(t3, vs(:,2), '--'), hold on,
plot(t3, vs(:,3), '--'), hold on,
plot(t3, th1(:,2)), hold on,
plot(t3, Vc, 'LineWidth', 1.5), hold on,
plot(t3, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t3, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t3, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t3, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t3, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t3, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t3, th1(:,1)), hold on,
plot(t3, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=0º, \Deltat=35%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO OC4
% alfa = 0, deltat = 35%, Q = 5000VAR
theta = 1;
deltat = deltat_2;
P = Poc; Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t4 = tout;
vc4 = Vc;
ic4 = Ic;
ucc4 = Ucc;
icc4 = Icc;
vt14 = th1(:,2);
it14 = th1(:,1);
vdisp4 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t4, vs(:,1), '--'), hold on,
plot(t4, vs(:,2), '--'), hold on,
plot(t4, vs(:,3), '--'), hold on,
plot(t4, th1(:,2)), hold on,
plot(t4, Vc, 'LineWidth', 1.5), hold on,
plot(t4, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t4, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t4, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t4, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t4, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t4, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t4, th1(:,1)), hold on,
plot(t4, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=0º, \Deltat=35%, Q=5000VAR'], 'FontWeight', 'bold');

%% ENSAYO OC5
% alfa = 60, deltat = 5%, Q = 500VAR
theta = 2;
deltat = deltat_1;
P = Poc; Q = Qoc1;

sim("TP1_SIM_R3FOC_ctrl");
t5 = tout;
vc5 = Vc;
ic5 = Ic;
ucc5 = Ucc;
icc5 = Icc;
vt15 = th1(:,2);
it15 = th1(:,1);
vdisp5 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t5, vs(:,1), '--'), hold on,
plot(t5, vs(:,2), '--'), hold on,
plot(t5, vs(:,3), '--'), hold on,
plot(t5, th1(:,2)), hold on,
plot(t5, Vc, 'LineWidth', 1.5), hold on,
plot(t5, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t5, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t5, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t5, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t5, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t5, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t5, th1(:,1)), hold on,
plot(t5, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO OC6
% alfa = 60, deltat = 5%, Q = 5000VAR
theta = 2;
deltat = deltat_1;
P = Poc; Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t6 = tout;
vc6 = Vc;
ic6 = Ic;
ucc6 = Ucc;
icc6 = Icc;
vt16 = th1(:,2);
it16 = th1(:,1);
vdisp6 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t6, vs(:,1), '--'), hold on,
plot(t6, vs(:,2), '--'), hold on,
plot(t6, vs(:,3), '--'), hold on,
plot(t6, th1(:,2)), hold on,
plot(t6, Vc, 'LineWidth', 1.5), hold on,
plot(t6, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t6, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t6, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t6, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t6, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t6, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t6, th1(:,1)), hold on,
plot(t6, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=60º, \Deltat=5%, Q=5000VAR'], 'FontWeight', 'bold');

%% ENSAYO OC7
% alfa = 60, deltat = 35%, Q = 500VAR
theta = 2;
deltat = deltat_2;
P = Poc; Q = Qoc1;

sim("TP1_SIM_R3FOC_ctrl");
t7 = tout;
vc7 = Vc;
ic7 = Ic;
ucc7 = Ucc;
icc7 = Icc;
vt17 = th1(:,2);
it17 = th1(:,1);
vdisp7 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t7, vs(:,1), '--'), hold on,
plot(t7, vs(:,2), '--'), hold on,
plot(t7, vs(:,3), '--'), hold on,
plot(t7, th1(:,2)), hold on,
plot(t7, Vc, 'LineWidth', 1.5), hold on,
plot(t7, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t7, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t7, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t7, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t7, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t7, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t7, th1(:,1)), hold on,
plot(t7, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=60º, \Deltat=35%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO OC8
% alfa = 60, deltat = 35%, Q = 5000VAR
theta = 2;
deltat = deltat_2;
P = Poc; Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t8 = tout;
vc8 = Vc;
ic8 = Ic;
ucc8 = Ucc;
icc8 = Icc;
vt18 = th1(:,2);
it18 = th1(:,1);
vdisp8 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t8, vs(:,1), '--'), hold on,
plot(t8, vs(:,2), '--'), hold on,
plot(t8, vs(:,3), '--'), hold on,
plot(t8, th1(:,2)), hold on,
plot(t8, Vc, 'LineWidth', 1.5), hold on,
plot(t8, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t8, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t8, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t8, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t8, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t8, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t8, th1(:,1)), hold on,
plot(t8, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');
sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=60º, \Deltat=35%, Q=5000VAR'], 'FontWeight', 'bold');

%% COMPARATIVA 2
% alfa=60, deltat_1 vs deltat_2, Q=500
figure;
xmin = 0.02; xmax = 0.04;

subplot(2,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t5, vc5, 'LineWidth', 1.5), hold on,
plot(t5, 200.*vdisp5(:,1), 'Color', colors(1,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t5, 200.*vdisp5(:,3), 'Color', colors(2,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t5, 200.*vdisp5(:,5), 'Color', colors(3,:), 'LineWidth', 1), grid on,
%plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
legend('vs1', 'vs2', 'vs3', 'vc(Q=500)'),
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),

subplot(2,1,2)
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t7, vc7, 'LineWidth', 1.5), hold on,
plot(t7, 200.*vdisp7(:,1), 'Color', colors(1,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t7, 200.*vdisp7(:,3), 'Color', colors(2,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t7, 200.*vdisp7(:,5), 'Color', colors(3,:), 'LineWidth', 1), grid on,
%plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
legend('vs1', 'vs2', 'vs3', 'vc(Q=500)'),
axis([xmin xmax -inf inf]), ylabel('Tension [V]'), xlabel('Tiempo [s]')

sgtitle(['Comparacion del R3FOC controlado con: ' ...
    '\alpha=60º, Q=500VAr, para \Deltat=5% vs. \Deltat=35%'], 'FontWeight', 'bold');

%% COMPARATIVA 3
% alfa=60, Q=500 vs Q=5000
figure;
xmin = 0.02; xmax = 0.04;

subplot(3,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t7, vc7, t8, vc8, 'LineWidth', 1.5), hold on,
plot(t7, 200.*vdisp7(:,1), 'Color', colors(1,:)), hold on,
%plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t7, 200.*vdisp7(:,3), 'Color', colors(2,:)), hold on,
%plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t7, 200.*vdisp7(:,5), 'Color', colors(3,:)), grid on,
%plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
legend('vs1', 'vs2', 'vs3', 'vc(Q=500)', 'vc(Q=5000)'),
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),

subplot(3,1,2)
plot(tout, vs(:,1)-vs(:,3), '--k'), hold on,
%plot(tout, vs(:,2)-vs(:,1), '--'), hold on,
plot(tout, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t7, vt17, t8, vt18), grid on,
legend('vs1-vs2', 'vs1-vs3', 'vt1(Q=500)', 'vt1(Q=5000)')
axis([xmin xmax -inf inf]), ylabel('Tension [V]')

subplot(3,1,3),
%plot(t1, it11, t2, it12), hold on,
plot(t7, ic7, t8, ic8, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('ic(Q=500)', 'ic(Q=5000)'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Comparacion del R3FOC controlado con: ' ...
    '\alpha=60º, \Deltat=35% para distintas Q'], 'FontWeight', 'bold');

median(ucc7)
median(ucc8)
median(icc7)
median(icc8)

%% ENSAYO OC9
% alfa = 90, deltat = 5%, Q = 500VAR
theta = 3;
deltat = deltat_1;
P = Poc; Q = Qoc1;

sim("TP1_SIM_R3FOC_ctrl");
t9 = tout;
vc9 = Vc;
ic9 = Ic;
ucc9 = Ucc;
icc9 = Icc;
vt19 = th1(:,2);
it19 = th1(:,1);
vdisp9 = vdisp;

% figure;
% xmin = 0.02; xmax = 0.06;
% 
% subplot(2,1,1),
% plot(t9, vs(:,1), '--'), hold on,
% plot(t9, vs(:,2), '--'), hold on,
% plot(t9, vs(:,3), '--'), hold on,
% plot(t9, th1(:,2)), hold on,
% plot(t9, Vc, 'LineWidth', 1.5), hold on,
% plot(t9, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
% plot(t9, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
% plot(t9, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
% plot(t9, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
% plot(t9, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
% plot(t9, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
% axis([xmin xmax -inf inf]),
% legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
% xlabel('Tiempo [s]'), ylabel('Tension [V]');
% 
% subplot(2,1,2),
% plot(t9, th1(:,1)), hold on,
% plot(t9, Ic, 'LineWidth', 1.5), grid on,
% axis([xmin xmax -inf inf]),
% legend('it1', 'ic'),
% xlabel('Tiempo [s]'), ylabel('Corriente [A]');
% 
% sgtitle(['Ensayo del R3FOC controlado con: ' ...
%     '\alpha=90º, \Deltat=5%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO OC10
% alfa = 90, deltat = 5%, Q = 5000VAR
theta = 3;
deltat = deltat_1;
P = Poc; Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t10 = tout;
vc10 = Vc;
ic10 = Ic;
ucc10 = Ucc;
icc10 = Icc;
vt110 = th1(:,2);
it110 = th1(:,1);
vdisp10 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t10, vs(:,1), '--'), hold on,
plot(t10, vs(:,2), '--'), hold on,
plot(t10, vs(:,3), '--'), hold on,
plot(t10, th1(:,2)), hold on,
plot(t10, Vc, 'LineWidth', 1.5), hold on,
plot(t10, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
plot(t10, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
plot(t10, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
plot(t10, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
plot(t10, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
plot(t10, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
plot(t10, th1(:,1)), hold on,
plot(t10, Ic, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    '\alpha=90º, \Deltat=5%, Q=5000VAR'], 'FontWeight', 'bold');

%% ENSAYO OC11
% alfa = 90, deltat = 35%, Q = 500VAR
theta = 3;
deltat = deltat_2;
P = Poc; Q = Qoc1;

sim("TP1_SIM_R3FOC_ctrl");
t11 = tout;
vc11 = Vc;
ic11 = Ic;
ucc11 = Ucc;
icc11 = Icc;
vt111 = th1(:,2);
it111 = th1(:,1);
vdisp11 = vdisp;

% figure;
% xmin = 0.02; xmax = 0.06;
% 
% subplot(2,1,1),
% plot(t11, vs(:,1), '--'), hold on,
% plot(t11, vs(:,2), '--'), hold on,
% plot(t11, vs(:,3), '--'), hold on,
% plot(t11, th1(:,2)), hold on,
% plot(t11, Vc, 'LineWidth', 1.5), hold on,
% plot(t11, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
% plot(t11, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
% plot(t11, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
% plot(t11, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
% plot(t11, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
% plot(t11, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
% axis([xmin xmax -inf inf]),
% legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
% xlabel('Tiempo [s]'), ylabel('Tension [V]');
% 
% subplot(2,1,2),
% plot(t11, th1(:,1)), hold on,
% plot(t11, Ic, 'LineWidth', 1.5), grid on,
% axis([xmin xmax -inf inf]),
% legend('it1', 'ic'),
% xlabel('Tiempo [s]'), ylabel('Corriente [A]');
% 
% sgtitle(['Ensayo del R3FOC controlado con: ' ...
%     '\alpha=90º, \Deltat=35%, Q=500VAR'], 'FontWeight', 'bold');

%% ENSAYO OC12
% alfa = 90, deltat = 35%, Q = 5000VAR
theta = 3;
deltat = deltat_2;
P = Poc; Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t12 = tout;
vc12 = Vc;
ic12 = Ic;
ucc12 = Ucc;
icc12 = Icc;
vt112 = th1(:,2);
it112 = th1(:,1);
vdisp12 = vdisp;

% figure;
% xmin = 0.02; xmax = 0.06;
% 
% subplot(2,1,1),
% plot(t12, vs(:,1), '--'), hold on,
% plot(t12, vs(:,2), '--'), hold on,
% plot(t12, vs(:,3), '--'), hold on,
% plot(t12, th1(:,2)), hold on,
% plot(t12, Vc, 'LineWidth', 1.5), hold on,
% plot(t12, 200.*vdisp(:,1), 'Color', colors(1,:)), hold on,
% plot(t12, 200.*vdisp(:,2), 'Color', colors(3,:)), hold on,
% plot(t12, 200.*vdisp(:,3), 'Color', colors(2,:)), hold on,
% plot(t12, 200.*vdisp(:,4), 'Color', colors(1,:)), hold on,
% plot(t12, 200.*vdisp(:,5), 'Color', colors(3,:)), hold on,
% plot(t12, 200.*vdisp(:,6), 'Color', colors(2,:)), grid on,
% axis([xmin xmax -inf inf]),
% legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
% xlabel('Tiempo [s]'), ylabel('Tension [V]');
% 
% subplot(2,1,2),
% plot(t12, th1(:,1)), hold on,
% plot(t12, Ic, 'LineWidth', 1.5), grid on,
% axis([xmin xmax -inf inf]),
% legend('it1', 'ic'),
% xlabel('Tiempo [s]'), ylabel('Corriente [A]');
% 
% sgtitle(['Ensayo del R3FOC controlado con: ' ...
%     '\alpha=90º, \Deltat=35%, Q=5000VAR'], 'FontWeight', 'bold');

%% COMPARATIVA 4
% alfa=90, deltat_1 vs deltat_2, Q=500
figure;
xmin = 0.02; xmax = 0.04;

subplot(2,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t9, vc9, 'LineWidth', 1.5), hold on,
plot(t9, 200.*vdisp9(:,1), 'Color', colors(1,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t9, 200.*vdisp9(:,3), 'Color', colors(2,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t9, 200.*vdisp9(:,5), 'Color', colors(3,:), 'LineWidth', 1), grid on,
%plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
legend('vs1', 'vs2', 'vs3', 'vc(Q=500)'),
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),

subplot(2,1,2)
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t11, vc11, 'LineWidth', 1.5), hold on,
plot(t11, 200.*vdisp11(:,1), 'Color', colors(1,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t11, 200.*vdisp11(:,3), 'Color', colors(2,:), 'LineWidth', 1), hold on,
%plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t11, 200.*vdisp11(:,5), 'Color', colors(3,:), 'LineWidth', 1), grid on,
%plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
legend('vs1', 'vs2', 'vs3', 'vc(Q=500)'),
axis([xmin xmax -inf inf]), ylabel('Tension [V]'), xlabel('Tiempo [s]')

sgtitle(['Comparacion del R3FOC controlado con: ' ...
    '\alpha=90º, Q=500VAr, para \Deltat=5% vs. \Deltat=35%'], 'FontWeight', 'bold');

%% COMPARATIVA 5
% alfa=90, Q=500 vs Q=5000
figure;
xmin = 0.02; xmax = 0.04;
C_snubber = 250e-9;

subplot(3,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t11, vc11, t12, vc12, 'LineWidth', 1.5), hold on,
plot(t11, 200.*vdisp11(:,1), 'Color', colors(1,:)), hold on,
% plot(t11, 200.*vdisp11(:,2), 'Color', colors(3,:)), hold on,
plot(t11, 200.*vdisp11(:,3), 'Color', colors(2,:)), hold on,
% plot(t11, 200.*vdisp11(:,4), 'Color', colors(1,:)), hold on,
plot(t11, 200.*vdisp11(:,5), 'Color', colors(3,:)), grid on,
% plot(t11, 200.*vdisp11(:,6), 'Color', colors(2,:)), grid on,
legend('vs1', 'vs2', 'vs3', 'vc(Q=500)', 'vc(Q=5000)'),
axis([xmin xmax -inf inf]), ylabel('Tension [V]'),

subplot(3,1,2)
plot(tout, vs(:,1)-vs(:,3), '--k'), hold on,
%plot(tout, vs(:,2)-vs(:,1), '--'), hold on,
plot(tout, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t11, vt111, t12, vt112), grid on,
legend('vs1-vs2', 'vs1-vs3', 'vt11(Q=500)', 'vt11(Q=5000)')
axis([xmin xmax -inf inf]), ylabel('Tension [V]')

subplot(3,1,3),
%plot(t11, it111, t12, it112), hold on,
plot(t11, ic11, t12, ic12, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('ic(Q=500)', 'ic(Q=5000)'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Comparacion del R3FOC controlado con: ' ...
    '\alpha=90º, \Deltat=35% para distintas Q'], 'FontWeight', 'bold');

median(ucc11)
median(ucc12)
median(icc11)
median(icc12)

%% ENSAYO CON t1=0, alfa=0
% alfa = 0, Q = 500VAR
theta = 1;
deltat = deltat_1;
P = Poc; Q = Qoc1;
t(theta,1)=0;

sim("TP1_SIM_R3FOC_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = Ucc;
icc1 = Icc;
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t2 = tout;
vc2 = Vc;
ic2 = Ic;
ucc2 = Ucc;
icc2 = Icc;
vt12 = th1(:,2);
it12 = th1(:,1);
vdisp2 = vdisp;

Q = Qoc1; deltat = deltat_2;

sim("TP1_SIM_R3FOC_ctrl");
t3 = tout;
vc3 = Vc;
ic3 = Ic;
ucc3 = Ucc;
icc3 = Icc;
vt13 = th1(:,2);
it13 = th1(:,1);
vdisp3 = vdisp;

figure;
xmin = 0.02; xmax = 0.04;

subplot(3,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]'),
title('Q=500VAr');

subplot(3,1,2),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t2, vc2, 'LineWidth', 1.5), hold on,
plot(t2, 200.*vdisp2(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t2, 200.*vdisp2(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t2, 200.*vdisp2(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]'),
title('Q=5000VAr');

subplot(3,1,3),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t3, vc3, 'LineWidth', 1.5), hold on,
plot(t3, 200.*vdisp3(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t3, 200.*vdisp3(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t3, 200.*vdisp3(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]'),
title('\Deltat=35%');

sgtitle(['Tensiones del R3FOC controlado con: ' ...
    '\alpha=0º, t_1=0'], 'FontWeight', 'bold');

figure;
subplot(3,1,1),
plot(t1, it11), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]'),
title('Q=500VAr');

subplot(3,1,2),
plot(t2, it12), hold on,
plot(t2, ic2, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]'),
title('Q=5000VAr');

subplot(3,1,3),
plot(t3, it13), hold on,
plot(t3, ic3, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]'),
title('\Deltat=35%');

sgtitle(['Corrientes del R3FOC controlado con: ' ...
    '\alpha=0º, t_1=0'], 'FontWeight', 'bold');

%% ENSAYO CON t1=0, alfa=60
% alfa = 0, Q = 500VAR
theta = 2;
deltat = deltat_2;
P = Poc; Q = Qoc1;
t(theta,1)=0;

sim("TP1_SIM_R3FOC_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = Ucc;
icc1 = Icc;
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t2 = tout;
vc2 = Vc;
ic2 = Ic;
ucc2 = Ucc;
icc2 = Icc;
vt12 = th1(:,2);
it12 = th1(:,1);
vdisp2 = vdisp;

figure;
xmin = 0.02; xmax = 0.04;

subplot(2,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]'),
title('Q=500VAr');

subplot(2,1,2),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t2, vc2, 'LineWidth', 1.5), hold on,
plot(t2, 200.*vdisp2(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t2, 200.*vdisp2(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t2, 200.*vdisp2(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]'),
title('Q=5000VAr');

sgtitle(['Tensiones del R3FOC controlado con: ' ...
    '\alpha=60º, \Deltat=35%, t_1=0'], 'FontWeight', 'bold');

figure;
subplot(2,1,1),
plot(t1, it11), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]'),
title('Q=500VAr');

subplot(2,1,2),
plot(t2, it12), hold on,
plot(t2, ic2, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]'),
title('Q=5000VAr');

sgtitle(['Corrientes del R3FOC controlado con: ' ...
    '\alpha=60º, \Deltat=35%, t_1=0'], 'FontWeight', 'bold');

%% ENSAYO CON t1=0, alfa=90
% alfa = 0, Q = 500VAR
theta = 3;
deltat = deltat_2;
P = Poc; Q = Qoc1;
t(theta,1)=0;

sim("TP1_SIM_R3FOC_ctrl");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = Ucc;
icc1 = Icc;
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

Q = Qoc2;

sim("TP1_SIM_R3FOC_ctrl");
t2 = tout;
vc2 = Vc;
ic2 = Ic;
ucc2 = Ucc;
icc2 = Icc;
vt12 = th1(:,2);
it12 = th1(:,1);
vdisp2 = vdisp;

figure;
xmin = 0.02; xmax = 0.04;

subplot(2,1,1),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
plot(t1, 200.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]'),
title('Q=500VAr');

subplot(2,1,2),
plot(tout, vs(:,1), '--'), hold on,
plot(tout, vs(:,2), '--'), hold on,
plot(tout, vs(:,3), '--'), hold on,
plot(t2, vc2, 'LineWidth', 1.5), hold on,
plot(t2, 200.*vdisp2(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 200.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
plot(t2, 200.*vdisp2(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t2, 200.*vdisp2(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]'),
title('Q=5000VAr');

sgtitle(['Tensiones del R3FOC controlado con: ' ...
    '\alpha=90º, \Deltat=35%, t_1=0'], 'FontWeight', 'bold');

figure;
subplot(2,1,1),
plot(t1, it11), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]'),
title('Q=500VAr');

subplot(2,1,2),
plot(t2, it12), hold on,
plot(t2, ic2, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]'),
title('Q=5000VAr');

sgtitle(['Corrientes del R3FOC controlado con: ' ...
    '\alpha=90º, \Deltat=35%, t_1=0'], 'FontWeight', 'bold');

%% ENSAYO CON Vt1=0, alfa=0
% alfa = 0, Q = 500VAR
theta=1;
deltat = deltat_1;
Q = Qoc1;

sim("TP1_SIM_R3FOC_ctrl_FallaCC");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
ucc1 = Ucc;
icc1 = Icc;
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
plot(t1, 200.*vdisp1(:,3), 'Color', colors(2,:)), hold on,
plot(t1, 200.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
plot(t1, 200.*vdisp1(:,5), 'Color', colors(3,:)), hold on,
plot(t1, 200.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc'), ylabel('Tension [V]');

subplot(3,1,2),
plot(t1, vs(:,1)-vs(:,3), '--k'), hold on,
%plot(tout, vs(:,2)-vs(:,1), '--'), hold on,
plot(t1, vs(:,1)-vs(:,2), '--r'), hold on,
plot(t1, vt11), grid on,
legend('vs1-vs2', 'vs1-vs3', 'vt1')
axis([xmin xmax -inf inf]), ylabel('Tension [V]');

subplot(3,1,3),
plot(t1, it11), hold on,
plot(t1, -is1), hold on,
plot(t1, ic1, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'If(A)', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

sgtitle(['Ensayo del R3FOC controlado con: ' ...
    'T1 en cortocircuito, Q = 500VAr'], 'FontWeight', 'bold');