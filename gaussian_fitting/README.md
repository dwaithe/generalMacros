# 2D Gaussian fitting example with rough feature identification.


Written by Dominic Waithe. University of Oxford. Follow me on Twitter at @dwaithe: https://twitter.com/dwaithe

Copyright (c) 2016 Dominic Waithe.

#### Details:
Macros written for Fiji/ImageJ. If don't have Fiji, you can download  it here: imagej.net/Fiji/Downloads
Please download the script entitled 2D_GaussFit.ijm and example input 2D_Gaus_sig4.png.
Open both files in Fiji/Imagej by dragging to the toolbar.


#### 2D_GaussFit.ijm 
with example file:

![alt text](https://github.com/dwaithe/generalMacros/blob/master/gaussian_fitting/2D_Gaus_sig4.png "Example image")


This script includes a rough feature detection using the in built Find Maxima algorithm and then fine 2D Gaussian algorithm to fit Gaussians within square patch regions. This macro is special because the ImageJ/Fiji curve fitting API only supports 1-D curve. I get around this by linearising the equation. The equation is for isotropic (spherical) or anistropic (longer in x/y) diagonally covariant Gaussians but not fully covariant Gaussians (anisotropic and rotated), I will include that in another script. There are further instructions and parameters in the macro itself.

Based on https://en.wikipedia.org/wiki/Gaussian_function two-dimensional Gaussian function