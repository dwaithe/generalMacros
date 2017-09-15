//ImageJ macro written by Dominic Waithe. (c) 2016.
//To be used on two channels of an image file.

//DAPI channel. Used to find the areas.
dapi = 1;
//FOCI channel. Used to count the foci. 
foci = 2;
//Keep this consistent for your experiment. This is the sensitivity of the foci selection.
noise_tolerance = 100; //A lower value will lead to more foci being detected.


////Start of script. All being well you shouldn't have to change anything down here.

//Find unique id of an image
title = getTitle()
//run("Z Project...", "projection=[Max Intensity]");

//Make sure there are no selections
run("Select None");

//Uncomment the next line if you want it to run faster but not display windows.
//setBatchMode(true);

//Other measurements. Just makes sure they are set to default values.
run("Colors...", "foreground=black background=white selection=green");
run("Set Measurements...", "area mean standard modal min bounding integrated median redirect=None decimal=3");


//Goto the first slice, the dapi channel
setSlice(dapi);
//Duplicate that image
run("Duplicate...", "  channels=1");
//Set the auto threshold
setAutoThreshold("Huang dark");
//set the background to be black
setOption("BlackBackground", false);
//commit to the threshold
run("Convert to Mask");
//Clear the roiManager before we add any entries.
roiManager("Reset");
//Analyse the dapi signal to count all the cells.
run("Analyze Particles...", "size=4000-Infinity pixel add");
roiCount = roiManager("Count");

//Now we go back to the original
selectWindow(title);
//We change to the one which contains our foci.
setSlice(foci);

//We print the title of the image.
print(title);
//We then interate through each region.
for(i=0;i<roiCount;i++){
	//Select a region.
	roiManager("Select",i);
	//Find our many foci according to the the Find maxima algorithm
	run("Find Maxima...", "noise"+noise_tolerance+" output=Count");
	//Record the count in a variable
	count = getResult("Count",nResults-1);
	//print the variable.
	print("Cell Number: \t",i," \tFoci Count:\t",count);
	}


