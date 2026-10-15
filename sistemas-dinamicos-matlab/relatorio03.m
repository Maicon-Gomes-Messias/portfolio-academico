%%%%Relatorio 3%%%%%

clear;
clc;

%Vamos considerar o seguinte sistemas
%onde K é o ganho estático
%e é o coeficiente de amortecimento
%w é a frequência natural não amortecida

pkg load control;

K = 1;
e = 2;
w = 1
Num = K*w^2;
Den = [1 2*e*w w^2];
Gsl = tf(Num, Den)

t = 0:0.1:20;
u = ones(size(t));
yl = lsim(gs,u,t);%Resposta do sistema super amortecido

e = 1;
Den = [1 2*e*w w^2];
Gs2 = tf(Num, Den)
y2 = lsim(Gs2,u,t);%Resposta do sastema criticamente amortecido

e = 0.2;
Den = [1 2*e*w w^2];
Gs3 = tf(Num, Den)
y3 = lsim(Gs3,u,t);%Resposta do sistema sub amortecido

figure(1);
plot(t,u,t,yl,t, y2, t, y3)
title('Resposta de um sistema de 2a ordem');
xlabel('Tempo [s]');
ylabel('Amplitude');
legend('Degrau', 'Reposta 1', 'Resposta 2', 'Resposta3');
grid;

figure(2);
plot(t,u,t,y3)
title('Resposta de um sistema de 2a ordem');
xlabel('Tempo [s]');
ylabel('Amplitude');
legend('Degrau', 'Resposta3');
grid;
