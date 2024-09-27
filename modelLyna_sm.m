clc;
nx = 10;
ny = 5;
nu = 3;
nd = 1;
tt = [1:1:nu]; td = [nu+1:1:nu+nd];
nlobj = nlmpc(nx,ny,'MV',[1 2 3],'MD',[4]);
%--------------------------------------------------------------------------
Ts = 0.2;
PredictionHorizon = 10;
nlobj.Ts = Ts;
nlobj.PredictionHorizon = PredictionHorizon;
nlobj.ControlHorizon = PredictionHorizon;

%---------------------------Plant Model-----------------------------------------------
nlobj.Model.StateFcn = @robot_model;
nlobj.Model.OutputFcn = @modelOutputFcn;
%---------------------------Cost Fcn--------------------------------------
%---------------------------Constraints--------------------------------------
nlobj.Optimization.CustomIneqConFcn = @myIneqConFunction;
%nlobj.Optimization.CustomCostFcn = "myCostFunction";
nlobj.Weights.OutputVariables = [5000 800 600 12000 12000];
nlobj.Weights.ManipulatedVariables = [0.05 0.1 0.1];
%---------------------------Constraints--------------------------------------
nlobj.Optimization.CustomIneqConFcn = @myIneqConFunction;
%--------------------------Optimization Specification------------------------------------------------
nlobj.Optimization.SolverOptions.Algorithm = 'sqp';
nlobj.Optimization.SolverOptions.MaxIterations = 400;
nlobj.Optimization.SolverOptions.StepTolerance = 1e-6;
nlobj.Optimization.SolverOptions.ConstraintTolerance = 1e-6;
nlobj.Optimization.SolverOptions.OptimalityTolerance = 1e-6;
%------------------------------------------------------------------
x0 = [0.001;0.001;0.001;0.001;0.001;0.01;0.01;45;0.01;0.01];
u0 = [0;0;-5000];
md0 = [0];
validateFcns(nlobj,x0,u0,md0',[]);
