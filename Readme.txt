
......................................Index...............................................


(1) Prerequisites for running Simulations : Common things required for simulations

(2) ABB_PeterCorke_Model : Peter Corke Model for ABB IRB1140 6-DOF Manipulator

(3) RV2_PeterCorke_Model : Peter Corke Model for Mitsubishi RV-2AJ 5-DOF Manipulator

(4) Numerical_Comparison : No simulations here, just a computation for our project's final results

(5) KUKA KR3 Models

	(i) Euler_Simulink_Model : KUKA KR3 simulations based on Euler Method using Simulink

	(ii) Euler_URDF_Model : KUKA KR3 simulations based on Euler Method using URDF

	(iii) KR3_PeterCorke_Model : Peter Corke Model for KUKA KR3 R540 6-DOF Manipulator

	(iv) Quaternion_Simulink_Model : KUKA KR3 simulations based on Dual Quaternion Method using Simulink
	
(6) Contact Details
	
	
........................Prerequisites for running Simulations..............................


Please go through the "Readme.txt" files given in all the subfolders for a better understanding of codes and output.

Each subfolder contains the file named "(Folder Name).pdf" in which the final srccode(Source Code or Main Code) is written and the output is shown with description.

With the same name as the pdf file, a ".m" file is given in which the srccode is written and can be run in MATLAB.

Other files in folders required function files or the saved workspace file.

Please ensure that your MATLAB has already installed the "Peter Corke Robotic System Toolbox" cause many functions are used from the toolbox.

To check whether the toolbox is installed or not simply write the "rtbdemo" in the command window if the pop up opens than it's installed else go to the following website "https://petercorke.com/toolboxes/robotics-toolbox/" and download the "RTB10.4.mltbx" file and run into your MATLAB.

All the values of the particular variable can be changed except the DH-Parameter which describes the configuration of the manipulators. Before changing the values make sure you know what you are doing cause many things will be running at the same time and if your get stuck anywhere it would be hard to debug it or just run it as it is and flex on your friends ;);).



............The following instructions are limited to particular folder..................


...........................(1) ABB_PeterCorke_Model......................................


A 6-DOF manipulator was generated for the calculation named "ABB IRB140".

A file name "ABB_PeterCorke_Model.pdf" contains the published documentation and the srccode with the output.

To run the srccode open the file "ABB_PeterCorke_Model.m" in the MATLAB and push the run button from the menu. Please make sure you have installed the Peter Corkes toolbox in MATLAB else it will show the error while plotting.

Other files in the folder are for different functions used for the simulation and calculation.

"Circle.csv" and "Trianguler_Piramid.csv"  files contain the coordinates in a table form generated from the Solidworks.

"ConversionC.m(Contains the Circular Path)" and " ConversionP.m(Contains the Pyramid shape.)" are is a function used for the conversion needed when the coordinate file is called into MATLAB. It converts the data set of coordinates from table to array form.

