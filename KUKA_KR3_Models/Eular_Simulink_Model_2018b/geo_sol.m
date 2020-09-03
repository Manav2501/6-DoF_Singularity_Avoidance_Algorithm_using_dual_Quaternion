% Geometric Solution of a KUKA KR3 used as an initial value for fsolve.

function Ini_val = geo_sol(Des)

file = 'ErrorImgPosition.csv';

R11 = Des(1,1);R12 = Des(1,2);R13 = Des(1,3);X = Des(1,4);
R21 = Des(2,1);R22 = Des(2,2);R23 = Des(2,3);Y = Des(2,4);
R31 = Des(3,1);R32 = Des(3,2);R33 = Des(3,3);Z = Des(3,4);

%A1 = 0.02;  %   D1 = 0.345;   % AL1 = pi/2;
A2 = 0.26;  %   D2 = 0;       % AL2 = 0;
A3 = 0.02;  %   D3 = 0;       % AL3 = pi/2;
A4 = 0;        D4 = 0.260;   % AL4 = -pi/2;
%A5 = 0;     %   D5 = 0;       % AL5 = pi/2;
A6 = 0;        D6 = 0.075;   % AL6 = 0;

........................................Theta = 1..............................................

Px = X - D6*R13; Py = Y - D6*R23; Pz = Z - D6*R33;
P = [Px;Py;Pz];

th1 = atan2(Py,Px);

if(any(imag(th1)))
    dlmwrite(file,Des,'-append'); 
    dlmwrite(file,'th1','-append'); 
    th1 = 0;
    
end
........................................Theta = 3.............................................

L = sqrt(D4^2 + A3^2);

Px1 = Px - 0.280*cos(th1); Py1 = Py - 0.280*sin(th1); Pz1 = Pz - 0.345;
P1 = [Px1;Py1;Pz1];

Alpha = atan2(D4,A3);

Phi = acos((A2^2 + L^2 - (Px1^2 + Py1^2 + Pz1^2)) / (2*A2*L));

th3 = pi - Phi - Alpha;

if(any(imag(th3)))
    dlmwrite(file,Des,'-append'); 
    dlmwrite(file,'th3','-append'); 
    th3 = 0;
end
........................................Theta = 2............................................

Px2 = cos(th1)*Px1 + sin(th1)*Py1; Py2 = Pz1; Pz2 = sin(th1)*Px1 - cos(th1)*Py1;

Beta_1 = atan2(Px2,Py2);

Beta_2 = asin((A2^2 + L^2 - (Px1^2 + Py1^2 + Pz1^2)) / 2*A2*L) + asin((L - ((A2^2 + L^2 - (Px1^2 + Py1^2 + Pz1^2)) / (2*L))) / (sqrt(Px1^2 + Py1^2 + Pz1^2)));

th2 = pi/2 - (Beta_1 + Beta_2);

if(any(imag(th2)))
    dlmwrite(file,Des,'-append'); 
    dlmwrite(file,'th2','-append'); 
    th2 = 0;
end
........................................Theta = 5...........................................

T04 = [sin(th1);cos(th1);0]; T06 = [R13;R23;R33];

Product = T04.*T06;

th5 = pi - acos(Product(1,1) + Product(2,1) + Product(3,1));

if(any(imag(th5)))
    dlmwrite(file,Des,'-append'); 
    dlmwrite(file,'th5','-append'); 
    th5 = 0;
end
........................................Theta = 4..........................................

th4 = atan2(R13*sin(th3) - R23*cos(th3),R33*sin(th1+th2) + cos(th1+th2)*(R13*cos(th3) + R23*sin(th3)));

if(any(imag(th4)))
    dlmwrite(file,Des,'-append'); 
    dlmwrite(file,'th4','-append'); 
    th4 = 0;
end
........................................Theta = 6.........................................

th6 = atan2(R31*cos(th1+th2) - sin(th1+th2)*(R11*cos(th3) + R21*sin(th3)),sin(th1+th2)*(R12*cos(th3) + R22*sin(th3)) - R32*cos(th1+th2));

if(any(imag(th6)))
    dlmwrite(file,Des,'-append'); 
    dlmwrite(file,'th6','-append'); 
    th6 = 0;
end
........................................Final.............................................
Ini_val = [th1 th2 th3 th4 th5 th6];

end
