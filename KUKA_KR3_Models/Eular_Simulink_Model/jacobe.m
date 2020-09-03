function Jacobian_Mat = jacobe(th)
    
    F11 = (3*cos(th(1))*sin(th(4))*sin(th(5)))/40 - (13*cos(th(2))*sin(th(1)))/50 - (13*cos(th(2))*sin(th(1))*sin(th(3)))/50 - (13*cos(th(3))*sin(th(1))*sin(th(2)))/50 - sin(th(1))/50 + (sin(th(1))*sin(th(2))*sin(th(3)))/50 - (3*sin(th(2) + th(3))*cos(th(5))*sin(th(1)))/40 - (cos(th(2))*cos(th(3))*sin(th(1)))/50 - (3*cos(th(2))*cos(th(3))*cos(th(4))*sin(th(1))*sin(th(5)))/40 + (3*cos(th(4))*sin(th(1))*sin(th(2))*sin(th(3))*sin(th(5)))/40;
    F21 = cos(th(1))/50 + (13*cos(th(1))*cos(th(2)))/50 - (cos(th(1))*sin(th(2))*sin(th(3)))/50 + (3*sin(th(1))*sin(th(4))*sin(th(5)))/40 + (3*sin(th(2) + th(3))*cos(th(1))*cos(th(5)))/40 + (cos(th(1))*cos(th(2))*cos(th(3)))/50 + (13*cos(th(1))*cos(th(2))*sin(th(3)))/50 + (13*cos(th(1))*cos(th(3))*sin(th(2)))/50 + (3*cos(th(1))*cos(th(2))*cos(th(3))*cos(th(4))*sin(th(5)))/40 - (3*cos(th(1))*cos(th(4))*sin(th(2))*sin(th(3))*sin(th(5)))/40;
    F31 = 0;
    F41 = 0;
    F51 = 0;
    F61 = 1;

    F12 = cos(th(1))*((13*cos(th(2) + th(3)))/50 - sin(th(2) + th(3))/50 - (13*sin(th(2)))/50 + (3*sin(th(4) - th(5))*sin(th(2) + th(3)))/80 - (3*sin(th(2) + th(3))*sin(th(4) + th(5)))/80 + (3*cos(th(2) + th(3))*cos(th(5)))/40);
    F22 = sin(th(1))*((13*cos(th(2) + th(3)))/50 - sin(th(2) + th(3))/50 - (13*sin(th(2)))/50 + (3*sin(th(4) - th(5))*sin(th(2) + th(3)))/80 - (3*sin(th(2) + th(3))*sin(th(4) + th(5)))/80 + (3*cos(th(2) + th(3))*cos(th(5)))/40);
    F32 = (13*cos(th(2)))/50 + (cos(th(2))*cos(th(3)))/50 + (13*cos(th(2))*sin(th(3)))/50 + (13*cos(th(3))*sin(th(2)))/50 - (sin(th(2))*sin(th(3)))/50 + (3*cos(th(2))*cos(th(5))*sin(th(3)))/40 + (3*cos(th(3))*cos(th(5))*sin(th(2)))/40 + (3*cos(th(2))*cos(th(3))*cos(th(4))*sin(th(5)))/40 - (3*cos(th(4))*sin(th(2))*sin(th(3))*sin(th(5)))/40;
    F42 = sin(th(1));
    F52 = -cos(th(1));
    F62 = 0;

    F13 = (cos(th(1))*(52*cos(th(2) + th(3)) - 4*sin(th(2) + th(3)) + 15*cos(th(2) + th(3))*cos(th(5)) - 15*sin(th(2) + th(3))*cos(th(4))*sin(th(5))))/200;
    F23 = (sin(th(1))*(52*cos(th(2) + th(3)) - 4*sin(th(2) + th(3)) + 15*cos(th(2) + th(3))*cos(th(5)) - 15*sin(th(2) + th(3))*cos(th(4))*sin(th(5))))/200;
    F33 = (cos(th(2))*cos(th(3)))/50 + (13*cos(th(2))*sin(th(3)))/50 + (13*cos(th(3))*sin(th(2)))/50 - (sin(th(2))*sin(th(3)))/50 + (3*cos(th(2))*cos(th(5))*sin(th(3)))/40 + (3*cos(th(3))*cos(th(5))*sin(th(2)))/40 + (3*cos(th(2))*cos(th(3))*cos(th(4))*sin(th(5)))/40 - (3*cos(th(4))*sin(th(2))*sin(th(3))*sin(th(5)))/40;
    F43 = sin(th(1));
    F53 = -cos(th(1));
    F63 = 0;

    F14 = (3*sin(th(5))*(cos(th(4))*sin(th(1)) - cos(th(1))*cos(th(2))*cos(th(3))*sin(th(4)) + cos(th(1))*sin(th(2))*sin(th(3))*sin(th(4))))/40;
    F24 = -(3*sin(th(5))*(cos(th(1))*cos(th(4)) + cos(th(2))*cos(th(3))*sin(th(1))*sin(th(4)) - sin(th(1))*sin(th(2))*sin(th(3))*sin(th(4))))/40;
    F34 = -(3*sin(th(2) + th(3))*sin(th(4))*sin(th(5)))/40;
    F44 = sin(th(2) + th(3))*cos(th(1));
    F54 = sin(th(2) + th(3))*sin(th(1));
    F64 = -cos(th(2) + th(3));
    
    F15 = (3*cos(th(5))*sin(th(1))*sin(th(4)))/40 - (3*cos(th(1))*cos(th(2))*sin(th(3))*sin(th(5)))/40 - (3*cos(th(1))*cos(th(3))*sin(th(2))*sin(th(5)))/40 + (3*cos(th(1))*cos(th(2))*cos(th(3))*cos(th(4))*cos(th(5)))/40 - (3*cos(th(1))*cos(th(4))*cos(th(5))*sin(th(2))*sin(th(3)))/40;
    F25 = (3*cos(th(2))*cos(th(3))*cos(th(4))*cos(th(5))*sin(th(1)))/40 - (3*cos(th(2))*sin(th(1))*sin(th(3))*sin(th(5)))/40 - (3*cos(th(3))*sin(th(1))*sin(th(2))*sin(th(5)))/40 - (3*cos(th(1))*cos(th(5))*sin(th(4)))/40 - (3*cos(th(4))*cos(th(5))*sin(th(1))*sin(th(2))*sin(th(3)))/40;
    F35 = (3*cos(th(2))*cos(th(3))*sin(th(5)))/40 - (3*sin(th(2))*sin(th(3))*sin(th(5)))/40 + (3*cos(th(2))*cos(th(4))*cos(th(5))*sin(th(3)))/40 + (3*cos(th(3))*cos(th(4))*cos(th(5))*sin(th(2)))/40;
    F45 = cos(th(4))*sin(th(1)) + sin(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)));
    F55 = sin(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))) - cos(th(1))*cos(th(4));
    F65 = -sin(th(2) + th(3))*sin(th(4));
    
    F16 = 0;
    F26 = 0;
    F36 = 0;
    F46 = sin(th(5))*(sin(th(1))*sin(th(4)) - cos(th(4))*(cos(th(1))*sin(th(2))*sin(th(3)) - cos(th(1))*cos(th(2))*cos(th(3)))) + cos(th(5))*(cos(th(1))*cos(th(2))*sin(th(3)) + cos(th(1))*cos(th(3))*sin(th(2)));
    F56 = cos(th(5))*(cos(th(2))*sin(th(1))*sin(th(3)) + cos(th(3))*sin(th(1))*sin(th(2))) - sin(th(5))*(cos(th(1))*sin(th(4)) + cos(th(4))*(sin(th(1))*sin(th(2))*sin(th(3)) - cos(th(2))*cos(th(3))*sin(th(1))));
    F66 = sin(th(2) + th(3))*cos(th(4))*sin(th(5)) - cos(th(2) + th(3))*cos(th(5));
    
    Jacobian_Mat = [F11 F12 F13 F14 F15 F16;
                    F21 F22 F23 F24 F25 F26;
                    F31 F32 F33 F34 F35 F36;
                    F41 F42 F43 F44 F45 F46;
                    F51 F52 F53 F54 F55 F56;
                    F61 F62 F63 F64 F65 F66];
end