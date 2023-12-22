#!/bin/bash

# add modules before mian.f90
gfortran particle.f90 main.f90 -o proj

./proj

rm proj