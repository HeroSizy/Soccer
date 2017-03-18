cd('/Users/Scar/GitHub/Soccer/Player/playerAccPlot/');
filename = 'DetectedPlayers.xlsx';
sheet = 1;
xlRange = 'A1:E55723';

allData = xlsread(filename,sheet,xlRange);
[sizeRow, sizeCol] = size(allData);

ids = unique(allData(:,3));

allData(:,[4,5]) = allData(:,[4,5]) / 100;
 for i = 1:size(ids)

    playerid = ids(i);
%     playerid = 5701;
    playerdata = [];

    for j = 1 : sizeRow
        if(allData(j,3) == playerid)
           playerdata = [playerdata;allData(j, 1:5) ];
        end
    end
    playerAcc = [];
    for k = 1: (size(playerdata,1)-2)
        playerAcc = [playerAcc ,calAcc(playerdata(k,:), playerdata(k+1,:), playerdata(k+2,:))];
    end
    if ~isempty(playerdata)
        playerdata(1,:) = [];  
        if ~isempty(playerdata)
            playerdata(1,:) = []; 
        end
    end
    if ~isempty(playerdata)
    saveas(plot(playerdata(:,2), playerAcc),num2str(playerid),'jpg');
%     saveas(plot(smooth(playerdata(:,2)), playerAcc),[num2str(playerid) 'smooth'],'jpg');
    end
 end