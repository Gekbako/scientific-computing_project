import matplotlib.pyplot as mplot
import numpy

for fname in ["p2_1_B=0.6.dat", "p2_2_correct.dat", "p2_3_B=0.2.dat"]:
    x = []
    y = []
    with open(fname, "r") as file:
        for line in file:
            d = list(map(float, line.strip().split()))
            x.append(d[0])
            y.append(d[1])
    file.close()
    a = numpy.linspace(0, 1.45, 100)
    c = numpy.linspace(0, 1.54999, 100)
    b = -(2.1025 - a**2)**0.5
    d = -(2.4025 - c**2)**0.5
    mplot.plot(x, y)
    mplot.plot(a, b, color="black")
    mplot.plot(c, d, color="black")
    mplot.xlim(0, 1.6)
    mplot.ylim(-1.6, 0)
    mplot.show()
