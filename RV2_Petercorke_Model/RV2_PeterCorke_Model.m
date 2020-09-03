clear all;
clc;
close all;

%% DH Parameter of Manipulator
% DH-Parameter is the configuration that is needed to generate the robot simulation.
% Using those configurations a robot can be built into a software to generate for simulation.
% Here Robotic Toolbox of Peter Corke's is used for generating manipulators into MATLAB.
% As seen below, it can be seen that each joint of a manipulator is defined into an array, and then that array is called into the SerialLink which generates the manipulator based on the DH-Parameter.
   
L (1) = Revolute('d',0.300  ,'a',0      ,'alpha',-pi/2      ,'qlim',[-2.6180 2.6180],   'offset',0);
L (2) = Revolute('d',0      ,'a',0.250  ,'alpha',0          ,'qlim',[-1.0472 2.0944],   'offset',0);
L (3) = Revolute('d',0      ,'a',0.160  ,'alpha',0          ,'qlim',[-1.9199 2.0944],   'offset',0);
L (4) = Revolute('d',0      ,'a',0      ,'alpha',-pi/2      ,'qlim',[-1.5708 1.5708],   'offset',0);
L (5) = Revolute('d',0.072  ,'a',0      ,'alpha',0          ,'qlim',[-3.4907 3.4907],   'offset',0);
qz = [0 0 pi/2 0 0]; %Home position where all thetas are zero
rv2 = SerialLink(L,'name','RV-2AJ');
rv2.manufacturer = 'JD & M';

%% Inputs
% In this section, The task space points which are generated using other software like SolidWorks are being converted using the ConversionC function into an array.
% Time limit is also given to complete the given task.

% Points = conversionP('Trianguler_Piramid.csv');
Points = conversionC('Circle.csv');
N = length(Points(1,:));
timeDuration = 4;
tic

%% Trajectory
% A quintic polynomial is generated using the trajectory function for a smoother path.
% Quintic polynomial can smoother the position until its fifth derivative. For smoother operation as in the manipulator's joint velocity and acceleration, quintic is used.
[traj,T] = trajectory(Points,timeDuration);


figure;trplot(rv2.fkine(qz),'length',0.001);
hold on;
for i = 1 : N-1
    for j = 1 : length(traj(1,1,:,1))
        trplot(traj(:,:,j,i),'length',0.01,'notext','color','r');
    end
end

%% Inverse Kinematics
% In this section, Inverse kinematics is solved for the above-generated trajectory.
% Due to the absence of an analytical solution of KR3, the numerical iterative solution is used to calculate the inverse kinematics of the given trajectory using the fsolve.
% Although the analytical solution is derived partially and it's used as the initial value need into the fsolve.
    
count = 0;
for k = 1:N-1
    for h = 1:length(T)-1
        Des = traj(:,:,h,k);
        if(h == 1 && k == 1)
            Ini_val = [pi/6 pi/6 pi/6 pi/6 pi/6];
        elseif(h==1 && k~=1)
            Ini_val = OPx(:,length(T)-1,k-1); 
        else
            Ini_val = OPx(:,h-1,k);
        end 
        Func = 1e-3;
        Step = 1e-3; 
        options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt','FunValCheck','on','FunctionTolerance',Func,'StepTolerance',Step);
        OPx(:,h,k) = fsolve(@ikine_Num,Ini_val,options,Des);

%% Checking Singularities
% To detect any type of singularity, a conditional filter is used in which the Jacobian Matrix is calculated and its determinant is the which is used to separate the singular pose.
        Jacobian(:,:,h,k) = rv2.jacob0(OPx(:,h,k));
        Determinant(h,k) = det(Jacobian(:,:,h,k)'*Jacobian(:,:,h,k));
        
        if ((Determinant(h,k) <= 1e-4) && (Determinant(h,k) >= (-(1e-4))))
            fprintf('\n Jacobian of the pose(%d(%d)).\n',k,h);
            disp(Jacobian(:,:,h,k));
            fprintf('\n Determinant of the pose(%d(%d)): %f\n',k,h,Determinant(h,k));
            warning('Determinant of the pose zero it shows the singularity.')
        end
        
        rv2.plot(OPx(:,h,k)');
        Ans(h,k) = rv2.fkine(OPx(:,h,k));
        trplot(Ans(h,k),'length',0.03,'notext');
    end
    
TimeStamp(:,k) = T+((k-1)*(timeDuration/(N-1)));

end
toc