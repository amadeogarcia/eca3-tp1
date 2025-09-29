colors = get(groot, 'defaultAxesColorOrder');

% Frecuencia electrica fundamental
we = 2*pi*50;

% Velocidad nominal (1500 rpm)
wn = 50*pi;

Vm = sqrt(2/3)*500;

% Cte. de conv. EM * Corriente de campo
KIf = 1.363;

% Corriente de armadura nominal [A]
Ian = 181;

% Tension de armadura nominal [V]
Uan = 250;

% Resistencia de armadura [ohm]
Ra = 0.198;

% Inductancia de armadura (con tau_e ~= 5ms)
La = (5e-3)*Ra;

% PARAMETROS DINAMICOS
%% A velocidad nominal
w = wn;
Ia = Ian;
Ua = Uan;
theta = 1;

Ea = Ua - Ia*Ra;

% Perdidas en la armadura [W]
Pa = Ra*Ia^2;

% Potencia reactiva de la armadura [VAr]
Qa = Ia^2 * (we*La);

% Angulo de disparo [rad]
alfa1 = acos(Ua/(1.654*Vm));
theta1 = alfa1 + (pi/6);

% Tiempos de desfasaje de los pulsos de disparo
desf = 0;
for i = 1:6
    t(theta,i) = (theta1 + desf)/we;
    desf = desf + (pi/3);
end

% Ancho de pulso de disparo [%]
deltat = 20;

sim("Simulacion");
t1 = tout;
vc1 = Vc;
ic1 = Ic;
vt11 = th1(:,2);
it11 = th1(:,1);
vdisp1 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t1, vs(:,1), '--'), hold on,
plot(t1, vs(:,2), '--'), hold on,
plot(t1, vs(:,3), '--'), hold on,
% plot(t1, vt11), hold on,
plot(t1, vc1, 'LineWidth', 1.5), hold on,
% plot(t1, 300.*vdisp1(:,1), 'Color', colors(1,:)), hold on,
% plot(t1, 300.*vdisp1(:,2), 'Color', colors(3,:)), hold on,
% plot(t1, 300.*vdisp1(:,3), 'Color', colors(2,:)), hold on,
% plot(t1, 300.*vdisp1(:,4), 'Color', colors(1,:)), hold on,
% plot(t1, 300.*vdisp1(:,5), 'Color', colors(3,:)), hold on,
% plot(t1, 300.*vdisp1(:,6), 'Color', colors(2,:)), grid on,
plot(t1, Ucc, ':k'), grid on,
axis([0 xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vc', 'Ucc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');
    
subplot(2,1,2),
% plot(t1, it11), hold on,
plot(t1, ic1, 'LineWidth', 1.5), hold on,
plot(t1, Icc, ':k'), grid on,
axis([0 xmax -inf inf]),
legend('ic', 'Icc'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');

%% A 500rpm
w = (50/3)*pi;
theta = 2;

Tl = 0.01*w^2;  % Cupla de carga
Ia = Tl / KIf;
Ea = KIf*w;
Ua = Ea+Ra*Ia;

% Perdidas en la armadura [W]
Pa = Ra*Ia^2;

% Potencia reactiva de la armadura [VAr]
Qa = Ia^2 * we*La;

% Angulo de disparo [rad]
alfa2 = acos(Ua/(1.654*Vm));
theta2 = alfa1 + (pi/6);

% Tiempos de desfasaje de los pulsos de disparo
desf = 0;
for i = 1:6
    t(theta,i) = (theta2 + desf)/we;
    desf = desf + (pi/3);
end

% Ancho de pulso de disparo [%]
deltat = 20;

sim("Simulacion");
t2 = tout;
vc2 = Vc;
ic2 = Ic;
vt12 = th1(:,2);
it12 = th1(:,1);
vdisp2 = vdisp;

figure;
xmin = 0.02; xmax = 0.06;

subplot(2,1,1),
plot(t2, vs(:,1), '--'), hold on,
plot(t2, vs(:,2), '--'), hold on,
plot(t2, vs(:,3), '--'), hold on,
% plot(t2, vt12), hold on,
plot(t2, vc2, 'LineWidth', 1.5), hold on,
% plot(t2, 300.*vdisp2(:,1), 'Color', colors(1,:)), hold on,
% plot(t2, 300.*vdisp2(:,2), 'Color', colors(3,:)), hold on,
% plot(t2, 300.*vdisp2(:,3), 'Color', colors(2,:)), hold on,
% plot(t2, 300.*vdisp2(:,4), 'Color', colors(1,:)), hold on,
% plot(t2, 300.*vdisp2(:,5), 'Color', colors(3,:)), hold on,
% plot(t2, 300.*vdisp2(:,6), 'Color', colors(2,:)), grid on,
axis([xmin xmax -inf inf]),
legend('vs1', 'vs2', 'vs3', 'vt1', 'vc'),
xlabel('Tiempo [s]'), ylabel('Tension [V]');

subplot(2,1,2),
% plot(t2, it12), hold on,
plot(t2, ic2, 'LineWidth', 1.5), grid on,
axis([xmin xmax -inf inf]),
legend('it1', 'ic'),
xlabel('Tiempo [s]'), ylabel('Corriente [A]');