## Scripts which generate animations which demonstrate convolution.
This is the first version, will update with more examples.

The ipython3 notebook contains code which generates a series of .png files which depict correlation of an input image. The .png files were compiled to form a .gif with ImageJ/Fiji.
The parameters are based around tuning the layout, which can be a bit tricky with matplotlib.
- text_x_shift = im.shape[0]+2  where to place the integer output of the convolution in 'x'.
- text_y_shift = 0.9  where to place the integer output of the convolution in 'x'.
- text_symbol_shift = 0.38  how much to shift the little '+' and '=' signs.
- kernel_x = 3 Size of the kernel in x
- kernel_y = 3 Size of the kernel in u=y
- fontsize_sym = 24 Size of the font of the symbols (i.e. '+', '=')
- fontsize_txt = 32 Size of the font for the numbers.

Example of output.
![](mean_filter.gif)



