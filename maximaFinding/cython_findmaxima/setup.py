from distutils.core import setup
from Cython.Build import cythonize
import numpy
setup(
	include_dirs=[numpy.get_include()],
    ext_modules = cythonize("is_within.pyx")
)
setup(
	include_dirs=[numpy.get_include()],
    ext_modules = cythonize("find_maxima.pyx")
)


