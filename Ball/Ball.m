cd('/Users/Scar/GitHub/Soccer/Ball/BallAcceleration');
%read file 
filename = 'DetectedBall.xlsx';
sheet = 1;
xlRange = 'A1:E2994';
allData = xlsread(filename,sheet,xlRange);

%get size of data matrix
[sizeRow, sizeCol] = size(allData);
%create a ball acc array 
ballAcc = [];

 for i = 3:sizeRow
 %calculate ball acc and fill data to ballAcc
        if(allData(i,3) == -1)
            ballAcc= [ballAcc, 0];
        else
            ballAcc = [ballAcc ,calAcc(allData(i-2,:),allData(i-1,:), allData(i,:))];
        end
 end
 %remove 2 rows, reason as player one
 allData(1,:) = [];
 allData(1,:) = [];
 
 %plot and save the file
 saveas(plot(allData(:,2), ballAcc),'ballAcceleration','jpg');