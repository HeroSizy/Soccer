cd('/Users/Scar/GitHub/Soccer/Player/playerAccPlot/');
filename = 'DetectedPlayers.xlsx';
sheet = 1;
xlRange = 'A1:E55723';
%get size of the datasheet
allData = xlsread(filename,sheet,xlRange);
[sizeRow, sizeCol] = size(allData);
%extract unique player ids
ids = unique(allData(:,3));


% allData(:,[4,5]) = allData(:,[4,5]) / 100;

for i = 1:size(ids)
% foreach player
 
%   get current player id 
    playerid = ids(i);
%   create a new [frame, time, number, x, y] n*5 matrix
    playerdata = [];
    
%   extract current player data from all date 
    for j = 1 : sizeRow
        if(allData(j,3) == playerid)
           playerdata = [playerdata;allData(j, 1:5) ];
        end
    end
%   create a new player acceleration matrix [player#, acc] (n*2)
    playerAcc = [];
%   calculate acceleration for each frame
    for k = 1: (size(playerdata,1)-2)
        playerAcc = [playerAcc ,calAcc(playerdata(k,:), playerdata(k+1,:), playerdata(k+2,:))];
    end
%   remove first 2 row if the player data is not empty
%   (because need 3 data to calculate 1 vector acceleration, 2 data was wasted)
    if ~isempty(playerdata)
        playerdata(1,:) = [];  
        if ~isempty(playerdata)
            playerdata(1,:) = []; 
        end
    end
%   plot and save the chart
    if ~isempty(playerdata)
    saveas(plot(playerdata(:,2), playerAcc),num2str(playerid),'jpg');
    end
end