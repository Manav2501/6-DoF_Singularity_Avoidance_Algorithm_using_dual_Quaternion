% Numerical iterative Inverse kinematics solver's equation for KUKA KR3.

function F = ikine_Num(th,Des) 
       
    F(1) = sin(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(6))*(cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - Des(1,1);

    F(2) = - sin(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - cos(th(6))*(cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - Des(2,1);

    F(3) = cos(th(6))*(sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) + cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - sin(th(4))*sin(th(6))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) - Des(3,1);

    F(4) = cos(th(6))*(cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - sin(th(6))*(cos(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - Des(1,2);

    F(5) = sin(th(6))*(cos(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - cos(th(6))*(cos(th(1))*cos(th(4)) - sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - Des(2,2);

    F(6) = - sin(th(6))*(sin(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) + cos(th(4))*cos(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2)))) - cos(th(6))*sin(th(4))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) - Des(3,2);

    F(7) = sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) - Des(1,3);

    F(8) = cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))) - sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - Des(2,3);

    F(9) = cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))) - cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))) - Des(3,3);

    F(10) = cos(th(1))/50 + (13*cos(th(1))*cos(th(2)))/50 + (3*sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))))/40 + (3*cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))))/40 - (cos(th(1))*sin(th(2))*sin(th(3)))/50 + (cos(th(1))*cos(th(2))*cos(th(3)))/50 + (13*cos(th(1))*cos(th(2))*sin(th(3)))/50 + (13*cos(th(1))*cos(th(3))*sin(th(2)))/50 - Des(1,4);

    F(11) = sin(th(1))/50 + (13*cos(th(2))*sin(th(1)))/50 - (3*sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))))/40 + (3*cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))))/40 + (13*cos(th(2))*sin(th(1))*sin(th(3)))/50 + (13*cos(th(3))*sin(th(1))*sin(th(2)))/50 - (sin(th(1))*sin(th(2))*sin(th(3)))/50 + (cos(th(2))*cos(th(3))*sin(th(1)))/50 - Des(2,4);

    F(12) = (13*sin(th(2)))/50 - (13*cos(th(2))*cos(th(3)))/50 + (cos(th(2))*sin(th(3)))/50 + (cos(th(3))*sin(th(2)))/50 + (13*sin(th(2))*sin(th(3)))/50 - (3*cos(th(5))*(cos(th(2))*cos(th(3)) - sin(th(2))*sin(th(3))))/40 + (3*cos(th(4))*sin(th(5))*(cos(th(2))*sin(th(3)) + cos(th(3))*sin(th(2))))/40 + 69/200 - Des(3,4);

end
