% Converting the Coordinate file into the MatLab file.
% Coordinates were written in table form into .csv file and the table is being converted here into the array.
function M = conversionC(filename)

T = readtable(filename, 'HeaderLines',2);

T1 = table2array(T(:,1:3));
for i = 1:(length(T1)/2)
    M(i,:) = T1(2*i,:);
end

M(:,1) = M(:,1)-250;
M(:,2) = M(:,2)-200;
M(:,3) = M(:,3)+50;
n = length(M(:,1));
M = [M zeros(n,3)];
oriP = [linspace(10,90,n/2) linspace(90,10,n/2)];
oriR = linspace(0,180,n);
M(:,4) = M(:,4) + (oriP'*1000);
M(:,5) = M(:,5)+(180'*1000);
M(:,6) = M(:,6)+(oriR'*1000);
M = M'/1000;
end