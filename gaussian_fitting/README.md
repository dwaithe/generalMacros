# 2D Gaussian fitting example with rough feature identification.


Written by Dominic Waithe. University of Oxford. Follow on Twitter at @dwaithe: https://twitter.com/dwaithe
Copyright (c) 2016 Dominic Waithe.

#### Details:
Macros written for Fiji/ImageJ. 



#### 2D_GaussFit.ijm 
with example file 2D_Gaus_sig4.png

This script includes a rough feature detection and then fine 2D Gaussian algorithm to fit Gaussians within patches regions.
This macro is special because the ImageJ/Fiji curve fitting API only supports 1-D curve. I get around this by linearising the equation.
The equation is for isotropic (spherical) or anistropic (longer in x/y) diagonally covariant Gaussians but not fully covariant Gaussians (anisotropic and rotated), I will include that in another script.

Based on https://en.wikipedia.org/wiki/Gaussian_function two-dimensional Gaussian function