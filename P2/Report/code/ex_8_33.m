% Gerando a Representacao em Espaco de Estados
A = [0 1/4; -1 -5];
B = [0; 5];
C1 = [1 0];
C2 = [0 1];
C3 = [0 -5];
D1 = [0];
D2 = [0];
D3 = [5];

% Condicoes iniciais
x0 = [10; -2];

% Colocando as representacoes em um sistema do MATLAB
rep1 = ss(A, B, C1, D1);
rep2 = ss(A, B, C2, D2);
rep3 = ss(A, B, C3, D3);

% Gerando amostras de tempo adequadas para visualizacao
tsim = 0:0.01:100;
t1 = 0:0.01:80;
t2 = 0:0.01:40;
t3 = 0:0.01:60;

% Resposta do exercicio
Vc = 20 + 0.205*exp(-4.95*tsim) - 10.205*exp(-0.05*tsim);

% Gerando as entradas
u = 4 * heaviside(tsim);

% Resolvendo os sistemas de EDOs
[y1, to1, x1] = lsim(rep1, u, tsim, x0);
[y2, to2, x2] = lsim(rep2, u, tsim, x0);
[y3, to3, x3] = lsim(rep3, u, tsim, x0);

% Gerando o grafico da primeira saida (salvando em PDF)
h = figure;
plot(t1, y1(1:size(t1, 2)), 'b', t1, Vc(1:size(t1, 2)), 'r--');
xlabel('Tempo [s]');
ylabel('Tensao no Capacitor [V]');
title('Saida no Capacitor');
legend('Espaco de Estados', 'Gabarito do Exercicio');
grid on;
filename = 'plot_8_33_y1';
filepath = '../images/plots/';
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(h,fullfile(filepath, filename),'-dpdf','-r0');

% Gerando o grafico da segunda saida (salvando em PDF)
h = figure;
plot(t2, y2(1:size(t2, 2)), 'b');
xlabel('Tempo [s]');
ylabel('Corrente no Indutor [A]');
title('Saida no Indutor');
grid on;
filename = 'plot_8_33_y2';
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
filename = 'plot_8_33_y3';
filepath = '../images/plots/';
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(h,fullfile(filepath, filename),'-dpdf','-r0');