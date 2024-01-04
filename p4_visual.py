import matplotlib.pyplot as plt
import numpy as np

# walls - magnet
a = np.linspace(0, 1.45, 100)
c = np.linspace(0, 1.54999, 100)
b = -(2.1025 - a**2)**0.5
d = -(2.4025 - c**2)**0.5
e=np.linspace(-2.7,0,1000)
f=0*e
g=np.linspace(0,1.55,1000)
h=0*g

# walls - filter
R1=1.21
R2=1.19
theta=np.linspace(-30,0)
x01=R1*np.sin(np.deg2rad(theta))
y01=R1*np.cos(np.deg2rad(theta))-2.7
x02=R2*np.sin(np.deg2rad(theta))
y02=R2*np.cos(np.deg2rad(theta))-2.7
x03=np.linspace(1.21*np.sin(np.deg2rad(theta)),0)
y03=-np.tan(np.deg2rad(60))*x03-2.7

# FIRST VALUE m=2.325294627e-26 (PARTS 2 AND 3)
x1=[]
y1=[]
with open('full_simulation_1.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x1.append(float(values[0]))
        y1.append(float(values[1]))
file.close()

plt.figure()
# trajectory
plt.plot(x1, y1)

# magnet walls
plt.plot(a, b, color="black",linewidth=0.5)
plt.plot(c, d, color="black",linewidth=0.5)
plt.plot(f, e, color="black",linewidth=0.5)
plt.plot(g, h, color="black",linewidth=0.5)

# filter walls
plt.plot(x1,y1)
plt.plot(x01,y01,color='black',linewidth=0.5)
plt.plot(x02,y02,color='black',linewidth=0.5)
plt.plot(x03,y03,color='black',linewidth=0.5)

plt.gca().set_aspect('equal', adjustable='box')
plt.title(r'Mass of particle $^\text{14}$C$^\text{3+}$ m=2.325294627$\cdot10^\text{-26}$')
plt.show()

# MAX VALUE m=2.32530757E-26
x1=[]
y1=[]
with open('full_simulation_max.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x1.append(float(values[0]))
        y1.append(float(values[1]))
file.close()

plt.figure()
# trajectory
plt.plot(x1, y1)

# magnet walls
plt.plot(a, b, color="black",linewidth=0.5)
plt.plot(c, d, color="black",linewidth=0.5)
plt.plot(f, e, color="black",linewidth=0.5)
plt.plot(g, h, color="black",linewidth=0.5)

# filter walls
plt.plot(x1,y1)
plt.plot(x01,y01,color='black',linewidth=0.5)
plt.plot(x02,y02,color='black',linewidth=0.5)
plt.plot(x03,y03,color='black',linewidth=0.5)

plt.gca().set_aspect('equal', adjustable='box')
plt.title(r'Maximum mass m=2.32530757$\cdot10^\text{-26}$')
plt.show()

# MIN VALUE m=2.32528169E-26
x1=[]
y1=[]
with open('full_simulation_min.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x1.append(float(values[0]))
        y1.append(float(values[1]))
file.close()

plt.figure()
# trajectory
plt.plot(x1, y1)

# magnet walls
plt.plot(a, b, color="black",linewidth=0.5)
plt.plot(c, d, color="black",linewidth=0.5)
plt.plot(f, e, color="black",linewidth=0.5)
plt.plot(g, h, color="black",linewidth=0.5)

# filter walls
plt.plot(x1,y1)
plt.plot(x01,y01,color='black',linewidth=0.5)
plt.plot(x02,y02,color='black',linewidth=0.5)
plt.plot(x03,y03,color='black',linewidth=0.5)

plt.gca().set_aspect('equal', adjustable='box')
plt.title(r'Minimum mass m=2.32528169$\cdot10^\text{-26}$')
plt.show()

# TOO LARGE MASS m=2.62530757E-26
x1=[]
y1=[]
with open('full_simulation_2.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x1.append(float(values[0]))
        y1.append(float(values[1]))
file.close()

plt.figure()
# trajectory
plt.plot(x1, y1)

# magnet walls
plt.plot(a, b, color="black",linewidth=0.5)
plt.plot(c, d, color="black",linewidth=0.5)
plt.plot(f, e, color="black",linewidth=0.5)
plt.plot(g, h, color="black",linewidth=0.5)

# filter walls
plt.plot(x1,y1)
plt.plot(x01,y01,color='black',linewidth=0.5)
plt.plot(x02,y02,color='black',linewidth=0.5)
plt.plot(x03,y03,color='black',linewidth=0.5)

plt.gca().set_aspect('equal', adjustable='box')
plt.title(r'Too large mass m=2.62530757$\cdot10^\text{-26}$')
plt.show()

# TOO SMALL m=2.31528169E-26
x1=[]
y1=[]
with open('full_simulation_3.dat','r') as file:
    for line in file:
        values=line.strip().split(';')
        x1.append(float(values[0]))
        y1.append(float(values[1]))
file.close()

plt.figure()
# trajectory
plt.plot(x1, y1)

# magnet walls
plt.plot(a, b, color="black",linewidth=0.5)
plt.plot(c, d, color="black",linewidth=0.5)
plt.plot(f, e, color="black",linewidth=0.5)
plt.plot(g, h, color="black",linewidth=0.5)

# filter walls
plt.plot(x1,y1)
plt.plot(x01,y01,color='black',linewidth=0.5)
plt.plot(x02,y02,color='black',linewidth=0.5)
plt.plot(x03,y03,color='black',linewidth=0.5)

plt.gca().set_aspect('equal', adjustable='box')
plt.title(r'Too small mass m=2.31528169$\cdot10^\text{-26}$')
plt.show()
