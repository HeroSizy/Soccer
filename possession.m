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

%remove no detection frames
condition = find(ballData(:,3) == -1);
ballData(condition,:)=[];

[ballRow, ballCol] = size(ballData);

%possession array

playerPos = containers.Map(unique(playerData(:,3)),zeros(1,506));

for i = 1 : ballRow
    thisFrame = playerData(find(playerData(:,2) == ballData(i,2),1),:);
    thisFrameDistance = [];

    for j = 1 : size(thisFrame,1)
        thisFrameDistance = [thisFrameDistance, isPossess(ballData(i,:),thisFrame(j,:))]
    end
    minDis = thisFrameDistance(find(thisFrameDistance(:,2) == min(thisFrameDistance(:,2))),:);
%     if(minDis(2) <= 100)
        playerPos(minDis(1)) = playerPos(minDis(1)) + 0.04;
%     end
    thisFrame = []
end

pairs = [[cell2mat(playerPos.keys)];[ cell2mat(playerPos.values)]]';
condition = pairs(:,2) == 0;
pairs(condition,:)=[];

h = bar(pairs(:,2));
set(gca,'XTickLabel',string(pairs(:,1)));
saveas(h,'possession','jpg');