........................prerequisites for running Simulations..............................


Please go through the "Readme.txt" files given in all the subfolders for a better understanding of codes and output.

Each subfolder contains the file named "(Folder Name).pdf" in which the final srccode(Source Code or Main Code) is written and the output is shown with description.

With the same name as the pdf file, a ".m" file is given in which the srccode is written and can be run in MATLAB.

Other files in folders required function files or the saved workspace file.

Please ensure that your MATLAB has already installed the "Peter Corke Robotic System Toolbox" cause many functions are used from the toolbox.

To check whether the toolbox is installed or not simply write the "rtbdemo" in the command window if the pop up opens than it's installed else go to the following website "https://petercorke.com/toolboxes/robotics-toolbox/" and download the "RTB10.4.mltbx" file and run into your MATLAB.

All the values of the particular variable can be changed except the DH-Parameter which describes the configuration of the manipulators. Before changing the values make sure you know what you are doing cause many things will be running at the same time and if your get stuck anywhere it would be hard to debug it or just run it as it is and flex on your friends ;);).



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