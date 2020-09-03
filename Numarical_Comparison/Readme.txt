
........................prerequisites for running Simulations..............................


Please go through the "Readme.txt" files given in all the subfolders for a better understanding of codes and output.

Each subfolder contains the file named "(Folder Name).pdf" in which the final srccode(Source Code or Main Code) is written and the output is shown with description.

With the same name as the pdf file, a ".m" file is given in which the srccode is written and can be run in MATLAB.

Other files in folders required function files or the saved workspace file.

Please ensure that your MATLAB has already installed the "Peter Corke Robotic System Toolbox" cause many functions are used from the toolbox.

To check whether the toolbox is installed or not simply write the "rtbdemo" in the command window if the pop up opens than it's installed else go to the following website "https://petercorke.com/toolboxes/robotics-toolbox/" and download the "RTB10.4.mltbx" file and run into your MATLAB.

All the values of the particular variable can be changed except the DH-Parameter which describes the configuration of the manipulators. Before changing the values make sure you know what you are doing cause many things will be running at the same time and if your get stuck anywhere it would be hard to debug it or just run it as it is and flex on your friends ;);).



............................(3) Numerical_Comparison.....................................


In this folder, a file name "Numerical_Comparison.pdf" contains the published documentation, the srccode, and output.

A file named "Numerical_Comparison.m" is the main srccode in which the experimental data is generated using the other functions and data set for the final results and comparison between the methods.

Other files in the folder starting with the ABB, KR3, and RV2 are the function files used to called and calculate the different data for each manipulator respectively.

And the ".mat" files are the workspace files in which the equations were derived using the different codes and saved to decrease the time-lapse and the computation for final results.