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

% Exhaustive Search 1 gene---------------------------------------------
exgene1(:,1)=2:71;
[BCE3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,exgene1,Y,Yt);
BCE3NN
ChosenGene = GeneName(:,BCE3NN)
ErrorEstimate = Err1
HandoutEstimate = Err2

% Exhaustive Search 2 genes--------------------------------------------
genenum(1,:)=2:71;
exgene2=nchoosek(genenum,2);
[BCE3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,exgene2,Y,Yt);
BCE3NN
ChosenGene = GeneName(:,BCE3NN)
ErrorEstimate = Err1
HandoutEstimate = Err2

% Exhaustive Search 3 genes--------------------------------------------
exgene3=nchoosek(genenum,3);
[BCE3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,exgene3,Y,Yt);
BCE3NN
ChosenGene = GeneName(:,BCE3NN)
ErrorEstimate = Err1
HandoutEstimate = Err2

% Sequential Forward Search 1 gene-------------------------------------
sfsgene1(:,1)=2:71;
[BCS3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,sfsgene1,Y,Yt);
BCS3NN
ChosenGene1 = GeneName(:,BCS3NN)
ErrorEstimate1 = Err1
HandoutEstimate1 = Err2

% Sequential Forward Search 2 genes------------------------------------
i = BCS3NN;
sfsgene2(:,1)= 2:71;
sfsgene2(find(i==sfsgene2(:,1)),:) = [];
sfsgene2(:,2) = ones(NUM-3,1)*i;
[BCS3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,sfsgene2,Y,Yt);
BCS3NN
ChosenGene2 = GeneName(:,BCS3NN)
ErrorEstimate2 = Err1
HandoutEstimate2 = Err2

% Sequential Forward Search 3 genes------------------------------------
j = BCS3NN(:,1);
sfsgene3 = sfsgene2;
sfsgene3(find(j==sfsgene3(:,1)),:) = [];
sfsgene3(:,3) = ones(NUM-4,1)*j;
[BCS3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,sfsgene3,Y,Yt);
BCS3NN
ChosenGene3 = GeneName(:,BCS3NN)
ErrorEstimate3 = Err1
HandoutEstimate3 = Err2

% Sequential Forward Search 4 genes------------------------------------
k = BCS3NN(:,1);
sfsgene4 = sfsgene3;
sfsgene4(find(k==sfsgene4(:,1)),:) = [];
sfsgene4(:,4) = ones(NUM-5,1)*k;
[BCS3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,sfsgene4,Y,Yt);
BCS3NN
ChosenGene4 = GeneName(:,BCS3NN)
ErrorEstimate4 = Err1
HandoutEstimate4 = Err2

% Sequential Forward Search 5 genes------------------------------------
l=BCS3NN(:,1);
sfsgene5 = sfsgene4;
sfsgene5(find(l==sfsgene5(:,1)),:) = [];
sfsgene5(:,5) = ones(NUM-6,1)*l;
[BCS3NN,Err1,Err2]=triNNresub(Training.data,Testing.data,sfsgene5,Y,Yt);
BCS3NN
ChosenGene5 = GeneName(:,BCS3NN)
ErrorEstimate5 = Err1
HandoutEstimate5 = Err2









