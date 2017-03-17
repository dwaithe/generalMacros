

# Maxima finding algorithm recreated from implementation in ImageJ/Fiji
The first stage in the maxima finding algorithm is to find the local maxima. In many find maxima implementations this step is performed first and simply represents the identification of the maximum pixel in each 3x3 neighbourhood (in the default case). Once all the local maxima are found, the goal is then to merge and prune this maxima using some kind of measure of quality. In the case of algorithm a single parameter is used, the noise tolerance. If a maxima is close to another then the maxima will be merged or removed based on the following critera. Starting with the most bright maxima and working down the intensities:
* Scan the neighbourhood and determine whether there are any peaks which are higher. If there are, skip this maxima.
* If there are pixels in the neighbourhood within a noise tolerance of the maxima, add them to the list to be scanned, spreading out like a flood fill algorithm, until the neighbourhood is exhausted
    * If the pixels are equal to the maxima, mark this maxima as equal. 
    * If the pixels are less than maxima but greater than maxima minus the noise tolerance, mark as listed.
* Mark all pixels considered as 'processed' as long as they are included within a valid peak region. Reset all others.
* From the regions containing a peak, calculate the best pixel to be considered as maxima based on minimum distance calculation with all those considered equal.

This implementation doesn't yet support exclusion of edge maxima or the varied outputs available for the ImageJ/Fiji Maxima plugin.

Comparison of Python and Fiji implementation using image 002eggs.png
![alt text](fijiversusPythonFindMaxima.png "Logo Title Text 1")