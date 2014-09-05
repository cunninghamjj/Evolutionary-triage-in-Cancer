Software for simulations in manuscript and user's manual.

Created by Jessica Cunningham (jessica.cunningham at moffitt.org) in the department of Imaging at the Moffitt Cancer Research Institute, Tampa, FL.

Publication: In review.

## Table of Contents

##### Matlab Setup to run simulation
1. System requirements
2. Downloading simulation
3. Matlab path requirements

##### Running simulation
1. Setting parameters
2. Choosing prefabricated or creating original parameters
3. Saving workspaces

##### Examining data from manuscript
1. Loading data
2. Plotting

##### Copyright and disclaimer

##### Acknowledgements

## Matlab Setup to run simulatiom

#### 1. System requirements
To setup and run the simulation you will need a computer running version Matlab 2010a or higher. No special toolboxes are required.

#### 2. Downloading simulation
Download the ZIP of all contents from https://github.com/cunninghamjj/Evolutionary-triage-in-Cancer into a folder of your choice. Once downloaded, unzip the contents and discard the .zip file.

#### 3. Matlab path requirements
Open Matlab and change path the folder with the downloaded files. Then go to File -> Set Path -> Add with Subfolders and select the folder with the downloaded files. This will allow access to plotting functions as well as prefabricated parameter sets. 

## Running Simulation

#### 1. Setting parameters
This simulation has a multitude of parameters to define the specific simulation to run. Below is the explaination of each of the individual parameters. This will also explain which parameters can be loaded from prefabricated files used specifically for the manuscript and how to do so. 

###### maxSimTime: The number of generations the evolutionary dynamics will simulate for the tumor population. In the manuscript, for simulations to a single ESS this is set to 1000. For simulations to multiple ESSs this is set to 1500. 

###### numberOfRuns: The number of replicates of the simulation to be run automatically. 

###### nGenes: The number of "active" genes. Possible inputs are 4, 8, 12, 16, or 20. These are the only values that will work in the function CreateGenes. If the prefabricated 16 genes used in the manuscript are loaded this parameter will be automatically set to 16.

###### nNeutralGenes: The number of neutral genes that confer no change to either survivorship or fecundity. This is set to 4 as this is how many are used in manuscript data.

###### nLethalGenes: The number of genes that cause immediate cell death if mutated. This is set to 2 as this is how many are used in manuscsript data.

###### startIndex: This is the index indicating which initial phenotype or 'starting point' for the population within the simulation. The choices are either 1, 2, or 3 corresponding to the starting points described in the manuscript.

###### ESS: This is a tag indicating which ESS and adaptive landscape the population will evolve within. The options are 1, 2, or Switch. 1 and 2 are for single ESSs while Switch will first go to ESS1 and then at maxSimTime/2 will switch the landscape to ESS2. These are the three options explored in the manuscript.

###### numberOfCells: Indicates the initial number of cells the population begins with. This is set to 250 for manuscript data.

###### maxNumberOfCells: Indicates the maximum number of cells allowed within the population and when random lottery selection will begin if the population exceeds this value. This is set to 500 for the manuscript. 

###### mutationRate: This indicates the probability of a cell acquiring a new mutation during a cell division. For example, 0.01 as used in the manuscript, is a 1% chance of a acquiring a mutation during a mutation event. 

###### targetedGene: This indicates the index of the gene which the targeted therapy will affect. For the manuscript this is set to 16. This can be set to any value between 1-nGenes.

###### targetedTherapyTime: This is the simulation generation time in which the targeted therapy will begin to take effect. This can be set to inf if the simulation will not have this therapy administered. Otherwise it can be set to any value between 1-maxSimTime. For the manuscript it is either set to 500 or 1000, depending if the population is evolving to a single ESS or multiple ESSs respectively.

###### targetedTreatmentEfficacy: This the probability that if the mutation is present within a cell that it will cause cell death. For the manuscript this is set to 0.25 indicating a 25% efficacy. This can be set to any value between 0-1.

###### neverGene: This indicates the index of the gene which the upregulation therapy will affect. For the manuscript this is set to 1. This can be set to any value between 1-nGenes.

###### neverTherapyTime: This is the simulation generation in which the upregulation therapy will begin to take affect. This can be set to inf if the simulation will not have this therapy administered. Otherwise it can be set to any value between 1-maxSimTime. For the manuscript it is either set to 300 or 800, depending if the population is evolving to a single ESS or multiple ESSs respectively.

###### neverTreatmentEfficacy: This is the probability that a cell that did not have the set neverGene will acquire the neverGene within that generation. This is set to 0.25 indicating a 25% probability. This can be set to any value between 0-1.

###### completeEradication: This is a counter used when running multiple runs of the simulation at once to keep track of the success of the therapy or therapies used. If the population size reaches 0 before the end of the simulation this counter is incremented by 1.

#### 2. Choosing prefabricated or creating original parameters
There are two instances where the user can either use prefabricated parameters used within the manuscript or allow the code to create original parameters. 
##### a. The first is where the active genes are created. To load the 16 genes used in the manuscript the user can uncomment the corresponding load function and comment out the CreateGenes function. If new original genes using the randomized algorithm are to be created the CreateGenes function should be uncommented and the load function for the manuscript genes should be commented. Please ensure to have only one of these options uncommented in order to ensure the user is running the simulation they intend. 
##### b. The second instance is where the 2^nGenes genomes are created, bounded, and mapped to each ESS. If new genes were created using the randomized algorithm than the user must uncomment and run the MapGenomes function in order to created the necessary genome information for the rest of the simulation. This is a computationally heavy function. Because of this, if using the 16 prefabricated genes used in the manuscript it is advised to comment out the MapGenomes function and instead load the prefabricated results of the MapGenome function associated with the start point selected. Again, please ensure to have only one of these options uncommented in order to ensure the user is running the simulation they intend. 

#### 3. Saving Workspaces
At the end of each run of the simulation, the entire workspace will be saved to the current folder in Matlab. If multiple replicates of the same simulation are run automatically the replicates will be labeled Run1.mat - Run[numberOfRuns].mat. The user can then organize these data sets as they see fit in their own file structure. For example, see the organization structure of the data used for the manuscript, available at http://tinyurl.com/ntslsy8.


## Examining data from manuscript
#### 1. Loading data
To load workspaces from previously run simulations use File -> Open in Matlab and choose the Run*.mat of your choice. This will load the entire workspace saved after the simulation was run. Data analysis can then be performed. 

#### 2. Plotting
There are a total of 9 possible plotting function located at the end of the Main function. These plotting functions are not located within the loop where multiple replicates of the simulation will be run due to the amount of figures produced slows down or even crashes Matlab due to memory problems. They are located in a code cell and can be run for any saved workspace. In this way, if multiple replicates are performed, opening the saved workspace and running the Plotting code cell will create all figures for that run. 


## COPYRIGHT AND DISCLAIMER

This software and documentation contained with it are copyright © 2014 by Jessica Cunningham and the Moffitt Cancer Research Institute.  All rights are reserved.

This software is supplied 'as is' without any warranty or guarantee of support.  The Moffitt Cancer Research Institute is not responsible for its use, misuse, or functionality.  In no event shall the authors or copyright holders be liable for any claim, damages, or other liability arising from, out of, or in connection with this software.


## ACKNOWLEDGEMENTS

Thanks to both Joel Brown and Robert Gatenby for their patience and support through the many iterations of this simulation. 
