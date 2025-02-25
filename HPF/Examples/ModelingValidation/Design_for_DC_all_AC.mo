within HPF.Examples.ModelingValidation;
model Design_for_DC_all_AC
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}, numPh = 1) annotation (
    Placement(visible = true, transformation(origin = {-249.333, 262.667}, extent = {{-32.6667, -32.6667}, {32.6667, 23.3333}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource input_source(start_v_re = {120, 0, 0, 0, 0, 0, 0, 0, 0, 0}, vArg = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0, 0, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin = {-276, 44}, extent = {{-36, -36}, {36, 36}}, rotation = -90)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_driver_1( V_Rect = 45,modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/osram.mat", nomP = 29)  annotation (
    Placement(visible = true, transformation(origin = {-30, 191}, extent = {{-30, -29}, {30, 29}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_driver_3(V_Rect = 45,modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram-Oti-48-120-277-2A0.mat", nomP = 29)  annotation (
    Placement(visible = true, transformation(origin = {-30, -29}, extent = {{-30, -29}, {30, 29}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_driver_4(V_Rect = 45,modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram-Oti-48-120-277-2A0.mat", nomP = 29)  annotation (
    Placement(visible = true, transformation(origin = {-28, -129}, extent = {{-30, -29}, {30, 29}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_driver_2(V_Rect = 45,modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram-Oti-48-120-277-2A0.mat", nomP = 29)  annotation (
    Placement(visible = true, transformation(origin = {-30, 87}, extent = {{-30, -29}, {30, 29}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-276, -182}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.DC.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {69, -181}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  HPF.Cables.NEC_CableModel AC_cable(length = 60, wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12)  annotation (
    Placement(visible = true, transformation(origin = {-276, 190}, extent = {{-24, -24}, {24, 24}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_1 annotation (
    Placement(visible = true, transformation(origin = {40, 192}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_2 annotation (
    Placement(visible = true, transformation(origin = {40, 88}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_3 annotation (
    Placement(visible = true, transformation(origin = {40, -28}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_4 annotation (
    Placement(visible = true, transformation(origin = {38, -130}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable schedule(fileName=.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/schedule.txt"), tableName = "schedule", tableOnFile = true)  annotation (
    Placement(visible = true, transformation(origin = {142.0,254.0}, extent = {{-30.0,-30.0},{30.0,30.0}}, rotation = -90.0)));
equation
  connect(LED_driver_1.hPin_P, AC_cable.pin_p) annotation (
    Line(points = {{-60, 214}, {-276, 214}}, color = {92, 53, 102}));
  connect(LED_driver_2.hPin_P, AC_cable.pin_p) annotation (
    Line(points = {{-60, 110}, {-97.5, 110}, {-97.5, 112}, {-97, 112}, {-97, 214}, {-276, 214}}, color = {92, 53, 102}));
  connect(LED_driver_3.hPin_P, AC_cable.pin_p) annotation (
    Line(points = {{-60, -6}, {-98, -6}, {-98, 214}, {-276, 214}}, color = {92, 53, 102}));
  connect(LED_driver_4.hPin_P, AC_cable.pin_p) annotation (
    Line(points = {{-58, -106}, {-94.5, -106}, {-94.5, -108}, {-97, -108}, {-97, 214}, {-276, 214}}, color = {92, 53, 102}));
  connect(input_source.pin_p, AC_cable.pin_n) annotation (
    Line(points = {{-276, 80}, {-276, 166}}, color = {92, 53, 102}));
  connect(LED_driver_1.hPin_N, input_source.pin_n) annotation (
    Line(points = {{-60, 168}, {-153, 168}, {-153, 8}, {-276, 8}}, color = {117, 80, 123}));
  connect(LED_driver_2.hPin_N, input_source.pin_n) annotation (
    Line(points = {{-60, 64}, {-153, 64}, {-153, -52}, {-252, -52}, {-252, -3}, {-276, -3}, {-276, 8}}, color = {117, 80, 123}));
  connect(LED_driver_3.hPin_N, input_source.pin_n) annotation (
    Line(points = {{-60, -52}, {-152, -52}, {-152, 8}, {-276, 8}}, color = {117, 80, 123}));
  connect(LED_driver_4.hPin_N, input_source.pin_n) annotation (
    Line(points = {{-58, -152}, {-276, -152}, {-276, 8}}, color = {117, 80, 123}));
  connect(ground.pin, input_source.pin_n) annotation (
    Line(points = {{-276, -166}, {-276, 8}}, color = {92, 53, 102}));
  connect(LED_driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{0, 214}, {40, 214}}, color = {0, 0, 255}));
  connect(LED_driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{0, 168}, {40, 168}, {40, 170}}, color = {0, 0, 255}));
  connect(LED_driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{0, 110}, {40, 110}}, color = {0, 0, 255}));
  connect(LED_driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{0, 64}, {40, 64}, {40, 66}}, color = {0, 0, 255}));
  connect(LED_driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{0, -6}, {40, -6}}, color = {0, 0, 255}));
  connect(LED_driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{0, -52}, {20, -52}, {20, -50}, {40, -50}}, color = {0, 0, 255}));
  connect(LED_driver_4.pin_p, LED_4.p) annotation (
    Line(points = {{2, -106}, {19, -106}, {19, -108}, {38, -108}}, color = {0, 0, 255}));
  connect(LED_driver_4.pin_n, LED_4.n) annotation (
    Line(points = {{2, -152}, {38, -152}}, color = {0, 0, 255}));
  connect(LED_1.n, ground1.p) annotation (
    Line(points = {{40, 170}, {70, 170}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_2.n, ground1.p) annotation (
    Line(points = {{40, 66}, {70, 66}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_3.n, ground1.p) annotation (
    Line(points = {{40, -50}, {70, -50}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_4.n, ground1.p) annotation (
    Line(points = {{38, -152}, {70, -152}, {70, -168}}, color = {0, 0, 255}));
  connect(schedule.y[1], LED_1.u) annotation (
    Line(points = {{142,221},{52,221},{52,192}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_2.u) annotation (
    Line(points = {{142,221},{52,221},{52,88}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_3.u) annotation (
    Line(points = {{142,221},{52,221},{52,-28}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_4.u) annotation (
    Line(points = {{142,221},{50,221},{50,-130}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-300, -300}, {300, 300}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-300, -300}, {300, 300}}, initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Design_for_DC_all_AC;
