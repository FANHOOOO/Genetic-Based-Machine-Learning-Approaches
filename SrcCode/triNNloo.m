
function [best,Err1,Err2]=triNNloo(training,testing,genes,Y,Yt)
NUM = size(genes,1);
n = size(training,1);
Err1 = 1;
for i = 1:NUM
    err = 0;
    trainingdata = training(:,genes(i,:));
    testingdata = testing(:,genes(i,:));    
    for j = 1:n
        trainingdata1 = trainingdata;
        Y1 = Y;
        trainingdata1(j,:) = [];
        Y1(j,:) = [];
        mdl = fitcknn(trainingdata1,Y1,'NumNeighbors',3);
        simulation = predict(mdl,trainingdata(j,:)); 
        err = (simulation~=Y(j,:)) + err;        
    end
    err = err/n;
    if  err < Err1
        Err1 = err;
        best = genes(i,:);
    end
end
n2 = size(testingdata,1);
trainingdata = training(:,best);
testingdata = testing(:,best);
mdl = fitcknn(trainingdata,Y,'NumNeighbors',3);
simulation2(:,1) = predict(mdl,testingdata);
Err2 = sum(simulation2~=Yt,1)/ n2;
end