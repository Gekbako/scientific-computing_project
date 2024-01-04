# import modules
import matplotlib.pyplot as plt
import numpy as np

# electric filter walls
R1=1.21
R2=1.19
theta=np.linspace(-30,0)
x01=R1*np.sin(np.deg2rad(theta))
y01=R1*np.cos(np.deg2rad(theta))-2.7
x02=R2*np.sin(np.deg2rad(theta))
y02=R2*np.cos(np.deg2rad(theta))-2.7

# too low E -------------------------------
x1=[]
y1=[]

# read data
with open('data_too_low_E.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x1.append(float(values[0]))
        y1.append(float(values[1]))
file.close()

# plots
plt.figure()
plt.plot(x1,y1) # trajectory
plt.plot(x01,y01,color='black') # wall
plt.plot(x02,y02,color='black') # wall
plt.show()

# accurate E ------------------------------
x2=[]
y2=[]

# read data
with open('data_accurate_E.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x2.append(float(values[0]))
        y2.append(float(values[1]))
file.close()

# plots
plt.figure()
plt.plot(x2,y2) # trajectory
plt.plot(x01,y01,color='black') # wall
plt.plot(x02,y02,color='black') # wall
plt.show()

# too high E ------------------------------
x3=[]
y3=[]

# read data
with open('data_too_high_E.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x3.append(float(values[0]))
        y3.append(float(values[1]))
file.close()

# plots
plt.figure()
plt.plot(x3,y3) # trajectory
plt.plot(x01,y01,color='black') # wall
plt.plot(x02,y02,color='black') # wall
plt.show()
