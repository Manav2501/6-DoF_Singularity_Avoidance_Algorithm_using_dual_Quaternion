% Numerical iterative Inverse kinematics solver's equation for ABB IRB140
function F = ikine_Num(th,Des) 
    
    F(1) = - sin(th(6))*(cos(th(4))*sin(th(1)) - sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - cos(th(6))*(cos(th(5))*(sin(th(1))*sin(th(4)) + cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - Des(1,1);

    F(2) = sin(th(6))*(cos(th(5))*(sin(th(1))*sin(th(4)) + cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + sin(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)))) - cos(th(6))*(cos(th(4))*sin(th(1)) - sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - Des(1,2);

    F(3) = cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2))) - sin(th(5))*(sin(th(1))*sin(th(4)) + cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) - Des(1,3);

    F(4) = (cos(th(1))*(38*sin(th(2) + th(3)) + 36*cos(th(2)) + 7))/100 - Des(1,4);

    F(5) = sin(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + cos(th(6))*(cos(th(5))*(cos(th(1))*sin(th(4)) - cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - Des(2,1);

    F(6) = cos(th(6))*(cos(th(1))*cos(th(4)) + sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - sin(th(6))*(cos(th(5))*(cos(th(1))*sin(th(4)) - cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) - sin(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2)))) - Des(2,2);

    F(7) = sin(th(5))*(cos(th(1))*sin(th(4)) - cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1)))) + cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))) - Des(2,3);

    F(8) = (sin(th(1))*(38*sin(th(2) + th(3)) + 36*cos(th(2)) + 7))/100 - Des(2,4);

    F(9) = sin(th(2) + th(3))*sin(th(4))*sin(th(6)) - cos(th(6))*(cos(th(2) + th(3))*sin(th(5)) + sin(th(2) + th(3))*cos(th(4))*cos(th(5))) - Des(3,1);

    F(10) = sin(th(6))*(cos(th(2) + th(3))*sin(th(5)) + sin(th(2) + th(3))*cos(th(4))*cos(th(5))) + sin(th(2) + th(3))*cos(th(6))*sin(th(4)) - Des(3,2);

    F(11) = cos(th(2) + th(3))*cos(th(5)) - sin(th(2) + th(3))*cos(th(4))*sin(th(5)) - Des(3,3);

    F(12) = (19*cos(th(2) + th(3)))/50 - (9*sin(th(2)))/25 + 44/125 - Des(3,4);
    
end
