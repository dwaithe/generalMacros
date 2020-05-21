# General Macros and Teaching Material for Fiji (ImageJ) and python

This collection of macros and guides is designed to help users with tricky or interesting problems using the image analysis package ImageJ or Fiji.


------------------


### FWHM along a line. 
Script location in GIST: [WHM_along_line_v1.ijm](https://gist.github.com/dwaithe/2b9581324e3c8caf9238765ce50127fb).  
Example file to test script: [2.lif](https://drive.google.com/file/d/1mQ1yezSlPRWksWduzm6WNVTeg0uZU1Qs/view?usp=sharing).   
#### Description:  
A bulk FWHM measuring algorithm was designed and written using ImageJ macro language. Using the ImageJ interface the user defines a line using the Segmented line tool which follows the contour of the GUV to be measured. The algorithm is then run and will interpolate along the user-defined line and calculates points at regular intervals (3 pixel gap). At each interpolated point on the line a perpendicular lines is drawn 40 pixels in length and centred on the interpolated line. Along each of these perpendicular lines the intensity values are sampled and a Gaussian curve is fit using the ImageJ curve fitting plugin. The parameters of each curve are then output and the FWHM calculated for each curve (2*sqrt(2*log(2)*sigma), where sigma of Gaussian fit).  


------------------

# N-Dimensional Gaussian fitting in Fiji/ImageJ


Written by Dominic Waithe. University of Oxford. Follow me on Twitter at @dwaithe: https://twitter.com/dwaithe

Copyright (c) 2016 Dominic Waithe.

#### Introduction:

Gaussian fitting is one of the most common procedures to perform in N-Dimensional signal analysis (i.e. 1-D sequences, 2-D images and 3-D volumes). The focus of this page is to provide ImageJ/Fiji macro scripts which can facilitate fitting of Gaussians to intensity data of varying types. As the dimensions of a signal being studied increase so do the degrees of freedom. In this repository folder enhanced macro scripts will be added which can fit elliptical gaussians. Furthermore general education relating to Gaussian functions, their properties and their varying anisotropies will be added.

##### General Requirements:
Macros written for Fiji/ImageJ. If don't have Fiji, you can download  it here: imagej.net/Fiji/Downloads


#### 2D_GaussFit.ijm

##### Macro script for fitting 2D Gaussians (Diagonally covariant)

Please download the script entitled 2D_GaussFit.ijm and example input 2D_Gaus_sig4.png.
Open both files in Fiji/Imagej by dragging to the toolbar.
with example file:

![alt text](https://github.com/dwaithe/generalMacros/blob/master/gaussian_fitting/2D_Gaus_sig4.png "Example image")
![alt text](https://github.com/dwaithe/generalMacros/blob/master/gaussian_fitting/example_output.png "Example output")


This script includes a rough feature detection using the in built Find Maxima algorithm and then fine 2D Gaussian algorithm to fit Gaussians within square patch regions. This macro is special because the ImageJ/Fiji curve fitting API only supports 1-D curve. I get around this by linearising the equation. The equation is for isotropic (spherical) or anistropic (longer in x/y) diagonally covariant Gaussians but not fully covariant Gaussians (anisotropic and rotated), I will include that in another script. There are further instructions and parameters in the macro itself.

Based on https://en.wikipedia.org/wiki/Gaussian_function two-dimensional Gaussian function.

[Fiji (ImageJ) Introduction lecture and practical.](https://github.com/dwaithe/generalMacros/tree/master/ImageJFIJIteaching "Fiji (ImageJ) Introduction lecture and practical.")

[ND - Gaussian fitting in Fiji (ImageJ) and python.](https://github.com/dwaithe/generalMacros/tree/master/gaussian_fitting "ND - Gaussian fitting in Fiji (ImageJ) and python.")

[1D - Gaussian fitting at intervals along line in Fiji(ImageJ)](https://github.com/dwaithe/generalMacros/tree/master/FWHM%20bulk%20measure "FWHM bulk measure")

[Reimplementation of Fiji (ImageJ) find maxima algorithm in python.](https://github.com/dwaithe/generalMacros/tree/master/maximaFinding "Maxima Finding in Fiji (ImageJ) and python.")

[Macro for counting foci within a region.](https://github.com/dwaithe/generalMacros/blob/master/foci_in_area_basic.ijm "Macro for counting foci within a region.")

[Macro for converting a folder of images to another format.](https://github.com/dwaithe/generalMacros/blob/master/file_converter.ijm "Macro for converting a folder of images to another format.")
