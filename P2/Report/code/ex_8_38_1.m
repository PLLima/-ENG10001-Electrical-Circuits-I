% Gerando a Representacao em Espaco de Estados
A = [-800 -4000; 62.5 0];
B = [400; 0];
C1 = [1 0];
C2 = [0 1];
C3 = [-1 0];
D1 = [0];
D2 = [0];
D3 = [1];

% Condicoes iniciais
x0 = [40; 10];

% Colocando as representacoes em um sistema do MATLAB
rep1 = ss(A, B, C1, D1);
rep2 = ss(A, B, C2, D2);
rep3 = ss(A, B, C3, D3);

% Gerando amostras de tempo adequadas para visualizacao
tsim = 0:0.001:1;
t1 = 0:0.001:0.1;
t2 = 0:0.001:0.1;
t3 = 0:0.001:0.1;

% Resposta do exercicio
Il = 8 + exp(-400*tsim).*(2*cos(300*tsim) + 11*sin(300*tsim));

% Gerando as entradas
u = 80 * heaviside(tsim);
u(1) = 80;

% Resolvendo os sistemas de EDOs
[y1, to1, x1] = lsim(rep1, u, tsim, x0);
[y2, to2, x2] = lsim(rep2, u, tsim, x0);
[y3, to3, x3] = lsim(rep3, u, tsim, x0);

% Gerando o grafico da primeira saida (salvando em PDF)
h = figure;
plot(t1, y1(1:size(t1, 2)), 'b');
xlabel('Tempo [s]');
ylabel('Tensao no Capacitor [V]');
title('Saida no Capacitor');
grid on;
filename = 'plot_8_38_1_y1';
filepath = '../images/plots/';
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(h,fullfile(filepath, filename),'-dpdf','-r0');

% Gerando o grafico da segunda saida (salvando em PDF)
h = figure;
plot(t2, y2(1:size(t2, 2)), 'b', t2, Il(1:size(t2, 2)), 'r--');
xlabel('Tempo [s]');
ylabel('Corrente no Indutor [A]');
title('Saida no Indutor');
legend('Espaco de Estados', 'Gabarito do Exercicio');
grid on;
filename = 'plot_8_38_1_y2';
filepath = '../images/plots/';
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(h,fullfile(filepath, filename),'-dpdf','-r0');

% Gerando o grafico da terceira saida (salvando em PDF)
h = figure;
plot(t3, y3(1:size(t3, 2)), 'b');
xlabel('Tempo [s]');
ylabel('Tensao no Resistor [V]');
title('Saida no Resistor');
grid on;
filename = 'plot_8_38_1_y3';
filepath = '../images/plots/';
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(h,fullfile(filepath, filename),'-dpdf','-r0');