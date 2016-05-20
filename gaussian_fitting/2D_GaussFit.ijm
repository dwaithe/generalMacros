// 2D Gaussian fitting example with rough feature identification.
//////////////////////////////////////////////

// Written by Dominic Waithe. University of Oxford. Follow on Twitter at @dwaithe. Or https://github.com/dwaithe
// Copyright (c) 2016 Dominic Waithe. See license at bottom of file.

//// Details:
// Fiji/ImageJ. Just make sure its up-to-date. Tested on v 1.49. 
// This script includes a rough feature detection and then fine 2D Gaussian algorithm to fit Gaussians within patches regions.
// This macro is special because the ImageJ/Fiji curve fitting API only supports 1-D curve. I get around this by...
// ...by linearising the equation.
// The equation is for isotropic (spherical) or anistropic (longer in x/y) diagonally covariant Gaussians but not...
// ...fully covariant Gaussians (anisotropic and rotated), I will include that in another script.
// Based on https://en.wikipedia.org/wiki/Gaussian_function two-dimensional Gaussian function


////Parameters:
tol_feat_det = 10; //Tolerance parameter for rough feature finding. Lower will find more peaks.
size_of_patch = 20; //Size of patch to fit Gaussian in. Should be 3-5x size of Gaussian sigma.
display_output = true; //Set to true to output reconstructed patch and fit plot, for speed set to false.

////Instructions:
// Open the test image named 2D_Gaus_sig4.png.
// Run the script, with the run button below.



//Macro starts.
run("Find Maxima...", "noise="+tol_feat_det+" output=[Point Selection]");

title = getTitle();
wid = getWidth();
hei = getHeight();

getSelectionCoordinates(xPoints,yPoints);

for (v=0;v<xPoints.length;v++){
selectWindow(title);
x = newArray(size_of_patch*size_of_patch);
o = newArray(size_of_patch*size_of_patch);
c =0;
for(j=0;j<size_of_patch;j++){
  for(i=0;i<size_of_patch;i++){
  	
  	o[c] = getPixel(i+xPoints[v]-round(size_of_patch/2),j+yPoints[v]-round(size_of_patch/2));
  	x[c] = c;
  	c = c+1;
  	}
  	}

  	
//Calls the function which fits the distribution within the patch.
out = fit_gaussian_diag_cov(size_of_patch,size_of_patch,x,o,display_output);

a = out[0]; //A, amplitude of the Gaussian function
b = out[1]; //a, 
c = out[2]; //x0, x-position in patch
d = out[3]; //b
e = out[4]; //y0, y-position in patch

//OUTPUT
print("Detected Foci: "+(v+1));
print("A="+d2s(a,6)+", a="+d2s(b,6),", b="+d2s(d,6),", x0="+(c+xPoints[v])+", y0="+(e+yPoints[v]));
print("sigma_x",d2s(sqrt(1/(b*2)),6),"sigma_xy","sigma_y",d2s(sqrt(1/(d*2)),6)); 
print("FWHMx\t",sqrt(1/(2*b))*2.3548,"\tFWHMy\t",sqrt(1/(2*d))*2.3548);
print("R^2="+d2s(Fit.rSquared,3));


}

function fit_gaussian_diag_cov(wid,hei,x,o,out){

//Get the statistics from the array.
Array.getStatistics(o, min, max, mean, stdDev);

//2D Gaussian equation.
f =   "y =a*exp(-(b*(pow(((x-(floor(x/"+wid+")*"+wid+"))-c),2))+d*pow(((floor(x/"+wid+"))-e),2)))";


Fit.doFit(f, x, o,newArray(max,0.1,wid/2,0.1,hei/2));
 

//Fit.plot();
a = Fit.p(0); //A
b = Fit.p(1);  //a
c = Fit.p(2); //x0
d = Fit.p(3);//b
e = Fit.p(4); //y0



//Whether to plot data or not.
if (out == true){
Fit.plot();
newImage("out", "32-bit black", wid,hei,1);
x = 0;

for(j=0;j<hei;j++){
	for(i=0;i<wid;i++){
	in = Fit.f(x);   
	setPixel(i,j,in);
	x = x+1;
  	}}
resetMinAndMax();
}
return newArray(a,b,c,d,e)
}


//The MIT License (MIT)

//Copyright (c) 2016 Dominic Waithe

//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.