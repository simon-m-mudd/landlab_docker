# This is a docker container for landlab

# Pull base image. We start from the miniconda imade
FROM conda/miniconda3
MAINTAINER Simon Mudd (simon.m.mudd@ed.ac.uk)

# Need this to shortcut the stupid tzdata noninteractive thing
ARG DEBIAN_FRONTEND=noninteractive


# Update conda
RUN conda install -y -c conda-forge conda

# Add the conda forge
RUN conda config --add channels conda-forge


# Set the channel
RUN conda config --set channel_priority strict

# Add git so you can clone the lsdmappingtools repo
RUN conda install -y git python=3

# Some tools for fetching data
RUN conda install -y wget unzip

# Now install landlab
RUN conda install -y landlab

# Now add some conda packages
#RUN conda install -y gdal rasterio geopandas matplotlib=3.1 numpy scipy pytables numba feather-format pandas pip pybind11 xtensor xtensor-python

# Some of the plotting tools use ffmpeg
#RUN conda install -y ffmpeg

# Some tools for fetching data
#RUN conda install -y lsdtopotools

# Now add more to the geospatial stack
#RUN conda install -y fiona utm pyproj cartopy

# Now the ipython stack for creating local ipython servers
RUN conda install -y ipython ipykernel jupyter

# Now an environment for building conda
#RUN conda install -y conda-build

# Set the working directory
WORKDIR /landlab

# Copy the startup script
COPY grab_landlab_notebooks.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/grab_landlab_notebooks.sh
