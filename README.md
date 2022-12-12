# LadyBug
Analysis of Ladybug data set


<h1 align="center"> Lady Bug Analysis
     <a style="color:#E7655A;"> Rscript Explanation</a>
</h1>

<p align="center">  
<a><img src="https://img.shields.io/github/stars/FitBeatDepresso?label=Organization%20Stars&style=social"></a>     
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>


## Dataset: 
This dataset included two files (an xlsx and a csv file) which contained an unstructured information on lady bugs such as:<br>
     -sex<br>
     -Information on how and when they were were collected<br>
     -Scientific Names<br>
using Rstudio, we organized and cleaned the data to perform analysis and give descriptions using different visuals.
## Cleaning
 Step 1: Renaming different columns and rows so that it would have a formal and lineared data set<br>
 Step 2: Left joining the two files<br>
 Step 3: Got rid of Day from date so that we could analyze by month and observe trends<br>
 
 ## Visual 1: Species by Pouplation Grouped by Plot

![Rplot02](https://user-images.githubusercontent.com/108307724/207134532-f8b665ec-6d46-4997-9404-6a615213e849.png)

 Purpose: This visual tells us about the population species in each plot
 Conclusion: <br>
-In plot LP AG(Agriculture):<br>
-The most found species was colemugalla maculata<br>
-In plot LP IC(Industrial):<br>
-The most found species was Harmonia axyridis<br>



 ## Visual 2: Plot by Population
 ![Rplot03](https://user-images.githubusercontent.com/108307724/207134797-0cbccaa0-0af2-475c-87b4-e908d251f298.png)
Purpose:This visual tell us about the number of lad bugs collecetd from each plot. 
Conclusion:<br>
-The plot the most species were found in was LP GU(Unmowed grass)<br>
-The plot the least specie swerve found in were LP GF(Forested)<br>


 ## Visual 3: Plot by Month Grouped by Species
 ![Rplot08](https://user-images.githubusercontent.com/108307724/207135034-31f6fbf5-6a3d-443e-8d1c-b568df9550da.png)
 
Purpose: This visual tells about about the months that each species were collected.
Conclusion:<br>
-Least species found in June, most found in July and August<br>
-Psyllobora vigintimaculata only found in August<br>
-Coleomegilla maculata(Yellow), Chilocorus stigma(Orange), found all three months<br>
-Larvae and Pupa found only in June<br>




