# General Macros and Teaching Material for Fiji (ImageJ) and python

This collection of macros and guides is designed to help users with tricky or interesting problems using the image analysis package ImageJ or Fiji.

### FWHM along a line. 
Script location in GIST: [WHM_along_line_v1.ijm](https://gist.github.com/dwaithe/2b9581324e3c8caf9238765ce50127fb).  
Example file to test script: [2.lif](https://drive.google.com/file/d/1mQ1yezSlPRWksWduzm6WNVTeg0uZU1Qs/view?usp=sharing).   
#### Description:  
A bulk FWHM measuring algorithm was designed and written using ImageJ macro language. Using the ImageJ interface the user defines a line using the Segmented line tool which follows the contour of the GUV to be measured. The algorithm is then run and will interpolate along the user-defined line and calculates points at regular intervals (3 pixel gap). At each interpolated point on the line a perpendicular lines is drawn 40 pixels in length and centred on the interpolated line. Along each of these perpendicular lines the intensity values are sampled and a Gaussian curve is fit using the ImageJ curve fitting plugin. The parameters of each curve are then output and the FWHM calculated for each curve (2*sqrt(2*log(2)*sigma), where sigma of Gaussian fit).  


[Fiji (ImageJ) Introduction lecture and practical.](https://github.com/dwaithe/generalMacros/tree/master/ImageJFIJIteaching "Fiji (ImageJ) Introduction lecture and practical.")

[ND - Gaussian fitting in Fiji (ImageJ) and python.](https://github.com/dwaithe/generalMacros/tree/master/gaussian_fitting "ND - Gaussian fitting in Fiji (ImageJ) and python.")

[1D - Gaussian fitting at intervals along line in Fiji(ImageJ)](https://github.com/dwaithe/generalMacros/tree/master/FWHM%20bulk%20measure "FWHM bulk measure")

[Reimplementation of Fiji (ImageJ) find maxima algorithm in python.](https://github.com/dwaithe/generalMacros/tree/master/maximaFinding "Maxima Finding in Fiji (ImageJ) and python.")

[Macro for counting foci within a region.](https://github.com/dwaithe/generalMacros/blob/master/foci_in_area_basic.ijm "Macro for counting foci within a region.")

[Macro for converting a folder of images to another format.](https://github.com/dwaithe/generalMacros/blob/master/file_converter.ijm "Macro for converting a folder of images to another format.")
