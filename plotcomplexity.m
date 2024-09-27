% Check memory usage before simulation
memBefore = memory;

% Run the Simulink model
sim('pidfininorm.slx');

% Check memory usage after simulation
memAfter = memory;

% Calculate the memory difference
memDiff = memAfter.MemUsedMATLAB - memBefore.MemUsedMATLAB;

% Display memory difference
fprintf('Memory used by the simulation: %.2f MB\n', memDiff / (1024 * 1024));
