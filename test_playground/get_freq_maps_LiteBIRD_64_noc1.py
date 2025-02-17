import numpy as np
from fgbuster.observation_helpers import *
from micmac import *


# General parameters
NSIDE = 64
cmb_model = ''
fgs_model = 'd0s0'
model = cmb_model+fgs_model
# noise = True
noise = False
noise_seed = 42
instr_name = 'LiteBIRD'

# get instrument from public database
instrument = get_instrument(instr_name)

# get input freq maps
np.random.seed(noise_seed)
freq_maps = get_observation(instrument, model, nside=NSIDE, noise=noise)[:, 1:, :]   # keep only Q and U
print(freq_maps.shape)

# get input cmb
input_cmb_maps = np.zeros_like(freq_maps)# get_observation(instrument, cmb_model, nside=NSIDE, noise=False)[:, 1:, :]   # keep only Q and U
print(input_cmb_maps.shape)
