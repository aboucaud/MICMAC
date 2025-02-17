from setuptools import setup, find_packages

setup(name='micmac',
      version='1.0.91',
      description='Minimally Informed CMB MAp Constructor (MICMAC) for CMB polarization data',
      author='',
      author_email='',
      url='https://github.com/CMBSciPol/MICMAC',
      keywords='component separation CMB sampling jax python',
      packages = find_packages(exclude=['test_playground.']),
      package_dir = {'micmac': 'micmac'},
      package_data= {'': ['*.toml']},
      zip_safe = False,
      entry_points = {
        'console_scripts': [
            'micmac = micmac.pipeline:__main__'
        ]      
        },
      python_requires=">=3.7",
      install_requires = [
        'camb',
        'healpy',
        'jax',
        'jaxlib',
        'jax-tqdm',
        'jax-healpy',
        'jaxopt',
        'numpyro',
        'lineax',
        'chex',
        'fgbuster @ git+https://github.com/fgbuster/fgbuster.git'
      ],
)
