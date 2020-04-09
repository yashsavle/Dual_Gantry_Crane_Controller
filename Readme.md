# Dual Gantry Crane Control System

The Objective of This Project is to design a Controller for Dual Gantry Crane as shown below. Using Matlab Toolboxes, the system is Realized and it's Controlability and Observability  is determined for different cases. Then, we can design an LQR controller and also an LQG controller to stabilize the system.

## Steps to Run the Program:
1. Run test_code_controllability.m to find Controllability.
2. Run Linearize.m to find the conditions for linearizng the system.
3. Run Luenberger_test.m for linear, Luenberger_non_linear_runner.m 
   For non-linear. 
   Set type=1 or type =2 for initial conditions and step response respectively.
4. Part LQG run lqg_non_linear_runner.m