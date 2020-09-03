function transform = getTransformationMatrix(th1,th2,th3,th4,th5,th6)

A1 = 25/2;      D1 = 400/2;     AL1 = pi/2;   
A2 = 315/2;     D2 = 0;         AL2 = 0;     
A3 = 35/2;      D3 = 0;         AL3 = pi/2;  
A4 = 0;         D4 = 365/2;     AL4 =-pi/2;  
A5 = 0;         D5 = 0;         AL5 = pi/2;  
A6 = 0;         D6 = 80/2;      AL6 = 0;     

Eular_Rot_Mat_1 = [cos(th1)     -sin(th1)*cos(AL1)     sin(th1)*sin(AL1)     A1*cos(th1);
                   sin(th1)      cos(th1)*cos(AL1)    -cos(th1)*sin(AL1)     A1*sin(th1);
                   0             sin(AL1)              cos(AL1)              D1;
                   0             0                     0                     1];

Eular_Rot_Mat_2 = [cos(th2)     -sin(th2)*cos(AL2)     sin(th2)*sin(AL2)     A2*cos(th2);
                   sin(th2)      cos(th2)*cos(AL2)    -cos(th2)*sin(AL2)     A2*sin(th2);
                   0             sin(AL2)              cos(AL2)              D2;
                   0             0                     0                     1];
Eular_Rot_Mat_3 = [cos(th3)     -sin(th3)*cos(AL3)     sin(th3)*sin(AL3)     A3*cos(th3);
                   sin(th3)      cos(th3)*cos(AL3)    -cos(th3)*sin(AL3)     A3*sin(th3);
                   0             sin(AL3)              cos(AL3)              D3;
                   0             0                     0                     1];
Eular_Rot_Mat_4 = [cos(th4)     -sin(th4)*cos(AL4)     sin(th4)*sin(AL4)     A4*cos(th4);
                   sin(th4)      cos(th4)*cos(AL4)    -cos(th4)*sin(AL4)     A4*sin(th4);
                   0             sin(AL4)              cos(AL4)              D4;
                   0             0                     0                     1];
Eular_Rot_Mat_5 = [cos(th5)     -sin(th5)*cos(AL5)     sin(th5)*sin(AL5)     A5*cos(th5);
                   sin(th5)      cos(th5)*cos(AL5)    -cos(th5)*sin(AL5)     A5*sin(th5);
                   0             sin(AL5)              cos(AL5)              D5;
                   0             0                     0                     1];
Eular_Rot_Mat_6 = [cos(th6)     -sin(th6)*cos(AL6)     sin(th6)*sin(AL6)     A6*cos(th6);
                   sin(th6)      cos(th6)*cos(AL6)    -cos(th6)*sin(AL6)     A6*sin(th6);
                   0             sin(AL6)              cos(AL6)              D6;
                   0             0                     0                     1];
            
transform = Eular_Rot_Mat_1 * Eular_Rot_Mat_2 * Eular_Rot_Mat_3 * Eular_Rot_Mat_4 * Eular_Rot_Mat_5 * Eular_Rot_Mat_6;

end