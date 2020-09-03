% A Filter is generated here to avoid the joint collision during the operations by converting the JOint angles from inverse kinematics to particular quadrants.

function OPx = trimTheta(tempOpx,KR3)

.......................Th1......................................................
        if(tempOpx(1)>=(2*pi))
            tempOpx(1) = tempOpx(1) - 2*pi;
        elseif(tempOpx(1)<=(-2*pi))
            tempOpx(1) = tempOpx(1) - 2*pi;
        end
    .......................Th2......................................................
        if(tempOpx(2)>=(2*pi))
            tempOpx(2) = tempOpx(2) - 2*pi;
        elseif(tempOpx(2)<=(-2*pi))
            tempOpx(2) = tempOpx(2) - 2*pi;
        end
    .......................Th3......................................................
        if(tempOpx(3)>=(2*pi))
            tempOpx(3) = tempOpx(3) - 2*pi;
        elseif(tempOpx(3)<=(-2*pi))
            tempOpx(3) = tempOpx(3) - 2*pi;
        end
    .......................Th4......................................................
        if(tempOpx(4)>=(2*pi))
            tempOpx(4) = tempOpx(4) - 2*pi;
        elseif(tempOpx(4)<=(-2*pi))
            tempOpx(4) = tempOpx(4) - 2*pi;
        end
    .......................Th5......................................................
        if(tempOpx(5)>=(2*pi))
            tempOpx(5) = tempOpx(5) - 2*pi;
        elseif(tempOpx(5)<=(-2*pi))
            tempOpx(5) = tempOpx(5) - 2*pi;
        end
    .......................Th6......................................................
        if(tempOpx(6)>=(2*pi))
            tempOpx(6) = tempOpx(6) - 2*pi;
        elseif(tempOpx(6)<=(-2*pi))
            tempOpx(6) = tempOpx(6) - 2*pi;
        end
............................Exception of Qlimit......................................
    
.......Th1...........................................
    
        if(tempOpx(1)<KR3.qlim(1,1))        
            OPx(1) = KR3.qlim(1,1);
            warning(' Q-limit Reached at Theta One')
        elseif(tempOpx(1)>KR3.qlim(1,2))
            OPx(1) = KR3.qlim(1,2);
            warning(' Q-limit Reached at Theta One')
        else
            OPx(1) = tempOpx(1);
        end
        
.......Th2...........................................
    
        if(tempOpx(2)<KR3.qlim(2,1))        
            OPx(2) = KR3.qlim(2,1);
%             warning(' Q-limit Reached at Theta Two')
        elseif(tempOpx(2)>KR3.qlim(2,2))
            OPx(2) = KR3.qlim(2,2);
%             warning(' Q-limit Reached at Theta Two')
        else
            OPx(2) = tempOpx(2);
        end
        
.......Th3...........................................
    
        if(tempOpx(3)<KR3.qlim(3,1))        
            OPx(3) = KR3.qlim(3,1);
            warning(' Q-limit Reached at Theta Three')
        elseif(tempOpx(3)>KR3.qlim(3,2))
            OPx(3) = KR3.qlim(3,2);
            warning(' Q-limit Reached at Theta Three')
        else
            OPx(3) = tempOpx(3);
        end
        
.......Th4...........................................
    
        if(tempOpx(4)<KR3.qlim(4,1))        
            OPx(4) = KR3.qlim(4,1);
            warning(' Q-limit Reached at Theta Four')
        elseif(tempOpx(4)>KR3.qlim(4,2))
            OPx(4) = KR3.qlim(4,2);
            warning(' Q-limit Reached at Theta Four')
        else
            OPx(4) = tempOpx(4);
        end
        
.......Th5...........................................
    
        if(tempOpx(5)<KR3.qlim(5,1))        
            OPx(5) = KR3.qlim(5,1);
            warning(' Q-limit Reached at Theta Five')
        elseif(tempOpx(5)>KR3.qlim(5,2))
            OPx(5) = KR3.qlim(5,2);
            warning(' Q-limit Reached at Theta Five')
        else
            OPx(5) = tempOpx(5);
        end
        
.......Th6...........................................
    
        if(tempOpx(6)<KR3.qlim(6,1))        
            OPx(6) = KR3.qlim(6,1);
            warning(' Q-limit Reached at Theta Six')
        elseif(tempOpx(6)>KR3.qlim(6,2))
            OPx(6) = KR3.qlim(6,2);
            warning(' Q-limit Reached at Theta Six')
        else
            OPx(6) = tempOpx(6);
        end
end