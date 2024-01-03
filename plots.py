import matplotlib.pyplot as plt
import numpy as np

# walls
R1=1.21
R2=1.19
theta=np.linspace(-30,0)
x01=R1*np.sin(np.deg2rad(theta))
y01=R1*np.cos(np.deg2rad(theta))-2.7
x02=R2*np.sin(np.deg2rad(theta))
y02=R2*np.cos(np.deg2rad(theta))-2.7



# too low
x1=[]
y1=[]
with open('data1.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x1.append(float(values[0]))
        y1.append(float(values[1]))
file.close()

plt.figure()
plt.plot(x1,y1)
plt.plot(x01,y01,color='black')
plt.plot(x02,y02,color='black')
plt.show()

# good
x2=[]
y2=[]
with open('data2.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x2.append(float(values[0]))
        y2.append(float(values[1]))
file.close()

plt.figure()
plt.plot(x2,y2)
plt.plot(x01,y01,color='black')
plt.plot(x02,y02,color='black')
plt.show()

# too high
x3=[]
y3=[]
with open('data3.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x3.append(float(values[0]))
        y3.append(float(values[1]))
file.close()

plt.figure()
plt.plot(x3,y3)
plt.plot(x01,y01,color='black')
plt.plot(x02,y02,color='black')
plt.show()
