#!/bin/bash

# This is a script you can use to spin up things in the container 
# Author: SMM
# Date: 30/06/2020

echo "Hi, I will grab some notebooks for you"

# clone or pull the repo, depending on what is in there
# check if the files have been cloned
if [ -d /landlab/notebooks ]
  then
    echo "You appear to have the notebooks already."
    echo "If you wish to download a newer version you should delete the notebooks directory,"
    echo "And then run this script again"
  else
    echo "\n\n========================================"
    echo "I am grabbing the notebooks from the web"
    echo "========================================\n\n"
         
    wget https://raw.githubusercontent.com/simon-m-mudd/landlab_docker/master/notebooks.zip
    unzip notebooks.zip
    
    # Clean up
    rm notebooks.zip
    
fi
