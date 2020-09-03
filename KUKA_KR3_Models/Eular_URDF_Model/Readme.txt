........................prerequisites for running Simulations..............................


Please go through the "Readme.txt" files given in all the subfolders for a better understanding of codes and output.

Each subfolder contains the file named "(Folder Name).pdf" in which the final srccode(Source Code or Main Code) is written and the output is shown with description.

With the same name as the pdf file, a ".m" file is given in which the srccode is written and can be run in MATLAB.

Other files in folders required function files or the saved workspace file.

Please ensure that your MATLAB has already installed the "Peter Corke Robotic System Toolbox" cause many functions are used from the toolbox.

To check whether the toolbox is installed or not simply write the "rtbdemo" in the command window if the pop up opens than it's installed else go to the following website "https://petercorke.com/toolboxes/robotics-toolbox/" and download the "RTB10.4.mltbx" file and run into your MATLAB.

All the values of the particular variable can be changed except the DH-Parameter which describes the configuration of the manipulators. Before changing the values make sure you know what you are doing cause many things will be running at the same time and if your get stuck anywhere it would be hard to debug it or just run it as it is and flex on your friends ;);).



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