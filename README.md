# Supplementary Files for Reproducing GENIE3 Results
To reproduce the results of GENIE3, you need to follow the steps mentioned below. 
* **Step 1:** Install R version 3.5.1 in your experimental environment ([here](https://github.com/sap01/Test_GENIE3_supplem/blob/master/README.md#installing-r-version-351-in-the-experimental-environment))
* **Step 2:** Execute the GENIE3 algorithm ([here](https://github.com/sap01/Test_GENIE3_supplem/blob/master/README.md#executing-the-genie3-algorithm-in-the-experimental-environment)).

## Installing R version 3.5.1 in the Experimental Environment
In this section, the following sub-steps are described:
* Installing or compiling R ([here](https://github.com/sap01/Test_GENIE3_supplem/blob/master/README.md#installing-or-compiling-r))
* Installing the ‘packrat’ dependency management package for R ([here](https://github.com/sap01/Test_GENIE3_supplem/blob/master/README.md#installing-the-packrat-dependency-management-package-for-r))

### Installing or Compiling R
The experimental environment uses R version 3.5.1 (hereafter, R-3.5.1). Therefore, it is expected that any R version, same or higher than that, should suffice. For R-3.5.1 installation in Windows or macOS, please consult the following official manuals, respectively.
* 'Installing R under Windows': https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Installing-R-under-Windows
  * Download R version 3.5.1 for Windows: https://cran.r-project.org/bin/windows/base/old/3.5.1
* 'Installing R under macOS': https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Installing-R-under-macOS

For Unix and Unix-alike OSs (like - Linux OSs), R-3.5.1 can be compiled to a destination directory of your choice from the R-3.5.1 source tarball ( https://github.com/sap01/Test_GENIE3_supplem/blob/master/Sourcecode/R-3.5.1.tar.gz ). Compilation is different from a system-wide installation. A R compilation inside a specific directory does not affect the system-wide installation or any other compilation inside any other directory. Thus, you may create multiple compilations in your system, where each
compilation refers to a distinct version of R.

Please keep the source tarball and the ‘compileR351.sh’ shell script ( https://github.com/sap01/Test_GENIE3_supplem/blob/master/Sourcecode/compileR351.sh ) inside the same directory. Then open the shell script and replace the value of the variable ‘COMPILEPATH’ to a directory of your choice, where you wish to have the compiled R-3.5.1. For example:
```
COMPILEPATH=/home/saptarshi/R/R-3.5.1
```
Kindly make sure that the given path exists. The script does not create the path itself. After the compilation path is assigned, execute the shell script as shown below: (here, the '$' symbol represents the bash command prompt)
```
$ ./compileR351.sh
```
The execution may take a few minutes to complete. What to do if the execution is successful and what to do if it fails, are described in the following two paragraphs, respectively.

**If ‘compileR351.sh’ Completes Execution Successfully:** If 'compileR351.sh' completes execution successfully, it builds a compiled version of R-3.5.1 inside the given directory. This specific compilation can now be invoked from bash using the following command: (basically, append ‘/bin/R’ to the compilation path)
```
$ /home/saptarshi/R/R-3.5.1/bin/R

R version 3.5.1 (2018-07-02) -- "Feather Spray"
Copyright (C) 2018 The R Foundation for Statistical Computing
...
>
```
Symbol '>' represents the R command prompt.

If the compilation path is very long, writing this command can be a tedious task. Instead, go to your home directory and append the following line to your '.bashrc' file: 
```
alias R351=/home/saptarshi/R/R-3.5.1/bin/R
```
Save and exit '.bashrc'. However, the current bash session keeps using the older version of '.bashrc'. To mitigate this issue, source (reload) '.bashrc' as shown below:
```
$ source .bashrc
```
It creates an alias to the long command. Now, you may use the alias as follows:
```
$ R351

R version 3.5.1 (2018-07-02) -- "Feather Spray"
Copyright (C) 2018 The R Foundation for Statistical Computing
...
>
```

For executing any R script with R-3.5.1, please use the following command in bash:
```
$ /home/saptarshi/R-3.5.1/bin/Rscript path/to/script/script_to_run.R
```
**If ‘compileR531.sh’ Fails:** If 'compileR351.sh' fails (e.g. 'configure: error'), the reason behind the failure is that the OS does not have some of the required dependencies. Resolutions of a number of possible errors are discussed at: http://pj.freefaculty.org/blog/?p=315 ; if required, please find its offline PDF version at: https://github.com/sap01/Test_GENIE3_supplem/blob/master/Sourcecode/building-r-devel-PJ.pdf . Source tarballs of most of the dependency packages are stored at: http://r.research.att.com/src/ . Also the ‘Installing R under Unix-alikes’ official manual can be consulted at: https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Installing-R-under-Unix_002dalikes .

### Installing the 'packrat' Dependency Management Package for R
Once R is installed, the next step is to install the ‘packrat’ package (https://CRAN.R-project.org/package=packrat). It provides a dependency management system for the algorithmic implementations. In other words, it automatically downloads and installs the required packages with the required versions when the implementation of the GENIE3 algorithm is being installed.
In the experimental environment, ‘packrat’ package version 0.4.9-3 is used. Therefore, it is expected that installing the same or higher version would be sufficient.
In the experimental environment, a specific directory, namely 'src downloaded packages' is created to download required external packages, like - 'packrat'. Then the latest version of ‘packrat’ (version 0.4.9-3 at that time) is downloaded inside it and installed to the 'library' directory. This whole process is carried out through the following commands:

```
%% Go to the R compilation’s home directory
$ cd /home/saptarshi/R/R-3.5.1

%% Create a directory for downloading external R packages
$ mkdir src_downloaded_packages

%% Open a R session
$ R351
```
```r
## Download the latest version of the ’packrat’ package
## from ’https://cloud.r-project.org/’
## to ’/home/saptarshi/R/R-3.5.1/src_downloaded_packages’
## and install it inside ’/home/saptarshi/R/R-3.5.1/library’.
> install.packages(’packrat’, ’/home/saptarshi/R/R-3.5.1/library’,
dependencies = TRUE, repos = ’https://cloud.r-project.org/’,
destdir = ’/home/saptarshi/R/R-3.5.1/src_downloaded_packages’)
```
Finally, a directory with the name 'projects' is created where the algorithmic implementation would be installed.
```
$ mkdir /home/saptarshi/R/R-3.5.1/projects
```

## Executing the GENIE3 Algorithm in the Experimental Environment
The R implementation of the GENIE3 algorithm is saved as an R project tarball (https://github.com/sap01/Test_GENIE3_supplem/blob/master/Sourcecode/Test_GENIE3-2020-04-20.tar.gz). This implementation is an extension of R package 'GENIE3' (https://bioconductor.org/packages/GENIE3/). The original implementation in the GENIE3 package is targetted towards cross-sectional data, whereas this extended implementation is customized for time-series data. To use the extended implementation, copy the aforementioned tarball to '/home/saptarshi/R/R-3.5.1/projects':
```
$ scp Test_GENIE3-2020-04-20.tar.gz /home/saptarshi/R/R-3.5.1/projects
```
After that, unbundle the project using 'packrat':
```
%% Go to the project directory
$ cd /home/saptarshi/R/R-3.5.1/projects

%% Open a R prompt
$ R351
```
```r
## Set your favourite CRAN repo, e.g.,
## https://cran.rstudio.com/
> options(repos=structure(c(CRAN="https://cran.rstudio.com/")))

## Unbundle the project inside the current directory
> packrat::unbundle(’Test_GENIE3-2020-04-20.tar.gz’, getwd())
```
Once unbundled, a new project directory will be created with name 'Test_GENIE3'. Go inside the project directory:
```
%% Go to /home/saptarshi/R/R-3.5.1/projects/Test_GENIE3/
$ cd Test_GENIE3
```
Directory 'Test_GENIE3' contains all required R scripts and two sub-directories: 'packrat' and 'asset'. The 'packrat' sub-directory is for internal management of 'packrat' and not to be interfered with. The 'asset' sub-directory is the place where the input and the output files are stored. To reproduce the results of a specific experiment, first you need to copy the corresponding input files into the 'asset' sub-directory:

| Experiment | Input Files to Copy |
| :------------ | :------------ |
| Ds10n | Input\Datasets\Data\InSilicoSize10-Yeast1-trajectories.tsv <br> Input\Datasets\DREAM3GoldStandard_InSilicoSize10_Yeast1_TrueNet.RData <br> Input\Json_files\input.Ds10n.GENIE3.json |
| Ds50n | Input\Datasets\Data\InSilicoSize50-Yeast1-trajectories.tsv <br> Input\Datasets\DREAM3GoldStandard_InSilicoSize50_Yeast1_TrueNet.RData <br> Input\Json_files\input.Ds50n.GENIE3.json |
| Ds100n | Input\Datasets\Data\InSilicoSize100-Yeast1-trajectories.tsv <br> Input\Datasets\DREAM3GoldStandard_InSilicoSize100_Yeast1_TrueNet.RData <br> Input\Json_files\input.Ds100n.GENIE3.json |

For example, if you wish to reproduce the results of the 'Ds10n' experiment, then copy the corresponding input files into the 'asset' sub-directory. A brief description of these files are given in the following table.

| File Name | Description |
| :------------ | :------------ |
| InSilicoSize10-Yeast1-trajectories.tsv | Time-seies dataset |
| DREAM3GoldStandard_InSilicoSize10_Yeast1_TrueNet.RData | True Network |
| input.Ds10n.GENIE3.json | Input parameters for the GENIE3 algorithm <br> saved in a JSON file (http://www.json.org/) |

Once the aforementioned files are copied inside the 'asset' sub-directory, you need to run the GENIE3 algorithm. To do that, please execute the driver R script 'GENIE3.R':
```
%% Kindly Note that only 'input.Ds10n.GENIE3.json' is used instead of 
%% 'asset/input.Ds10n.GENIE3.json'. This is because 'GENIE3.R' is
%% programmed to search for input JSON files in
%% the 'asset' sub-directory.
%% The '&' symbol instructs the execution process to start in the background.
$ nohup time -v /home/saptarshi/R/R-3.5.1/bin/Rscript GENIE3.R input.Ds10n.GENIE3.json > nohup.Ds10n.GENIE3.out &

%% Prints the process ID
[1] 8172
```
Since, the execution process is performed in the background, the bash command prompt can be used for other tasks. If you wish to monitor the execution of the process, you may do so with the ‘top’ command as shown below:
```
%% Show details of the process with ID 8172
$ top -p 8172
```
After the execution is completed, please open file 'nohup.Ds10n.GENIE3.out'. The first two lines provides path to the output directory:
```
[1] "The output directory name is:"
[1] "/home/user/R/R-3.5.1/projects/Test_GENIE3/asset/output20200421115456"
```
The output directory is automatically created with the name 'output' followed by the current date-time. In the above example, directory name 'output20200421115456' stands for 'output directory created on 2020-04-21 11:54:56'.  
Go to the output directory. Inside the output directory, the following three files can be found:

| File Name | Description |
| :------------ | :------------ |
| di_net_adj_matrix_wt.RData | Weighted adjacency matrix of the <br> gene regulatory network reconstructed by GENIE3 |
| output.txt | Console output |
| sessionInfo.txt | R session information |

Please open 'output.txt'. At the end of the file, the elapsed time is displayed as shown below:
```
elapsed_time = 

   user  system elapsed 
  0.894   0.011   0.906 
```
In this case, the runtime of GENIE3 is considered to be 0.906 seconds.  

The 'di_net_adj_matrix_wt.RData' contains an R object named 'di_net_adj_matrix_wt'. This object is a matrix of dimension (number of genes * number of genes). The (i, j)-th cell of the matrix contains a real number representing the confidence of GENIE3 in assigning an edge from gene i to gene j. This number is known as the weight of that edge. The higher the weight, the higher the confidence behind that edge. Therefore, you may wish to sort the edges according to their weights and list the top edges. For that purpose, please open an R command prompt inside the 'Test_GENIE3/' directory and run the following R commands.   
```r
## Please execute the following commands
## from the 'Test_GENIE3/' directory.

## Remove existing R objects, if any.
base::rm(list = base::ls())

## Load the reconstructed gene regulatory network
load('asset/Output_GENIE3_Ds10n/di_net_adj_matrix_wt.RData')

## List top 4 edges by weight 
di_net_adj_list <- GENIE3::getLinkList(di_net_adj_matrix_wt, reportMax = 4, threshold = 0)

## Print top 4 edges.
## Console output lines are prepended with '#>'.
base::print(di_net_adj_list)
#>   regulatoryGene targetGene    weight
#> 1             G3        G10 1.1180511
#> 2             G6         G9 0.8717695
#> 3             G2         G7 0.8273007
#> 4             G2         G1 0.8043170

## Save top 4 edges as an RData file.
## Please replace <output_dir> with
## your output directory name.
base::save(di_net_adj_list, file = 'asset/<output_dir>/di_net_adj_list_top4.RData')
```
Next, you may wish to calculate the correctness of the selected edges. To do so, please run the following R commands.
```r
## Load the R functions required for calculating correctness
base::source('calc_correctness.R')

## Load the true gene regulatory network
load('asset/DREAM3GoldStandard_InSilicoSize10_Yeast1_TrueNet.RData')

## Calculate correctness
correctness <- CalcCorrectnessNetPredDiListVsTrueDiMx(di_net_adj_list, true.net.adj.matrix, print_tr_pos = TRUE)

## Print correctness.
## Console output lines are prepended with '#>'.
## TP = Number of true positives.
## TN = Number of true negatives.
## FP = Number of false positives.
## FN = Number of false negatives.
## TPR = True positive rate or recall.
## FPR = False positive rate.
## FDR = False discovery rate.
## PPV = Positive predictive value or precision.
## ACC = Accuracy.
## MCC = Matthews Correlation co-efficient.
## F1 = F1-score.
base::print(correctness)
#>      TP TN FP FN TPR        FPR FDR PPV  ACC         MCC F1
#> [1,]  0 86  4 10   0 0.04444444   1   0 0.86 -0.06804138  0

## Save correctness metrics as an RData file.
## Please replace <output_dir> with
## your output directory name.
base::save(correctness, file = 'asset/<output_dir>/correctness_top4.RData')
```
You may find the previously produced results [here](https://github.com/sap01/Test_GENIE3_supplem/blob/master/Output/).
