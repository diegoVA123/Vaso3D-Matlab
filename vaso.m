import numpy as np
import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d.axes3d as axes3d
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1, projection='3d')
# Definir los rangos de las variables
v = np.linspace(0, 2*np.pi, 60)
# Definir rangos para X (U en el código original)
ranges = [
np.linspace(0, 1.5, 60),
np.linspace(1.5, 2, 60),
np.linspace(2, 8.4, 60),
np.linspace(8.4, 10, 60),
np.linspace(10, 12, 60),
]
# Funciones a evaluar
formulas_Y = [
lambda U, V: 3.5 * np.cos(V),
lambda U, V: (-1.9607 * U + 6.4215) * np.cos(V),
lambda U, V: (-0.05066 * U**2 + 0.83954 * U + 0.02357) * np.cos(V),
lambda U, V: (-1.1419 * U**2 + 21.0362 * U - 99.6310) * np.cos(V),
lambda U, V: (0.3999 * U**2 - 9.2150 * U + 48.70101) * np.cos(V),
]
formulas_Z = [
lambda U, V: 3.5 * np.sin(V),
lambda U, V: (-1.9607 * U + 6.4215) * np.sin(V),
lambda U, V: (-0.05066 * U**2 + 0.83954 * U + 0.02357) * np.sin(V),
lambda U, V: (-1.1419 * U**2 + 21.0362 * U - 99.6310) * np.sin(V),
lambda U, V: (0.3999 * U**2 - 9.2150 * U + 48.70101) * np.sin(V),
]
# Graficar
colors = ['red', 'blue', 'green', 'cyan', 'magenta']
for i, (U_range, Y_formula, Z_formula) in enumerate(zip(ranges,
formulas_Y, formulas_Z)):
U, V = np.meshgrid(U_range, v)
Y = Y_formula(U, V)
Z = Z_formula(U, V)
ax.plot_surface(U, Y, Z, alpha=0.3, color=colors[i % len(colors)],
rstride=2, cstride=2)
# Ángulos para visualizar el vaso de forma más vertical
ax.view_init(30, 30)
plt.show()