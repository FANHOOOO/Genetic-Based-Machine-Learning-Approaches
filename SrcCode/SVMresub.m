
function [best, Err1, Err2] = SVMresub(training,testing,genes,Y,Yt)
NUM = size(genes,1);
n = size(training,1);
Err1 = 1;
for i = 1:NUM
    trainingdata = training(:,genes(i,:));
    testingdata = testing(:,genes(i,:));
    mdl = fitcsvm(trainingdata,Y,'Cost',[0,0.1;0.1,0]);
    simulation(:,1) = predict(mdl,trainingdata); 
    err = sum(simulation~=Y,1)/ n;
    if  err < Err1
        Err1 = err;
        best = genes(i,:);
    
    end

end
n2 = size(testingdata,1);
trainingdata = training(:,best);
testingdata = testing(:,best);
mdl = fitcsvm(trainingdata,Y,'Cost',[0,0.1;0.1,0]);
simulation2(:,1) = predict(mdl,testingdata);
Err2 = sum(simulation2~=Yt,1)/ n2;



end