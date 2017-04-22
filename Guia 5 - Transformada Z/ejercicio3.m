B = [1 -2 2 -1];
rootsB = roots(B);
rootsA = [1; 0.5; 0.2];
A = [1 -1.7 .8 -.1];

figure
zplane(rootsB, rootsA) 

figure
freqz(B, A, 512, "whole")