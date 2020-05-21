//Macro written by Dominic Waithe for Victoria Zilles, Erdinc Sezgin and Falk Schneider.
//Measure FWHM at multiple points along a user-defined line
//Fits intensity profile using Gaussian Fitting
//Outputs data from STED and CONFOCAL in log.
//Dominic Waithe 2016, University of Oxford.

//Find the coordinates of the selection.
getSelectionCoordinates(xr, yr);
//Add the coordinates to the roi manager.
roiManager("Add");
//Remove any overlays(lines) which might exist.
run("Remove Overlay");
//Close the log so any printed data is fresh and not old.
close("log");
//Create memory of arrays.
fx = newArray(100000);
fy = newArray(100000);
c =0;
//Main loop for array.
for(g=0;g<xr.length-1;g++){
	
	nX = newArray(51);
	nY = newArray(51);
	
	nX[0] = xr[g];
	nY[0] = yr[g];
	nX[50] = xr[g+1];
	nY[50] = yr[g+1];
	//Interpolates between points on line.
	for(v=1;v<50;v++){
	nX[v] = round((xr[g+1]*(v/50))+(xr[g]*((50-v)/50)));
	nY[v] = round((yr[g+1]*(v/50))+(yr[g]*((50-v)/50)));
	//We compare the second data with the first.
	if(v>0 ){
		
		dist = sqrt(((nX[v] - nX[v-1])*(nX[v] - nX[v-1])) + ((nY[v] - nY[v-1])*(nY[v] - nY[v-1])));
		//removes any identical data-points.
		if (dist <0.1){
		}else{
		fx[c] = nX[v];
		fy[c] = nY[v];
		
		c++;
			}
	}
		
			
		}
	}


gx = Array.trim(fx,c-1);
gy = Array.trim(fy,c-1);

dx = newArray(gx.length);
dy = newArray(gy.length);
c = 1;
d = 0
col =0
//Takes samples at a  certain distance away in pixels.Should be three pixels apart.
for (h=0;h<gx.length-10;h=h+1){
	//setPixel(gx[h],gy[h], 128);
	for(c=h;c<h+10;c++){
	dist = sqrt((gx[c]-gx[h])*(gx[c]-gx[h])+(gy[c]-gy[h])*(gy[c]-gy[h]));
	//I set this as three pixels can be higher to a point.
	//If much higher might not find on specificed range.
	//You can change this:
	if (dist > 3){
	dx[d] = gx[c];
	dy[d] = gy[c];
	
	col++;
	d++;
	h=c;
	break;
	}}
	
	}


xl = Array.trim(dx,d);
yl = Array.trim(dy,d);
slope = newArray(xl.length-10);
yint = newArray(xl.length-10);


title = getTitle();
//Sets batchmode to make the line plotting super-quick.
setBatchMode(true);
for(sl=1;sl<3;sl++){
c = 0;
roiManager("Select",roiManager("Count")-1);
setSlice(sl);
//Takes the input pixels and calculates best fit line and then perpendicular line.
for(i=5;i<xl.length-5;i=i+1){

   sumX = 0;
   sumY = 0;

   count = 5.0;
   
   for(b=-2;b<3;b++){
   sumX += xl[i+b];
   sumY += yl[i+b];
   
  	}

  
    //Calculate the mean coordinate.
	XMean = sumX/count;
	YMean = sumY/count;
	up = 0;
	up = 0;
	bot = 0;

	//Calculates sums of top and bottom lines
	for(b=-2;b<3;b++){
	up += ((xl[i+b]-XMean)*(yl[i+b]-YMean));
	bot += ((xl[i+b]-XMean)*(xl[i+b]-XMean));
	}
	
	//Calculates the gradient in the perpendicular direction to the line gradient.
	slope[c] = -1/(up/bot);
	//We calculate the Yintercept
	yint[c] = YMean-(slope[c]*XMean);

	//If the line is horizontal we catch as follows
	if(slope[c] <-9999999){
		nopp = 20;
		nadj = 0;
		}
	//If the line is vertical we catch as follows
	else if(isNaN(slope[c]) == true){
		nopp = 0;
		nadj = 20;
		}else{

		//We calculate the the points based on our gradient and y-intercept.
		x0 = xl[i-2];
		x1 = (xl[i+2]);
		y0 =(slope[c]*xl[i-2])+yint[c];
		y1 = (slope[c]*xl[i+2])+yint[c];

		//Calculate the opp and adj of triangle.
		opp = y1-y0;
		adj = x1-x0;
		if (opp ==0){
			opp = 0.000001;
			}
		if (adj ==0){
			adj = 0.000001;
			}
	
		//We calculate the angle from the opp and adj.
		theta = atan(opp/adj);
		
		//We then calculate the opp and adj
		nopp = 20*sin(theta);
		nadj = 20*cos(theta);
		//See, A-level geometry did have a use!
		
		}
	//Calculates where each of the lines should start adn end.
	a0 =(xl[i]);
	a1 = (yl[i]);
	b0 = (xl[i]+nadj);
	b1 = (yl[i]+nopp);
	c0 = (xl[i]-nadj);
	c1 = (yl[i]-nopp);
	//Makes the line and plots a hidden plot.
	makeLine(b0,b1,c0,c1);
	run("Plot Profile");
	Plot.getValues(x, y);
	//Fits the gaussian
	Fit.doFit("Gaussian", x, y);
	
	if(sl==1){
		mtext = "conf";
		}
	else{
		mtext = "sted";
		}
	//Calculates the FWHM 
	sigma=Fit.p(3);
	FWHM=abs(2*sqrt(2*log(2))*sigma);
	//Prints to log.
    print(mtext+"\ta=\t"+d2s(Fit.p(0),6)+"\tb\t"+d2s(Fit.p(1),6)+"\tc\t"+d2s(Fit.p(2),6)+"\td=\t"+d2s(Fit.p(3),6)+"\tFWHM\t"+FWHM);
	selectWindow(title);
	//Draws line on image as overlay.
	Overlay.drawLine(a0,a1,b0,b1);
	Overlay.drawLine(a0,a1,c0,c1);
	Overlay.show()
	c = c+1;

	}
}
setBatchMode(false);
//Restores the original line.
roiManager("Select",roiManager("Count")-1);
	