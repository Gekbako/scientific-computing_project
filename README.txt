1. Open the terminal
2. Navigate to your directory (where all needed files are)
3. gfortran -c particle.f90 -o particle.o
4. gfortran -c main.f90 -o main.o
5. gfortran particle.o main.o simulation

Generally there files main.f90 and particle.f90 where the second one containst module particle, which is later used in main.f90 file, therefore the point 5 is in the form above.
The data collected from these two is saved in many different data files and then used in python files plots, such as visual_1.py etc. etc. These can be run in, for example, Visulal Studio Code,
where data is presented in the form of graphs
