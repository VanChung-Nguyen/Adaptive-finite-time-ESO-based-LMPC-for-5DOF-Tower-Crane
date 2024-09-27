# Adaptive finite-time extended state observer-based model predictive control with flatness-motivated motion planning for tower cranes
This simulation demonstrates a novel methodology for controlling a 5DOF Tower Crane in Matlab/Simulink. Several comparison methods, including PID-AFT-ESO, LQR-AFT-ESO, and SO-SMC-AFT-ESO, are also included. 
The Simscape model of the 5DOF Tower Crane is proposed as follows:
![dynamic](https://github.com/user-attachments/assets/d207fdd5-c870-43a8-8a6a-80247ecf338e)
We utilized the model from [open sources Matlab](https://www.mathworks.com/help/sm/ug/tower-crane-with-trolley-and-hoist.html) to create an accurate Tower Crane model based on the mathematical representation.

## Software Requirements & Setup
The simulation is designed in Matlab, the desired trajectory is pre-solved to feed the controller. Following these instructions to run the code:

To run the AFT-ESO-LMPC:

```shell
# Step 1: Load the desired trajectory:
Run the solutionflat.mat file 

# Step 2: Load the global variable
Run the data.m file

# Step 3: Run the LMPC setup
Run the modelLyna_sm.m file

# Step 3=4: Run the Simulink simulation
Open the lmpc_finieso.slx and run.

```

To run the AFT-ESO-PID:

```shell
# Step 1: Load the desired trajectory:
Run the solutionflat.mat file 

# Step 2: Load the global variable
Run the data.m file

# Step 3: Run the Simulink simulation
Open the pidfinite.slx and run.

```

To run the AFT-ESO-LQR

```shell
# Step 1: Load the desired trajectory:
Run the solutionflat.mat file 

# Step 2: Load the global variable
Run the data.m file

# Step 3: Run the Simulink simulation
Open the lqrfininorm.slx and run.

```

To run the AFT-ESO-SO-SMC

```shell
# Step 1: Load the desired trajectory:
Run the solutionflat.mat file 

# Step 2: Load the global variable
Run the data.m file

# Step 3: Run the Simulink simulation
Open the smceso_simscape.slx and run.

```
