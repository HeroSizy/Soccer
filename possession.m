cd('/Users/Scar/GitHub/Soccer/Possession/Plot/');
%read player data
filename = 'DetectedPlayers.xlsx';
sheet = 1;
xlRange = 'A1:E55723';
playerData = xlsread(filename,sheet,xlRange);
[playerRow, playerCol] = size(playerData);

%read ball data
filename = 'DetectedBall.xlsx';
sheet = 1;
xlRange = 'A1:E2994';
ballData = xlsread(filename,sheet,xlRange);

%remove no ball detection frames
condition = ballData(:,3) == -1;
ballData(condition,:)=[];

% get the matrix size of ball data (row and col)
[ballRow, ballCol] = size(ballData);

%possession map with key of player number and value of possession time
playerPos = containers.Map(unique(playerData(:,3)),zeros(1,506));


for i = 1 : ballRow
%   foreach point of time/frame, filter the players on ground
    thisFrame = playerData(find(playerData(:,2) == ballData(i,2),1),:);
%   create a n row * 2 column matrix to store the [player#, distance to ball] info
    thisFrameDistance = [];

    for j = 1 : size(thisFrame,1)
%   fill data to thisFrameDistance matrix
        thisFrameDistance = [thisFrameDistance, isPossess(ballData(i,:),thisFrame(j,:))]
    end
%   find the minimum value of distance and add 0.04s to corresponding player
    minDis = thisFrameDistance(find(thisFrameDistance(:,2) == min(thisFrameDistance(:,2))),:);
    playerPos(minDis(1)) = playerPos(minDis(1)) + 0.04;
%   reset current time/frame player info
    thisFrame = [];
end

% transform the map to matrix
pairs = [[cell2mat(playerPos.keys)];[ cell2mat(playerPos.values)]]';
% remove the players which not possess the ball at all
condition = pairs(:,2) == 0;
pairs(condition,:)=[];


%plot the graph
h = bar(pairs(:,2));
set(gca,'XTickLabel',string(pairs(:,1)));
saveas(h,'possession','jpg');