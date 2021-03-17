clc
clear all
close all

%PALABRAS
Temperatura = audioread('Temperatura.wav');
Veinticinco = audioread('Veinticinco.wav'); 
poesia = audioread('poesia.wav');
    %TRANSFORMADA DE FOURIER DE LAS PALABRAS
fftTemperatura = abs(fft(Temperatura));
fftVeinticinco = abs(fft(Veinticinco));
fftpoesia = abs(fft(poesia));

figure(1),subplot(3,1,1),plot(fftTemperatura,'r');title('TF TEMPERATURA');
figure(1),subplot(3,1,2),plot(fftVeinticinco,'r');title('TF VEINTICINCO');
figure(1),subplot(3,1,3),plot(fftpoesia,'r');title('TF POESIA');

%DESVIACIÓN ESTANDAR DE LAS PALABRAS
desvTemp = std(fftTemperatura);
desvVeint = std(fftVeinticinco);
desvPoesia = std(fftpoesia);

%PROMEDIO DE LAS PALABRAS
promTemp = mean(fftTemperatura);
promVeint = mean(fftVeinticinco);
promPoesia = mean(fftpoesia);

%GRABACION DE VOZ A RECONOCES
t = 3;                                %Tiempo de grabación
Fs = 32000;                           %Frecuencia de muestreo
v = audiorecorder(Fs,16,1);           %Configuración de canal
rec = audiorecorder;
disp('Inicio de Grabación')
recordblocking(rec,t);                  %Ajuste de grabación
disp('Fin de la grabación')
audio_rec = getaudiodata(rec); %Vector de Audio Capturado
figure(2);plot(audio_rec);title('Señal en el tiempo del audio grabado');
sound(audio_rec,Fs);

%TRANSFORMADA DE FOURIER DE LA VOZ GRABADA
transff = abs(fft(audio_rec));
figure(3);
plot(transff);
title('Transformada de Fourier de la voz grabada');

%DESVIACIÓN ESTANDAR DE LA VOZ GRABADA
desvAudio = std(transff);
%PROMEDIO DE LA VOZ GRABADA
promAudio = mean(transff);


if((promAudio<=promPoesia)&&(desvAudio<=desvPoesia))
    b = 'P';
    disp('La palabra es Poesía')
end
if((promAudio>promPoesia && promAudio<promTemp)&&(desvAudio>desvPoesia && desvAudio<desvTemp))
    b = 'P';
    disp('La palabra es Temperatura')
end
if((promAudio>promVeint)&&(desvAudio>desvVeint))
    b = 'P';
    disp('La palabra es Veinticinco')
end