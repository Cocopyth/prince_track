# FijiPythonContainer

This repository contains an Apptainer (Singularity) definition file to build a container with Fiji and Python installed.

## Files

- `FijiPython.def`: The definition file for building the Apptainer container.

## Building the Container

To build the container, follow these steps:

1. Install Apptainer: Follow the instructions on the [Apptainer website](https://apptainer.org/docs/admin/main/installation.html).

2. Clone this repository:

   ```bash
   git clone https://github.com/Cocopyth/prince_track.git
   cd prince_track

3. Build the container using the definition file:

   ```bash
   apptainer build FijiPython.sif prince_track.def
```
On Snellius specific instructions are
Change the temporary file directory with

   ```bash
   export APPTAINER_TMPDIR=$(mktemp -d /tmp/cbisotXXXX)
   chmod o+rww /tmp/
```
## To test on a dataset

   ```bash
   bash test_dataset/download_dataset.sh $PATH_WHERE_TO_DOWNLOAD
```
example on snellius

   ```bash
   export PATH_WHERE_TO_DOWNLOAD=/scratch-shared/amftrack/test_dataset
   bash test_dataset/download_dataset.sh $PATH_WHERE_TO_DOWNLOAD
   export CODE_BASE_PATH=$(pwd)
   bash test_fiji/test.sh
```




