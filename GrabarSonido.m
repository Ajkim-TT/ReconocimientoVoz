clc
clear all
close all

t = 3;                                %Tiempo de grabación
Fs = 44100;                           %Frecuencia de muestreo
v = audiorecorder(Fs,16,1);           %Configuración de canal
disp('Inicio de Grabación')
recordblocking(v,t);                  %Ajuste de grabación
disp('Fin de la grabación')
audio_rec = getaudiodata(v,'single'); %Vector de Audio Capturado
sound(audio_rec,Fs);
figure(1);
plot(audio_rec);
title('Señal en el tiempo del audio grabado');
voz = audio_rec;

%GUARDAR LAS VOCES EN ARCHIVOS .WAV
%audiowrite('Temperatura.wav',audio_rec,Fs)
audiowrite('Veinticinco.wav',audio_rec,Fs)
%audiowrite('poesia.wav',audio_rec,Fs);

%PALABRAS
%Temperatura = audioread('Temperatura.wav');
Veinticinco = audioread('Veinticinco.wav'); 
%poesia = audioread('poesia.wav');

    %ESPECTRO DE FRECUENCIA DE LAS PALABRAS
%fftTemperatura = abs(fft(Temperatura));
fftVeinticinco = abs(fft(Veinticinco));
%fftpoesia = abs(fft(poesia));