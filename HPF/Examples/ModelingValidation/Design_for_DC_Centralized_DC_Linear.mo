within HPF.Examples.ModelingValidation;
model Design_for_DC_Centralized_DC_Linear
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}, numPh = 1) annotation (
    Placement(visible = true, transformation(origin = {-249.333, 262.667}, extent = {{-32.6667, -32.6667}, {32.6667, 23.3333}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource input_source(start_v_re = {120, 0, 0, 0, 0, 0, 0, 0, 0, 0}, vArg = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0, 0, 0, 0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-362, 42}, extent = {{-36, -36}, {36, 36}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-276, -182}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.DC.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {69, -181}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  HPF.DC.Variable_DC_Load LED_1 annotation(
    Placement(visible = true, transformation(origin = {40, 192}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  Modelica.Blocks.Sources.CombiTimeTable schedule(fileName = "/media/sf_Project_Codes/BEEAM/HPF/Data/load_profiles/schedule_linear.txt", tableName = "schedule_linear", tableOnFile = true)  annotation(
    Placement(visible = true, transformation(origin = {142, 256}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple PoE_switch(P_DCmin = 1, P_nom = 820, P_stby = 37, VAC_nom = 120, VDC_nom = 53, alpha = 0.043076, beta = 0.069259, gamma = 0.080952)  annotation(
    Placement(visible = true, transformation(origin = {-192, 42}, extent = {{-42, -42}, {42, 42}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_driver_1(modelData = igor_PoE_Driver)  annotation(
    Placement(visible = true, transformation(origin = {-23, 187}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.Igor_PoE_Driver_53W igor_PoE_Driver annotation(
    Placement(visible = true, transformation(origin = {249, 275}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_driver_2(modelData = igor_PoE_Driver) annotation(
    Placement(visible = true, transformation(origin = {-23, 90}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_driver_3(modelData = igor_PoE_Driver) annotation(
    Placement(visible = true, transformation(origin = {-23, -20}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_driver_4(modelData = igor_PoE_Driver) annotation(
    Placement(visible = true, transformation(origin = {-23, -123}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  HPF.DC.Variable_DC_Load LED_2 annotation(
    Placement(visible = true, transformation(origin = {40, 90}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_3 annotation(
    Placement(visible = true, transformation(origin = {40, -18}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_4 annotation(
    Placement(visible = true, transformation(origin = {40, -122}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.Cables.NEC_CableModelDC PoE_cable_1(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC)  annotation(
    Placement(visible = true, transformation(origin = {-86, 210}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  HPF.Cables.NEC_CableModelDC PoE_cable_2(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC)  annotation(
    Placement(visible = true, transformation(origin = {-84, 114}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  HPF.Cables.NEC_CableModelDC PoE_cable_3(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC)  annotation(
    Placement(visible = true, transformation(origin = {-90, -2}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  HPF.Cables.NEC_CableModelDC PoE_cable_4(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC)  annotation(
    Placement(visible = true, transformation(origin = {-86, -100}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 0)  annotation(
    Placement(visible = true, transformation(origin = {-134, 174}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0) annotation(
    Placement(visible = true, transformation(origin = {-124, 92}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor11(R = 0) annotation(
    Placement(visible = true, transformation(origin = {-122, 32}, extent = {{-16, 16}, {16, -16}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor111(R = 0) annotation(
    Placement(visible = true, transformation(origin = {-136, -86}, extent = {{-16, 16}, {16, -16}}, rotation = -90)));
  HPF.Cables.NEC_CableModel AC_cable(length = 6, wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12)  annotation(
    Placement(visible = true, transformation(origin = {-293, 79}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_Driver_5(modelData = igor_PoE_Driver) annotation(
    Placement(visible = true, transformation(origin = {289, 187}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_driver_6(modelData = igor_PoE_Driver) annotation(
    Placement(visible = true, transformation(origin = {289, 90}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_driver_7(modelData = igor_PoE_Driver) annotation(
    Placement(visible = true, transformation(origin = {289, -20}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  HPF.DC.DC2DC_Converters.StepDown PoE_driver_8(modelData = igor_PoE_Driver) annotation(
    Placement(visible = true, transformation(origin = {289, -123}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  HPF.DC.Variable_DC_Load LED_5 annotation(
    Placement(visible = true, transformation(origin = {352, 188}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_6 annotation(
    Placement(visible = true, transformation(origin = {352, 90}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_7 annotation(
    Placement(visible = true, transformation(origin = {352, -18}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.DC.Variable_DC_Load LED_8 annotation(
    Placement(visible = true, transformation(origin = {352, -122}, extent = {{-22, -22}, {22, 22}}, rotation = -90)));
  HPF.Cables.NEC_CableModelDC PoE_cable_5(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC) annotation(
    Placement(visible = true, transformation(origin = {226, 210}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  HPF.Cables.NEC_CableModelDC PoE_cable_6(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC) annotation(
    Placement(visible = true, transformation(origin = {228, 114}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  HPF.Cables.NEC_CableModelDC PoE_cable_7(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC) annotation(
    Placement(visible = true, transformation(origin = {222, -2}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  HPF.Cables.NEC_CableModelDC PoE_cable_8(length = 30, wireGaugeDC = HPF.Types.WireGaugeDC.guage_POE_VHC) annotation(
    Placement(visible = true, transformation(origin = {226, -100}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 0) annotation(
    Placement(visible = true, transformation(origin = {178, 174}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor12(R = 0) annotation(
    Placement(visible = true, transformation(origin = {188, 92}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor112(R = 0) annotation(
    Placement(visible = true, transformation(origin = {190, 32}, extent = {{-16, 16}, {16, -16}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1111(R = 0) annotation(
    Placement(visible = true, transformation(origin = {176, -86}, extent = {{-16, 16}, {16, -16}}, rotation = -90)));
equation
  connect(ground.pin, input_source.pin_n) annotation(
    Line(points = {{-276, -166}, {-276, -79}, {-362, -79}, {-362, 6}}, color = {92, 53, 102}));
  connect(LED_1.n, ground1.p) annotation(
    Line(points = {{40, 170}, {70, 170}, {70, -168}}, color = {0, 0, 255}));
  connect(schedule.y[1], LED_1.u) annotation(
    Line(points = {{142, 224}, {52, 224}, {52, 192}}, color = {0, 0, 127}));
  connect(PoE_driver_1.p2, LED_1.p) annotation(
    Line(points = {{0, 210}, {21, 210}, {21, 214}, {40, 214}}, color = {0, 0, 255}));
  connect(PoE_driver_1.n2, LED_1.n) annotation(
    Line(points = {{0, 164}, {40, 164}, {40, 170}}, color = {0, 0, 255}));
  connect(input_source.pin_n, PoE_switch.hPin_N) annotation(
    Line(points = {{-362, 6}, {-255, 6}, {-255, 8}, {-234, 8}}, color = {117, 80, 123}));
  connect(PoE_switch.pin_n, PoE_driver_1.n1) annotation(
    Line(points = {{-150, 8}, {-68, 8}, {-68, 164}, {-46, 164}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, PoE_driver_2.n1) annotation(
    Line(points = {{-150, 8}, {-68, 8}, {-68, 67}, {-46, 67}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, PoE_driver_3.n1) annotation(
    Line(points = {{-150, 8}, {-68, 8}, {-68, -43}, {-46, -43}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, PoE_driver_4.n1) annotation(
    Line(points = {{-150, 8}, {-68, 8}, {-68, -146}, {-46, -146}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, ground1.p) annotation(
    Line(points = {{-150, 8}, {-128, 8}, {-128, -168}, {70, -168}}, color = {0, 0, 255}));
  connect(PoE_driver_2.p2, LED_2.p) annotation(
    Line(points = {{0, 114}, {40, 114}, {40, 112}}, color = {0, 0, 255}));
  connect(PoE_driver_2.n2, LED_2.n) annotation(
    Line(points = {{0, 68}, {40, 68}}, color = {0, 0, 255}));
  connect(PoE_driver_3.p2, LED_3.p) annotation(
    Line(points = {{0, 3}, {20, 3}, {20, 4}, {40, 4}}, color = {0, 0, 255}));
  connect(PoE_driver_3.n2, LED_3.n) annotation(
    Line(points = {{0, -43}, {19, -43}, {19, -40}, {40, -40}}, color = {0, 0, 255}));
  connect(PoE_driver_4.p2, LED_4.p) annotation(
    Line(points = {{0, -100}, {40, -100}}, color = {0, 0, 255}));
  connect(PoE_driver_4.n2, LED_4.n) annotation(
    Line(points = {{0, -146}, {20, -146}, {20, -144}, {40, -144}}, color = {0, 0, 255}));
  connect(LED_2.n, ground1.p) annotation(
    Line(points = {{40, 68}, {70, 68}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_3.n, ground1.p) annotation(
    Line(points = {{40, -40}, {70, -40}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_4.n, ground1.p) annotation(
    Line(points = {{40, -144}, {70, -144}, {70, -168}}, color = {0, 0, 255}));
  connect(schedule.y[1], LED_2.u) annotation(
    Line(points = {{142, 224}, {142, 90}, {52, 90}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_3.u) annotation(
    Line(points = {{142, 224}, {142, -18}, {52, -18}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_4.u) annotation(
    Line(points = {{142, 224}, {140, 224}, {140, -122}, {52, -122}}, color = {0, 0, 127}));
  connect(PoE_cable_1.n, PoE_driver_1.p1) annotation(
    Line(points = {{-62, 210}, {-46, 210}}, color = {0, 0, 255}));
  connect(PoE_cable_2.n, PoE_driver_2.p1) annotation(
    Line(points = {{-60, 114}, {-53, 114}, {-53, 113}, {-46, 113}}, color = {0, 0, 255}));
  connect(PoE_cable_3.n, PoE_driver_3.p1) annotation(
    Line(points = {{-66, -2}, {-54, -2}, {-54, 3}, {-46, 3}}, color = {0, 0, 255}));
  connect(PoE_cable_4.n, PoE_driver_4.p1) annotation(
    Line(points = {{-62, -100}, {-46, -100}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor.p) annotation(
    Line(points = {{-150, 76}, {-134, 76}, {-134, 158}}, color = {0, 0, 255}));
  connect(resistor.n, PoE_cable_1.p) annotation(
    Line(points = {{-134, 190}, {-136, 190}, {-136, 210}, {-110, 210}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor1.p) annotation(
    Line(points = {{-150, 76}, {-124, 76}}, color = {0, 0, 255}));
  connect(resistor1.n, PoE_cable_2.p) annotation(
    Line(points = {{-124, 108}, {-122, 108}, {-122, 114}, {-108, 114}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor11.p) annotation(
    Line(points = {{-150, 76}, {-122, 76}, {-122, 48}}, color = {0, 0, 255}));
  connect(resistor11.n, PoE_cable_3.p) annotation(
    Line(points = {{-122, 16}, {-122, -2}, {-114, -2}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor111.p) annotation(
    Line(points = {{-150, 76}, {-136, 76}, {-136, -70}}, color = {0, 0, 255}));
  connect(resistor111.n, PoE_cable_4.p) annotation(
    Line(points = {{-136, -102}, {-110, -102}, {-110, -100}}, color = {0, 0, 255}));
  connect(AC_cable.pin_n, PoE_switch.hPin_L) annotation(
    Line(points = {{-276, 80}, {-234, 80}, {-234, 76}}, color = {117, 80, 123}));
  connect(input_source.pin_p, AC_cable.pin_p) annotation(
    Line(points = {{-362, 78}, {-337, 78}, {-337, 80}, {-310, 80}}, color = {92, 53, 102}));
  connect(PoE_cable_5.n, PoE_Driver_5.p1) annotation(
    Line(points = {{250, 210}, {266, 210}}, color = {0, 0, 255}));
  connect(resistor2.n, PoE_cable_5.p) annotation(
    Line(points = {{178, 190}, {202, 190}, {202, 210}}, color = {0, 0, 255}));
  connect(PoE_Driver_5.p2, LED_5.p) annotation(
    Line(points = {{312, 210}, {352, 210}}, color = {0, 0, 255}));
  connect(PoE_Driver_5.n2, LED_5.n) annotation(
    Line(points = {{312, 164}, {352, 164}, {352, 166}}, color = {0, 0, 255}));
  connect(PoE_driver_6.p2, LED_6.p) annotation(
    Line(points = {{312, 114}, {354, 114}, {354, 112}, {352, 112}}, color = {0, 0, 255}));
  connect(PoE_driver_6.n2, LED_6.n) annotation(
    Line(points = {{312, 68}, {352, 68}}, color = {0, 0, 255}));
  connect(PoE_cable_6.n, PoE_driver_6.p1) annotation(
    Line(points = {{252, 114}, {266, 114}}, color = {0, 0, 255}));
  connect(resistor12.n, PoE_cable_6.p) annotation(
    Line(points = {{188, 108}, {204, 108}, {204, 114}}, color = {0, 0, 255}));
  connect(resistor112.n, PoE_cable_7.p) annotation(
    Line(points = {{190, 16}, {198, 16}, {198, -2}}, color = {0, 0, 255}));
  connect(PoE_cable_7.n, PoE_driver_7.p1) annotation(
    Line(points = {{246, -2}, {266, -2}, {266, 4}}, color = {0, 0, 255}));
  connect(PoE_driver_7.p2, LED_7.p) annotation(
    Line(points = {{312, 4}, {352, 4}}, color = {0, 0, 255}));
  connect(PoE_driver_7.n2, LED_7.n) annotation(
    Line(points = {{312, -42}, {352, -42}, {352, -40}}, color = {0, 0, 255}));
  connect(PoE_driver_8.p2, LED_8.p) annotation(
    Line(points = {{312, -100}, {352, -100}}, color = {0, 0, 255}));
  connect(PoE_driver_8.n2, LED_8.n) annotation(
    Line(points = {{312, -146}, {352, -146}, {352, -144}}, color = {0, 0, 255}));
  connect(resistor1111.n, PoE_cable_8.p) annotation(
    Line(points = {{176, -102}, {202, -102}, {202, -100}}, color = {0, 0, 255}));
  connect(PoE_cable_8.n, PoE_driver_8.p1) annotation(
    Line(points = {{250, -100}, {266, -100}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor2.p) annotation(
    Line(points = {{-150, 76}, {158, 76}, {158, 158}, {178, 158}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor12.p) annotation(
    Line(points = {{-150, 76}, {188, 76}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor112.p) annotation(
    Line(points = {{-150, 76}, {158, 76}, {158, 48}, {190, 48}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_p, resistor1111.p) annotation(
    Line(points = {{-150, 76}, {158, 76}, {158, -70}, {176, -70}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, PoE_Driver_5.n1) annotation(
    Line(points = {{-150, 8}, {164, 8}, {164, 164}, {266, 164}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, PoE_driver_6.n1) annotation(
    Line(points = {{-150, 8}, {164, 8}, {164, 68}, {266, 68}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, PoE_driver_7.n1) annotation(
    Line(points = {{-150, 8}, {164, 8}, {164, -42}, {266, -42}}, color = {0, 0, 255}));
  connect(PoE_switch.pin_n, PoE_driver_8.n1) annotation(
    Line(points = {{-150, 8}, {164, 8}, {164, -146}, {266, -146}}, color = {0, 0, 255}));
  connect(LED_5.n, ground1.p) annotation(
    Line(points = {{352, 166}, {406, 166}, {406, -168}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_6.n, ground1.p) annotation(
    Line(points = {{352, 68}, {406, 68}, {406, -168}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_7.n, ground1.p) annotation(
    Line(points = {{352, -40}, {406, -40}, {406, -168}, {70, -168}}, color = {0, 0, 255}));
  connect(LED_8.n, ground1.p) annotation(
    Line(points = {{352, -144}, {406, -144}, {406, -168}, {70, -168}}, color = {0, 0, 255}));
  connect(schedule.y[1], LED_5.u) annotation(
    Line(points = {{142, 224}, {364, 224}, {364, 188}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_6.u) annotation(
    Line(points = {{142, 224}, {364, 224}, {364, 90}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_7.u) annotation(
    Line(points = {{142, 224}, {364, 224}, {364, -18}}, color = {0, 0, 127}));
  connect(schedule.y[1], LED_8.u) annotation(
    Line(points = {{142, 224}, {364, 224}, {364, -122}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-300, -300}, {300, 300}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-300, -300}, {300, 300}}, initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Design_for_DC_Centralized_DC_Linear;