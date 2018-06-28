from distutils.core import setup
from Cython.Build import cythonize
setup(
    name='part one pyx',
    ext_modules=cythonize('part_one.pyx')
)
setup(
    name='part two pyx',
    ext_modules=cythonize('part_two.pyx')
)