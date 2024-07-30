# FijiPythonContainer

This repository contains an Apptainer (Singularity) definition file to build a container with Fiji and Python installed.

## Files

- `FijiPython.def`: The definition file for building the Apptainer container.

## Building the Container

To build the container, follow these steps:

1. Install Apptainer: Follow the instructions on the [Apptainer website](https://apptainer.org/docs/admin/main/installation.html).

2. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/FijiPythonContainer.git
   cd FijiPythonContainer

3. Build the container using the definition file:
   ```bash
   apptainer build FijiPython.sif FijiPython.def

On Snellius specific instructions are
Change the temporary file directory with
   ```bash
   export APPTAINER_TMPDIR=$(mktemp -d /tmp/cbisotXXXX)
   chmod o+rww /tmp/
