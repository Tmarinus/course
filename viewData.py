import h5py
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt


index = 1000
f = h5py.File("Data/nist.hdf5", "r")
labels = list(f['labels'])
dset = list(f['user_fields/images'])

print(np.shape(dset))
print(np.max(dset[index]))
print(labels[index])

img = Image.fromarray(dset[index], '1')
# img.show()

with h5py.File('Data/nist.hdf5') as f:
    images = f['user_fields']['images']

    for i in range(5):
        plt.figure()
        plt.imshow(images[i], cmap=plt.get_cmap('gray'))
        plt.show()
