within HPF.Examples.Basics;
model AC2DC_Simple_Rectifier_1P_combi
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20})  annotation (
    Placement(visible = true, transformation(origin = {-78, 82}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource V_Grid(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {115}, {0 for i in 2:systemDef.numHrm}))  annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground Ground_AC annotation (
    Placement(visible = true, transformation(origin = {-40, -48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation (
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple Simple_Rectifier(P_DCmin = 5,
    P_nom=100000,                                                                                  P_stby = 0, VAC_nom = 120, VDC_nom = 24, alpha = 0.01, beta = 0.02, gamma = 0.03)  annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load DC_Load(u(start = 1))  annotation (
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    table=[1,32; 2,8.9; 3,5; 4,50; 5,42; 6,12; 7,0; 8,6.5; 9,3; 10,5],
    tableName="tab1",
    fileName="C:/Users/oghatpan/Downloads/pv-san-diego-roof-only.txt",
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{38,36},{58,56}})));
equation
  connect(V_Grid.pin_n, Ground_AC.pin) annotation (
    Line(points = {{-60, -10}, {-60, -20}, {-40, -20}, {-40, -40}}, color = {117, 80, 123}));
  connect(Simple_Rectifier.hPin_N, Ground_AC.pin) annotation (
    Line(points = {{-10, -8}, {-20, -8}, {-20, -20}, {-40, -20}, {-40, -40}}, color = {117, 80, 123}));
  connect(Simple_Rectifier.hPin_L, V_Grid.pin_p) annotation (
    Line(points = {{-10, 8}, {-20, 8}, {-20, 20}, {-60, 20}, {-60, 10}}, color = {92, 53, 102}));
  connect(Simple_Rectifier.pin_n, Ground_DC.p) annotation (
    Line(points = {{10, -8}, {20, -8}, {20, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(DC_Load.p, Simple_Rectifier.pin_p) annotation (
    Line(points = {{60, 10}, {60, 20}, {20, 20}, {20, 8}, {10, 8}}, color = {0, 0, 255}));
  connect(DC_Load.n, Ground_DC.p) annotation (
    Line(points = {{60, -10}, {60, -20}, {40, -20}, {40, -40}}, color = {0, 0, 255}));
  connect(combiTimeTable.y[2], DC_Load.u) annotation (Line(points={{59,46},{68,
          46},{68,-0.2},{65,-0.2}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><p>This example demonstrates a simple AC to DC rectifier (no harmonic distortion, fixed power factor).</p>
</body></html>"),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_RES_INIT,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end AC2DC_Simple_Rectifier_1P_combi;
