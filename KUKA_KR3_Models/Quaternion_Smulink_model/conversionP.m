% Converting the Coordinate file into the MatLab file.
% Coordinates were written in table form into .csv file and the table is being converted here into the array.

function M = conversionP(filename)

T = readtable(filename, 'HeaderLines',2);

T1 = table2array(T(:,1:3));
for i = 1:(length(T1)/2)
    M(i,:) = T1(2*i,:);
end

M(:,1) = M(:,1)-150;
M(:,2) = M(:,2)-150;
M(:,3) = M(:,3)+75;
n = length(M(:,1));
M = [M zeros(n,3)];
oriP = [linspace(10,90,n/2) linspace(90,10,n/2)];
oriR = linspace(0,180,n);
M(:,4) = M(:,4)+(110*1000);
M(:,5) = M(:,5)+(140*1000);
M(:,6) = M(:,6)+(110*1000);
M = M'/1000;
end