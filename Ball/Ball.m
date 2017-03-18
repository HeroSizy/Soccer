cd('/Users/Scar/GitHub/Soccer/Ball/BallAcceleration');
filename = 'DetectedBall.xlsx';
sheet = 1;
xlRange = 'A1:E2994';

allData = xlsread(filename,sheet,xlRange);
[sizeRow, sizeCol] = size(allData);
ballAcc = [];

 for i = 3:sizeRow
        if(allData(i,3) == -1)
            ballAcc= [ballAcc, 0];
        else
            ballAcc = [ballAcc ,calAcc(allData(i-2,:),allData(i-1,:), allData(i,:))];
        end
 end
 allData(1,:) = [];
 allData(1,:) = [];
 saveas(plot(allData(:,2), ballAcc),'ballAcceleration','jpg');