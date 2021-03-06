# CSCE 440 Numerical Analysis - Basketball Stat Interpolation

## Team Members
Grant Fishburn and Noah Gould

## Compiling and Executing the Code
1. Download the .zip file containing the source code and data.
2. Unzip the file and place the contents in the desired directory.
3. Open MATLAB on your computer.
4. Navigate to the directory where the files were placed in step 2 using the address
   bar on the MATLAB interface.
5. In the command window in the MATLAB interface, type the following command and
   press enter:

	StatInterpolater('<Player_Name>');

   substituting '<Player_Name>' for a valid player's name in quotes.
   All valid player names are:

	* Carmelo Anthony
	* Chris Paul
	* Dirk Nowitzki
	* Dwyane Wade
	* Kevin Durant
	* Kevin Love
	* Kobe Bryant
	* LeBron James
	* Russell Westbrook
	* Tim Duncan

   An example of a valid command is:

	StatInterpolater('Carmelo Anthony');

6. After the code runs, a new 'Figure' window should appear. Maximize this window
   to view the data as intended because the default smaller window size makes
   viewing the data difficult. Additionally, the legend may overlap some of the data.
   This can be easily fixed by clicking and dragging the legend to a new location
   on the graph.
7. In the 'Figure' window, there will be 5 different graphs: FG Percentage,
   3P Percentage, FT Percentage, Assists Per Game, and Points Per Game. Each
   graph displays a plot of the Lagrange and Piecewise Linear Interpolation
   methods that were used to analyse the data for this project.

NOTE: The UNL CSE server does not support MATLAB, according to the online
      documentation, so the program must be run on a computer with MATLAB installed.

NOTE: There are pictures of all players' graphs generated by running the program
      in the 'Output_Pictures' folder.

## Source Code Explanation

### StatInterpolater.m
StatInterpolater.m contains the main logic for the program, producing a set of
five different graphs for the five stats that were considered in this project:
FG Percentage, 3P Percentage, FT Percentage, Assists Per Game, and Points Per Game.
These stats correspond to data for the players' stats over the years from 2008 to
2014.

StatInterpolater.m begins by opening the CSV file which corresponds to the player's
name that was entered. This data is converted into a matrix to be used later.

The program then iterates over each column of player data, one column per stat,
and generates a set of points to plot from the Lagrange and Piecewise Linear
Interpolation methods. These points are then plotted on separate graphs and
combined into the same 'Figure' window for easy viewing.

### Lagrange.m
Lagrange.m contains the logic to find the Lagrange polynomial that passes through
the given points. First, the function finds the size of the point set to create
an array that will hold the Li(x) values. Each Li(x) value is then calculated using the
formula given in the class slides '5. Lagrange Polynomial.pdf'. The Lagrange
polynomial is then created using the Li(x) values and the f(x) values as specified
in the same class slide deck as above. The resulting simplified Lagrange polynomial
function is then returned to StatInterpolater.m.

### LinearInterpolation.m
LinearInterpolation.m contains the logic to find the piecewise linear polynomials
that passes through the given points. First, the function creates a symbolic matrix
that will hold all of the piecewise linear polynomials. Each piecewise linear
polynomial is then created using the formula given in the class slides '7. Piecewise
Interpolation.pdf'. The symbolic matrix is then simplified and returned to
StatInterpolater.m.

## Data Source
All data was retrieved from Basketball Reference, which can be accessed through:

https://www.basketball-reference.com/

Data was collected by navigating to the respective players' page on Basketball
Reference and modifying the 'Per Game' table using the 'Share & more' option.
Only the desired columns and rows were taken and then downloaded as CSV files,
which are included in the project in the 'Data' folder.