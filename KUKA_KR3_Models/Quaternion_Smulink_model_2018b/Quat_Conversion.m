% Converting the point into Quaternion form and checking the Dual Quaternion condition.

function Des = Quat_Conversion(Points)
        Qr_quat = quaternion([Points(6) Points(5) Points(4)],'eulerd','ZYX','frame');
        Qt_quat = uquatmulti((1/2)*quaternion(0,Points(1),Points(2),Points(3)),Qr_quat);
        Qr = compact(Qr_quat);
        Qt = compact(Qt_quat);
        
        First_Con = Qr(1)^2 + Qr(2)^2 + Qr(3)^2 + Qr(4)^2;
        Second_Con = Qr(1)*Qt(1) + Qr(2)*Qt(2) + Qr(3)*Qt(3) + Qr(4)*Qt(4);
        
        if (int8(First_Con) ~= 1)
            fprintf('1st Point number is %d %f \n',k,First_Con);
            disp(Points(:)');
            disp(Qr_quat);
            disp(Qt_quat);
        end
        if ((int8(Second_Con) >= 1e-4) && (int8(Second_Con) <= (-(1e-4))))
            fprintf('2nd Point number is %d %f \n',k,Second_Con);
            disp(Points(:)');
            disp(Qr_quat);
            disp(Qt_quat);
        end
        Des = [Qr Qt];
end