"geo_sol.m" is the geometric solution of the KUKA KR3 (Yes, the robot is different but as it's just used as an initial value in fsolve it helps to converge it faster.) which is derived by hand on pen & paper.

"ikine_Num.m" contains the "fsolve(an inbuilt function in MATLAB for solving the non-linear equations)" equations in which a numerical iterative method is used to solve the inverse kinematics of the task space points.

"trajectory.m" a quintic polynomial or a 5th order polynomial is used to generate a smoother trajectory between the given points.



............................(2) RV2_PeterCorke_Model.....................................


A 5-DOF manipulator was generated for the calculation named "Mitsubishi RV-2AJ".

A file name "RV2_PeterCorke_Model.pdf" contains the published documentation and the srccode with the output.

To run the srccode open the file "RV2_PeterCorke_Model.m" in the MATLAB and push the run button from the menu. Please make sure you have installed the Peter Corkes toolbox in MATLAB else it will show the error while plotting.

Other files in the folder are for different functions used for the simulation and calculation.

"Circle.csv" and "Trianguler_Piramid.csv" files contain the coordinates in a table form generated from the Solidworks.

"ConversionC.m(Contains the Circular Path)" and " ConversionP.m(Contains the Pyramid shape.)" is a function used for the conversion needed when the coordinate file is called into MATLAB. It converts the data set of coordinates from table to array form.

"geo_sol.m" is the geometric solution of the KUKA KR3 (Yes, the robot is different but as it's just used as an initial value in fsolve it helps to converge it faster.) which is derived by hand on pen & paper.

"ikine_Num.m" contains the "fsolve(an inbuilt function in MATLAB for solving the non-linear equations)" equations in which a numerical iterative method is used to solve the inverse kinematics of the task space points.

"trajectory.m" a quintic polynomial or a 5th order polynomial is used to generate a smoother trajectory between the given points.



............................(3) Numerical_Comparison.....................................


In this folder, a file name "Numerical_Comparison.pdf" contains the published documentation, the srccode, and output.

A file named "Numerical_Comparison.m" is the main srccode in which the experimental data is generated using the other functions and data set for the final results and comparison between the methods.

Other files in the folder starting with the ABB, KR3, and RV2 are the function files used to called and calculate the different data for each manipulator respectively.

And the ".mat" files are the workspace files in which the equations were derived using the different codes and saved to decrease the time-lapse and the computation for final results.



............................(4) KUKA KR3 Models.....................................


This folder contains the other subfolders which are described below.


...........................(i) Eular_Simulink_Model.................................


In this folder, a file name "KR3_Euler_Simulink_Model.pdf" contains the published documentation, the srccode, and output.

The main srccode file is "Eular_Final_Model.m" in which the final srccode for Simulink simulations is written.

"Circle.csv" and "Trianguler_Piramid.csv" files contain the coordinates in a table form generated from the Solidworks.

"ConversionC.m(Contains the Circular Path)" and " ConversionP.m(Contains the Pyramid shape.)" is a function used for the conversion needed when the coordinate file is called into MATLAB. It converts the data set of coordinates from table to array form.

"geo_sol.m" is the geometric solution of the KUKA KR3 which is derived by hand on pen & paper.

"ikine_Num.m" contains the "fsolve(an inbuilt function in MATLAB for solving the non-linear equations)" equations in which a numerical iterative method is used to solve the inverse kinematics of the task space points.

"trajectory.m" a quintic polynomial or a 5th order polynomial is used to generate a smoother trajectory between the given points.

"trimtheta.m" is one type of filter used to avoid the collision of joints during the simulation cause, in reality, they should not collide with each other. It simply converts the quadrant of particular joint angles. or it simply limits the joint angles if it's going out of its joint limit.

"Simscape_Model_ver_3.slx" the main Simulink file. Simulink model can be open separately by running this file or it will automatically open when the srccode("Eular_Final_Model.m") is run.

Simulink allows us to replicate the outside environment in which manipulators will be used. The Simulink model is can be generated by either importing the assembly of the manipulators or generating the mechanical circuit manually.

After it opens, simply press cntrl+D to update and compile the Simulink model.
After it gets compiled, a window will open containing the manipulator. Then simply press the cntrl+T or play button in the window to run the simulation.

You may face the problem when the Simulink model is compiled which will be probably a simple file path error cause when the Simulink model is generated the ".step" of a particular joint is given manually using a particular path.

To solve that error simply open the KR3 Simulink model and you will see the block for each manipulator's joints. Open those each manipulator joints block one by one. In them you will see a block for a solid body, open that and change the file path for each solid part respectively. Choose the given ".step" file in the same folder. It should solve the error while compilation.



...........................(ii) Eular_URDF_Model.................................


In this folder, a file name "KR3_URDF_Model.pdf" contains the published documentation, the srccode, and output.

The main srccode file is at "Final_Code\KUKA_KR3_Models\Eular_URDF_Model\urdf" named "First_Final_Model.m".

"Circle.csv" and "Trianguler_Piramid.csv" files contain the coordinates in a table form generated from the Solidworks.

"ConversionC.m(Contains the Circular Path)" and " ConversionP.m(Contains the Pyramid shape.)" is a function used for the conversion needed when the coordinate file is called into MATLAB. It converts the data set of coordinates from table to array form.

"geo_sol.m" is the geometric solution of the KUKA KR3 which is derived by hand on pen & paper.

"ikine_Num.m" contains the "fsolve(an inbuilt function in MATLAB for solving the non-linear equations)" equations in which a numerical iterative method is used to solve the inverse kinematics of the task space points.

"trajectory.m" a quintic polynomial or a 5th order polynomial is used to generate a smoother trajectory between the given points.

"trimtheta.m" is one type of filter used to avoid the collision of joints during the simulation cause, in reality, they should not collide with each other. It simply converts the quadrant of particular joint angles. or it simply limits the joint angles if it's going out of its joint limit.

"Model_ver_2.urdf" is the main URDF file that calls out the other component required for the simulation. It is simply a peter corke type of simulation but with the Simulink type manipulator's visual.

Just like the Simulink uses the ".step" file for each part of the manipulators in the simulation, it uses the ".stl" file format for its simulation which is stored at the "\Final_Code\KUKA_KR3_Models\Eular_URDF_Model\meshes".

A plug-in is used to export the URDF model from the Solidwork. Which was found by my group partner so I'm guessing all you have to just google "URDF Plugin for Solidwork" it should show step by step for installation of it into Solidwork and exporting to MATLAB.



............................(iii) KR3_PeterCorke_Model.....................................


A 6-DOF manipulator was generated for the calculation named "KUKA KR3 R540".

A file name "KR3_PeterCorke_Model.pdf" contains the published documentation and the srccode with the output.

To run the srccode open the file "KR3_PeterCorke_Model.m" in the MATLAB and push the run button from the menu. Please make sure you have installed the Peter Corkes toolbox in MATLAB else it will show the error while plotting.

Other files in the folder are for different functions used for the simulation and calculation.

"Circle.csv" and "Trianguler_Piramid.csv" files contain the coordinates in a table form generated from the Solidworks.

"ConversionC.m(Contains the Circular Path)" and " ConversionP.m(Contains the Pyramid shape.)" is a function used for the conversion needed when the coordinate file is called into MATLAB. It converts the data set of coordinates from table to array form.

"geo_sol.m" is the geometric solution of the KUKA KR3 which is derived by hand on pen & paper.

"ikine_Num.m" contains the "fsolve(an inbuilt function in MATLAB for solving the non-linear equations)" equations in which a numerical iterative method is used to solve the inverse kinematics of the task space points.

"trajectory.m" a quintic polynomial or a 5th order polynomial is used to generate a smoother trajectory between the given points.



...........................(iv) Quaternion_Simulink_Model.................................


In this folder, a file name "KR3_Quaternion_Simulink_Model.pdf" contains the published documentation, the srccode, and output.

The main srccode file is "Quaternion_Simulink_Model.m" in which the final srccode for Simulink simulations is written.

"Circle.csv" and "Trianguler_Piramid.csv" files contain the coordinates in a table form generated from the Solidworks.

"ConversionC.m(Contains the Circular Path)" and " ConversionP.m(Contains the Pyramid shape.)" is a function used for the conversion needed when the coordinate file is called into MATLAB. It converts the data set of coordinates from table to array form.

"geo_sol.m" is the geometric solution of the KUKA KR3 which is derived by hand on pen & paper.

"ikine_Num.m" contains the "fsolve(an inbuilt function in MATLAB for solving the non-linear equations)" equations in which a numerical iterative method is used to solve the inverse kinematics of the task space points.

"trajectory.m" a quintic polynomial or a 5th order polynomial is used to generate a smoother trajectory between the given points.

"trimtheta.m" is one type of filter used to avoid the collision of joints during the simulation cause, in reality, they should not collide with each other. It simply converts the quadrant of particular joint angles. or it simply limits the joint angles if it's going out of its joint limit.

"Simscape_Model_ver_3.slx" the main Simulink file. Simulink model can be open separately by running this file or it will automatically open when the srccode("Eular_Final_Model.m") is run.

Simulink allows us to replicate the outside environment in which manipulators will be used. The Simulink model is can be generated by either importing the assembly of the manipulators or generating the mechanical circuit manually.

After it opens, simply press cntrl+D to update and compile the Simulink model.
After it gets compiled, a window will open containing the manipulator. Then simply press the cntrl+T or play button in the window to run the simulation.

You may face the problem when the Simulink model is compiled which will be probably a simple file path error cause when the Simulink model is generated the ".step" of a particular joint is given manually using a particular path.

To solve that error simply open the KR3 Simulink model and you will see the block for each manipulator's joints. Open those each manipulator joints block one by one. In them you will see a block for a solid body, open that and change the file path for each solid part respectively. Choose the given ".step" file in the same folder. It should solve the error while compilation.

"Quat_Conversion.m" files are used to convert the given coordinates into the quaternion form or should I said convert it into the fourth-dimensional coordinates for calculation.

All the files starting as "uquatmulti.m", "dquatmulti.m" and "uquatmultimatrix.m" are the quaternion multiplication function files which are used in sub srccodes for calculation.



..........................A BIG THANK YOU FOR FOLLOWING TILL THE END AND TO ALL WHO WERE PART OF THIS PROJECT :):)..................


For any quarry contact on the following E-mail id's.

Jaydeep Dervariya = jaydeep.d.btechm16@ahduni.edu.in
Manav Chotalia = manav.c.btechi16@ahduni.edu.in