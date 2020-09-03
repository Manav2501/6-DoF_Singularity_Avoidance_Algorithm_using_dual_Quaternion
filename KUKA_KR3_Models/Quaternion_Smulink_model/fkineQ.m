% This function calculates the forward kinematics.

 function [Final_Co_Ordinates,Final_Angles] = fkineQ(th)

....................Quaternion Forward ==> I/P = Theta & O/P = Trans + Rota...............
    
................................DH Parameter of Manipulator......................
    
d = [0.345 0 0 0.260 0 0.075];
a = [0.020 0.260 0.020 0 0 0];
al = [pi/2 0 pi/2 -pi/2 pi/2 0];
th = [pi/4 pi/4 pi/6 pi/6 pi/4 pi/6];
n = length(d);

...............................Quaternion Transformation.........................

        for i = 1:n
            
            A = cos(al(i)/2) * cos(th(i)/2);
            B = sin(al(i)/2) * cos(th(i)/2);
            C = sin(al(i)/2) * sin(th(i)/2);
            D = cos(al(i)/2) * sin(th(i)/2);
            
            Q1 = [A B C D]'; 
            Q2 = [((-a(i)/2)*B)-((d(i)/2)*D) ((a(i)/2)*A)-((d(i)/2)*C) ((a(i)/2)*D)+((d(i)/2)*B) ((-a(i)/2)*C)+((d(i)/2)*A)]';
            
            H(:,:,i) = [Q1;Q2]; % Q = Qr + ep*Qt for each joint
            
            P(i) = quaternion(H(1:4,1,i)'); % Qr = Rotation Part of Each Joint
            Q(i)= quaternion(H(5:8,1,i)');  % Qt = Translation Part of Each Joint
        
        end
        
        [P_final,Q_final] = dquatmulti(P,Q); % P_final  Final Rotation Part Qr & Q_final  Final Translation Part Qt
                
        Final_Co_Ordinates = compact(uquatmulti(2*Q_final,conj(P_final)));
        
        Final_Angles = euler(P_final,'ZYX','frame');

 end




