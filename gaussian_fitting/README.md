# N-Dimensional Gaussian fitting in ImageJ and Fiji.


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