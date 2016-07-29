clear; 
close all; 
clc;
% Import data from txt files---------------
Training = importdata('Training_Data.txt');
Testing = importdata('Testing_Data.txt');
NUM = size(Training.data,2);
Y(:,1) = Training.data(:,72);
Yt(:,1) = Testing.data(:,72);
GeneName = Training.textdata;

% Exhaustive Search 1 gene-----------------------------------------------
exgene1(:,1)=2:71;
[BCELDA, Err1, Err2] = LDAresub(Training.data,Testing.data,exgene1,Y,Yt);
BCELDA
ChosenGene = GeneName(:,BCELDA)
ErrorEstimate = Err1
HandoutEstimate = Err2

% Exhaustive Search 2 genes----------------------------------------------
genenum(1,:)=2:71;
exgene2=nchoosek(genenum,2);
[BCELDA, Err1, Err2] = LDAresub(Training.data,Testing.data,exgene2,Y,Yt);
BCELDA
ChosenGene = GeneName(:,BCELDA)
ErrorEstimate = Err1
HandoutEstimate = Err2

% Exhaustive Search 3 genes----------------------------------------------
exgene3=nchoosek(genenum,3);
[BCELDA, Err1, Err2] = LDAresub(Training.data,Testing.data,exgene3,Y,Yt);
BCELDA
ChosenGene = GeneName(:,BCELDA)
ErrorEstimate = Err1
HandoutEstimate = Err2

% Sequential Forward Search 1 gene----------------------------------------
sfsgene1(:,1)=2:71;
[BCSLDA, Err1, Err2] = LDAresub(Training.data,Testing.data,sfsgene1,Y,Yt);
BCSLDA
ChosenGene1 = GeneName(:,BCSLDA)
ErrorEstimate1 = Err1
HandoutEstimate1 = Err2

% Sequential Forward Search 2 genes---------------------------------------
i = BCSLDA;
sfsgene2(:,1)= 2:71;
sfsgene2(find(i==sfsgene2(:,1)),:) = [];
sfsgene2(:,2) = ones(NUM-3,1)*i;
[BCSLDA, Err1, Err2] = LDAresub(Training.data,Testing.data,sfsgene2,Y,Yt);
BCSLDA
ChosenGene2 = GeneName(:,BCSLDA)
ErrorEstimate2 = Err1
HandoutEstimate2 = Err2

% Sequential Forward Search 3 genes--------------------------------------
j = BCSLDA(:,1);
sfsgene3 = sfsgene2;
sfsgene3(find(j==sfsgene3(:,1)),:) = [];
sfsgene3(:,3) = ones(NUM-4,1)*j;
[BCSLDA,Err1, Err2] = LDAresub(Training.data,Testing.data,sfsgene3,Y,Yt);
BCSLDA
ChosenGene3 = GeneName(:,BCSLDA)
ErrorEstimate3 = Err1
HandoutEstimate3 = Err2

% Sequential Forward Search 4 genes--------------------------------------
k = BCSLDA(:,1);
sfsgene4 = sfsgene3;
sfsgene4(find(k==sfsgene4(:,1)),:) = [];
sfsgene4(:,4) = ones(NUM-5,1)*k;
[BCSLDA, Err1, Err2] = LDAresub(Training.data,Testing.data,sfsgene4,Y,Yt);
BCSLDA
ChosenGene4 = GeneName(:,BCSLDA)
ErrorEstimate4 = Err1
HandoutEstimate4 = Err2

% Sequential Forward Search 5 genes---------------------------------------
l=BCSLDA(:,1);
sfsgene5 = sfsgene4;
sfsgene5(find(l==sfsgene5(:,1)),:) = [];
sfsgene5(:,5) = ones(NUM-6,1)*l;
[BCSLDA, Err1, Err2] = LDAresub(Training.data,Testing.data,sfsgene5,Y,Yt);
BCSLDA
ChosenGene5 = GeneName(:,BCSLDA)
ErrorEstimate5 = Err1
HandoutEstimate5 = Err2









