import numpy as np
from scipy.linalg import solve_toeplitz

# Coefficients of the AR(4) characteristic equation: 1 + 0.7B - 0.2B^2 + 0.1B^3 + 0.4B^4 = 0
ar_coeffs = [1, 0.7, -0.2, 0.1, 0.4]

# Solve for the roots of the characteristic equation
roots = np.roots(ar_coeffs)

# Compute magnitudes of the roots to check stationarity
magnitudes = np.abs(roots)

# Solve Yule-Walker equations for autocorrelations (up to lag 6)
# The autocovariance function is determined by solving the Toeplitz system
r_vals = [1, 0.7, -0.2, 0.1, 0.4]  # Approximate first autocorrelations from AR coefficients
rho = solve_toeplitz((r_vals[:-1], r_vals[:-1]), r_vals[1:])

# Compute rho_6 using the recurrence formula
rho_6 = np.dot(r_vals[1:], rho[::-1])  # Projecting forward

print(magnitudes, rho_6)
