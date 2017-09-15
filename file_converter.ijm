//File converter code. Converts lsm files to ome.tiff from and input folder to and output folder.
//Written by Dominic Waithe for Heinrich Klose (2017).

//You need to change these values to your folders of choice.
input_dir = "set/path/to/input/folder";
output_dir = "set/path/to/output/folder";


//Processing code begins:

//Collects list of files in input folder
list = getFileList(input_dir);

//The loop which runs through the folder looking for .lsm.
for (z = 0; z < list.length; z++){
if(endsWith(list[z], "lsm")==true){

//Opens the file using bioformats.
run("Bio-Formats Windowless Importer", "open=["+input_dir+list[z]+"]");
title = getTitle();
end = lengthOf(title)-4;

//This is where you can insert additional processing code.
//
//

//This is the code output section which saves the files to their new destination.
out_path = output_dir+substring(title,0,end)+".ome.tif";
run("OME-TIFF...", "save="+out_path+" export compression=Uncompressed");
run("Close All");
}}