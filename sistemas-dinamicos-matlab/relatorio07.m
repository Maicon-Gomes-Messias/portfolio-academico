% Script MATLAB para visualizar o lugar das raízes de diversos sistemas
% Limpa o espaço de trabalho e fecha as janelas de figura
clear all; close all; clc;

%% Exemplo 1: Dois pólos reais
% Sistema G(s) = K / ((s + 1)*(s + 2))
polo1 = 1; % Pólo localizado em s = -1
polo2 = 2; % Pólo localizado em s = -2
numerador1 = [1]; % Coeficiente do numerador
denominador1 = conv([1 polo1], [1 polo2]); % Coeficientes do denominador
sistema1 = tf(numerador1, denominador1); % Cria a função de transferência
figure;
rlocus(sistema1); % Plota o lugar das raízes
title('Lugar das Raízes para Sistema com Dois Pólos Reais em -1 e -2');
grid on;

%% Exemplo 2: Dois pólos reais e um zero, zero menor que os pólos
% Zero em s = -1, Pólos em s = -2 e s = -3
zero1 = 1; % Zero localizado em s = -1
polo1 = 2; % Pólo localizado em s = -2
polo2 = 3; % Pólo localizado em s = -3
numerador2 = [1 zero1]; % Coeficientes do numerador
denominador2 = conv([1 polo1], [1 polo2]); % Coeficientes do denominador
sistema2 = tf(numerador2, denominador2); % Cria a função de transferência
figure;
rlocus(sistema2); % Plota o lugar das raízes
title('Lugar das Raízes com Dois Pólos Reais em -2 e -3, Zero em -1');
grid on;

%% Exemplo 3: Dois pólos reais e um zero, zero maior que os pólos
% Zero em s = -5, Pólos em s = -1 e s = -2
zero1 = 5; % Zero localizado em s = -5
polo1 = 1; % Pólo localizado em s = -1
polo2 = 2; % Pólo localizado em s = -2
numerador3 = [1 zero1]; % Coeficientes do numerador
denominador3 = conv([1 polo1], [1 polo2]); % Coeficientes do denominador
sistema3 = tf(numerador3, denominador3); % Cria a função de transferência
figure;
rlocus(sistema3); % Plota o lugar das raízes
title('Lugar das Raízes com Dois Pólos Reais em -1 e -2, Zero em -5');
grid on;

%% Exemplo 4: Três pólos reais
% Pólos localizados em s = -1, s = -2, s = -3
polo1 = 1;
polo2 = 2;
polo3 = 3;
numerador4 = [1]; % Coeficientes do numerador
denominador4 = conv([1 polo1], conv([1 polo2], [1 polo3])); % Coeficientes do denominador
sistema4 = tf(numerador4, denominador4); % Cria a função de transferência
figure;
rlocus(sistema4); % Plota o lugar das raízes
title('Lugar das Raízes para Sistema com Três Pólos Reais em -1, -2, -3');
grid on;

%% Exemplo 5: Dois pólos complexos e um real, pólo real menor que a parte real dos complexos
% Pólo real em s = -1, pólos complexos em s = -2 ± j
polo_real = 1; % Pólo real em s = -1
polo_complexo_real = 2; % Parte real dos pólos complexos
polo_complexo_imag = 1; % Parte imaginária dos pólos complexos
numerador5 = [1]; % Coeficientes do numerador
denominador5 = conv([1 polo_real], [1 2*polo_complexo_real (polo_complexo_real^2 + polo_complexo_imag^2)]); % Coeficientes do denominador
sistema5 = tf(numerador5, denominador5); % Cria a função de transferência
figure;
rlocus(sistema5); % Plota o lugar das raízes
title('Lugar das Raízes com Pólo Real em -1 e Pólos Complexos em -2±j');
grid on;

%% Exemplo 6: Dois pólos complexos e um real, pólo real maior que a parte real dos complexos
% Pólo real em s = -3, pólos complexos em s = -1 ± j
polo_real = 3; % Pólo real em s = -3
polo_complexo_real = 1; % Parte real dos pólos complexos
polo_complexo_imag = 1; % Parte imaginária dos pólos complexos
numerador6 = [1]; % Coeficientes do numerador
denominador6 = conv([1 polo_real], [1 2*polo_complexo_real (polo_complexo_real^2 + polo_complexo_imag^2)]); % Coeficientes do denominador
sistema6 = tf(numerador6, denominador6); % Cria a função de transferência
figure;
rlocus(sistema6); % Plota o lugar das raízes
title('Lugar das Raízes com Pólo Real em -3 e Pólos Complexos em -1±j');
grid on;
