% Numerical iterative Inverse kinematics solver's equation for RV-2AJ.
function F = ikine_Num(th,Des) 
    
    F(1) = sin(th(1))*sin(th(5)) + cos(th(2) + th(3) + th(4))*cos(th(1))*cos(th(5)) - Des(1,1);

    F(2) = cos(th(5))*sin(th(1)) - cos(th(2) + th(3) + th(4))*cos(th(1))*sin(th(5)) - Des(1,2);

    F(3) = -sin(th(2) + th(3) + th(4))*cos(th(1)) - Des(1,3);

    F(4) = (cos(th(1))*(80*cos(th(2) + th(3)) - 36*sin(th(2) + th(3) + th(4)) + 125*cos(th(2))))/500 - Des(1,4);

    F(5) = cos(th(2) + th(3) + th(4))*cos(th(5))*sin(th(1)) - cos(th(1))*sin(th(5)) - Des(2,1);

    F(6) = - cos(th(1))*cos(th(5)) - cos(th(2) + th(3) + th(4))*sin(th(1))*sin(th(5)) - Des(2,2);

    F(7) = -sin(th(2) + th(3) + th(4))*sin(th(1)) - Des(2,3);

    F(8) = (sin(th(1))*(80*cos(th(2) + th(3)) - 36*sin(th(2) + th(3) + th(4)) + 125*cos(th(2))))/500 - Des(2,4);

    F(9) = -sin(th(2) + th(3) + th(4))*cos(th(5)) - Des(3,1);

    F(10) = sin(th(2) + th(3) + th(4))*sin(th(5)) - Des(3,2);

    F(11) = -cos(th(2) + th(3) + th(4)) - Des(3,3);

    F(12) = 3/10 - (4*sin(th(2) + th(3)))/25 - sin(th(2))/4 - (9*cos(th(2) + th(3) + th(4)))/125 - Des(3,4);
    
end
