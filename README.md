
# hanel_lapo

This is the single cell RNA seq analyis project for the manuscript by Walter Hanel et al.  

Processed source data is available at the private dryad link provided in the manuscript.

Raw source data is available in GEO at the accession number provided in the manuscript.

## Usage Instructions

1.  Clone this analysis project repository to your system.

2.  Download the processed source data package from dryad.  It will likely need to be unzipped depending on how you get it from dryad.  After unzipping it will be a standard compressed R binary package with extension .tar.gz.  Save this to a useful location on your system.

3.  Edit the file "R/dependencies.R" in the analysis project to point the function bb_renv_datapkg to the location where you downloaded the data package in step 2.

4.  Install renv and other dependencies.  You will need to have a number of packages installed to make the analysis project run properly.  Start with the package manager renv.  Running renv::restore() at the top of the dependencies.R file will attempt to install the required packages into a local repository within your copy of the repo.  The current status of package dependencies is recorded in the lockfile.  You will likely need to update or install new package dependencies to make it run properly.

5.  Once all dependencies are installed, then comment out all of the renv:: commands leaving the library, bb_renv_datapkg, and the requireData commands active.  This will load the required packages, install the current version of the data package, and load the data package into a hidden environment in your R session.  You should source this file each time you start an analysis session.  If the source data package has not changed, then you can comment out the bb_renv_datapkg to save time.  

6.  Edit if desired and source the file "R/configs.R".  This has aesthetic/theme settings and specifies input/output for the most part.

7.  Edit if desired and run other code in "R/".

## Reviewing Code That Generated The Source Data

This code is installed with the data package.  Once you have installed the data package, the easiest way to review this code is by navigating to "renv/library/R-4.1/x86_64-pc-linux-gnu/hanel.lapo.datapkg/data-raw".   
