# Define the problem
problem = LpProblem("Factory_Production", LpMaximize)

# Define decision variables
A = LpVariable("Product_A", lowBound=0, cat='Continuous')
B = LpVariable("Product_B", lowBound=0, cat='Continuous')

# Objective Function: Maximize profit
problem += 50 * A + 40 * B, "Total Profit"

# Constraints
problem += 4 * A + 3 * B <= 240, "Machine_1 Capacity"
problem += 2 * A + 5 * B <= 200, "Machine_2 Capacity"

# Solve the problem
problem.solve()

# Display results
print("Optimal Production Plan:")
print(f"Product A: {value(A)} units")
print(f"Product B: {value(B)} units")
print(f"Maximum Profit: ${value(problem.objective)}")

import pandas as pd
import matplotlib.pyplot as plt
from pulp import LpMaximize, LpProblem, LpVariable, value

# Define the problem
problem = LpProblem("Factory_Production", LpMaximize)

# Define decision variables
A = LpVariable("Product_A", lowBound=0, cat='Continuous')
B = LpVariable("Product_B", lowBound=0, cat='Continuous')

# Objective Function: Maximize profit
problem += 50 * A + 40 * B, "Total Profit"

# Constraints
problem += 4 * A + 3 * B <= 240, "Machine_1 Capacity"
problem += 2 * A + 5 * B <= 200, "Machine_2 Capacity"

# Solve the problem
problem.solve()

# Extract results
optimal_A = value(A)
optimal_B = value(B)
max_profit = value(problem.objective)

# Display results
print("Optimal Production Plan:")
print(f"Product A: {optimal_A} units")
print(f"Product B: {optimal_B} units")
print(f"Maximum Profit: ${max_profit}")

# Create a DataFrame to summarize results
df_results = pd.DataFrame({
    "Product": ["A", "B"],
    "Optimal Production": [optimal_A, optimal_B]
})

# Plot the results
plt.figure(figsize=(6, 4))
plt.bar(df_results["Product"], df_results["Optimal Production"], color=['blue', 'green'])
plt.xlabel("Products")
plt.ylabel("Optimal Production Quantity")
plt.title("Optimal Production Plan")
plt.show()
