clear all;
clc;
close all;

%% DH Parameter of Manipulator
% DH-Parameter is the configuration that is needed to generate the robot simulation.
% Using those configurations a robot can be built into a software to generate for simulation.
% Here Robotic Toolbox of Peter Corke's is used for generating manipulators into MATLAB.
% As seen below, it can be seen that each joint of a manipulator is defined into an array, and then that array is called into the SerialLink which generates the manipulator based on the DH-Parameter.

   
L (1) = Revolute('d',0.345  ,'a',0.02   ,'alpha',pi/2       ,'qlim',[-2.9671 2.9671],   'offset',0);
L (2) = Revolute('d',0      ,'a',0.260  ,'alpha',0          ,'qlim',[-0.8727 2.9671],   'offset',0);
L (3) = Revolute('d',0      ,'a',0.02   ,'alpha',pi/2       ,'qlim',[-2.7053 1.9198],   'offset',pi/2);
L (4) = Revolute('d',0.260  ,'a',0      ,'alpha',(-pi/2)    ,'qlim',[-3.0543 3.0543],   'offset',(-80*pi)/180);
L (5) = Revolute('d',0      ,'a',0      ,'alpha',(pi/2)     ,'qlim',[-2.0945 2.0945],   'offset',0);
L (6) = Revolute('d',0.075  ,'a',0      ,'alpha',0          ,'qlim',[-6.1087 6.1087],   'offset',0);
qz = [0 0 0 0 0 0];
KR3 = SerialLink(L,'name','KUKA KR3 Agilus');
KR3.manufacturer = 'JD & M';
KR3.ikineType = 'KR3';

%% Inputs
% In this section, The task space points which are generated using other software like SolidWorks are being converted using the ConversionC function into an array.
% Time limit is also given to complete the given task.

% Points = conversionP('Trianguler_Piramid.csv');
Points = conversionC('Circle.csv');
N = length(Points(1,:));
timeDuration = 1;
tic

%% Trajectory
% A quintic polynomial is generated using the trajectory function for a smoother path.
% Quintic polynomial can smoother the position until its fifth derivative. For smoother operation as in the manipulator's joint velocity and acceleration, quintic is used.

[traj,T] = trajectory(Points,timeDuration);
figure;

%%URDF Model
% URDF model was generated using the Solidwork model, the only difference in the Simulink model and URDF is that the Simulink model had a mass of all joints and in this URDF model all the joints are massless.
% Instead of exporting the STEP file from SolidWorks, the STL file was exported and called here using the MATALB's robotic toolbox.

KR = importrobot('Model_ver_2.urdf');
Config = homeConfiguration(KR);

%% Inverse Kinematics
% In this section, Inverse kinematics is solved for the above-generated trajectory.
% Due to the absence of an analytical solution of KR3, the numerical iterative solution is used to calculate the inverse kinematics of the given trajectory using the fsolve.
% Although the analytical solution is derived partially and it's used as the initial value need into the fsolve.
    
count = 0;
for k = 1:N-1
    for h = 1:length(T)-1
        Des = traj(:,:,h,k);
        Ini_val = geo_sol(Des);
        if(h == 1 && k == 1)
            Ini_val = geo_sol(Des);
        elseif(h==1 && k~=1)
            Ini_val = OPx(:,length(T)-1,k-1); 
        else
            Ini_val = OPx(:,h-1,k);
        end 
        Func = 1e-3;
        Step = 1e-3; 
        options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt','FunValCheck','on','FunctionTolerance',Func,'StepTolerance',Step);
        tempOpx(:,h,k) = fsolve(@ikine_Num,Ini_val,options,Des);
        
%% Checking Joint Limitation
% Here to avoid collision of the joints into the simulation, a filter is used for joint angles. which converts the angle from one quadrant to another quadrant.
        OPx(:,h,k) = trimTheta(tempOpx(:,h,k),KR3);
        
%% Checking Singularities
% To detect any type of singularity, a conditional filter is used in which the Jacobian Matrix is calculated and its determinant is the which is used to separate the singular pose.
        Jacobian(:,:,h,k) = KR3.jacob0(OPx(:,h,k));
        Determinant(h,k) = det(Jacobian(:,:,h,k));
        
............................Error & Debugging........................................
    
        if ((Determinant(h,k) <= 1e-4) && (Determinant(h,k) >= (-(1e-4))))
            fprintf('\n Jacobian of the pose(%d(%d)).\n',k,h);
            disp(Jacobian(:,:,h,k));
            fprintf('\n Determinant of the pose(%d(%d)): %f\n',k,h,Determinant(h,k));
            warning('Determinant of the pose zero it shows the singularity.')
        end
        
       for t = 1:6
            Config(t).JointPosition = OPx(t,h,k);
        end
        show(KR,Config);
        pause(0.000001);
    end
    
TimeStamp(:,k) = T+((k-1)*(timeDuration/(N-1)));
end
toc