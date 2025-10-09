%% APARTADO A
sim("apartadoA.slx");
ta = t;
vs_a = rocp_is_vs(:,2);
is_a = rocp_is_vs(:,1);
vc_a = rocp_vc_ic(:,1);

fa = figure;
fa.Position(3) = 1.25*fa.Position(3);
plot(ta, vs_a, ta, is_a, ta, vc_a), grid on,
legend('Tension de fuente', 'Corriente de fuente', 'Tension de salida'),
axis([0 0.02 -inf inf]);
saveas(fa, 'Figuras\figura1.png');

%% APARTADO B
colors = get(groot, 'defaultAxesColorOrder');


tb    = [0, 60, 60, 180, 180, 240, 240, 360, 360, 420];
vs_b  = [0,  0,  1,   1,   0,   0,  -1,  -1,   0,   0].*200;
vd1_b = [0,  0,  1,   1,   0,   0,   0,   0,   0,   0].*(-200);
vd2_b = [0,  0,  0,   0,   0,   0,   1,   1,   0,   0].*(-200);
is_b  = [0,  0,  1,   1,   0,   0,  -1,  -1,   0,   0].*10;
id1_b = [1,  1,  2,   2,   1,   1,   0,   0,   1,   1].*5;
id2_b = [1,  1,  0,   0,   1,   1,   2,   2,   1,   1].*5;
vc_b = abs(vs_b);


fb = figure;
fb.Position(3) = 2*fb.Position(3);
fb.Position(4) = 1.5*fb.Position(4);
subplot(3,1,1),
plot(tb, vs_b, 'DisplayName', 'V_s'), hold on,
plot(tb, vc_b, 'DisplayName', 'V_c'), grid on,
axis([0 420 -inf inf]),
ylabel('Tension [V]'), legend('show'),
title('Tension de salida');

subplot(3,1,2),
plot(tb, vd1_b, 'DisplayName', 'V_{d1} = V_{d4}'), hold on,
plot(tb, vd2_b, 'DisplayName', 'V_{d2} = V_{d3}'), grid on,
axis([0 420 -inf inf]),
ylabel('Tension [V]'), legend('show'),
title('Tension en los diodos');

subplot(3,1,3),
plot(tb, is_b, 'DisplayName', 'I_s'), hold on,
plot(tb, id1_b, 'DisplayName', 'I_{d1} = I_{d4}'), hold on,
plot(tb, id2_b, 'DisplayName', 'I_{d1} = I_{d4}', 'Color', colors(4,:)), grid on,
axis([0 420 -inf inf]),
xlabel('Angulo [º]'), ylabel('Corriente [A]'), legend('show'),
title('Corriente en los diodos');

saveas(fb, 'Figuras\figura2.png');