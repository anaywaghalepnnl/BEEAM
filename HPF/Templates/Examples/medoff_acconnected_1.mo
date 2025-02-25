within HPF.Templates.Examples;

model medoff_acconnected_1
    inner parameter Real PF = 0.95;
    inner parameter Real PF1 = tan(acos(PF));
    parameter Real Vs = 277;
    parameter Real kp = 3;
    parameter Real ks = 1;
    parameter Real km = 3;
    
    //Voltage source
    .HPF.Sources.ThreePhase.VoltageSource voltageSource(
        vArg_phA={0},
        vArg_phB={-2.0944},
        vArg_phC={2.0944},
        vMag_phA={Vs},
        vMag_phB={Vs},
        vMag_phC={Vs}) annotation(Placement(transformation(extent = {{-78.0,-22.0},{-62.0,-6.0}},origin = {0.0,0.0},rotation = 0.0)));
    inner .HPF.SystemDef systemDef annotation(Placement(transformation(extent = {{-102,32},{-74,56}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,timeScale = 3600,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-L1_Light_LP.txt"),tableName = "L1-Core-Lights",tableOnFile = true) annotation(Placement(transformation(extent = {{190.0,58.0},{210.0,78.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{-58,-58},{-42,-42}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Math.Gain gain3(k = 1) annotation(Placement(transformation(extent = {{-88.0,-118.0},{-68.0,-98.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.DC.FixedVoltage_VariablePower DC_Source(v_out(displayUnit = "V") = 660) annotation(Placement(visible = true,transformation(origin = {-44.25,-119.0},extent = {{-10.0,-10.0},{10.0,10.0}},rotation = 90.0)));
    .Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-48.25,-95.0},{-28.25,-75.0}},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_PV_roof(startTime(displayUnit = "h") = 0,offset = {0},timeScale(displayUnit = "h") = 3600,extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/pv_san_diego_roof.txt"),tableName = "pv_profile",tableOnFile = true) annotation(HideResult = true,Placement(transformation(extent = {{-126.0,-120.0},{-106.0,-100.0}},rotation = 0.0,origin = {0.0,0.0})));
    .HPF.PowerConverters.ThreePhase.ACDC_3pInverterSimple PV_Inverter(Q1(start = 0),gamma = 0.016227353,beta = 0.010598212,alpha = 0,VDC_nom = 660,VAC_nom = 277,P_stby = 10,P_nom = 1,PF = +0.95,vAngle = 0.52359877559829833278) annotation(Placement(visible = true,transformation(origin = {-6.25,-121},extent = {{-10,-10},{10,10}},rotation = 180)));
    .HPF.SinglePhase.Components.Terminate terminate annotation(Placement(transformation(extent = {{27,-15},{41,-1}},origin = {0,0},rotation = 0)));
    
    
equation
    connect(voltageSource.pinN,ground.pin) annotation(Line(points = {{-70,-24.200000000000003},{-70,-33.1},{-50,-33.1},{-50,-42}},color = {117,80,123}));
    connect(Ground_DC.p,DC_Source.n) annotation(Line(points = {{-38.25,-75},{-34.25,-75},{-34.25,-109},{-44.25,-109}},color = {0,0,255}));
    connect(combiTimeTable_PV_roof.y[1],gain3.u) annotation(Line(points = {{-105,-110},{-97.5,-110},{-97.5,-108},{-90,-108}},color = {0,0,127}));
    connect(gain3.y,DC_Source.p_out) annotation(Line(points = {{-67,-108},{-59.625,-108},{-59.625,-119},{-52.25,-119}},color = {0,0,127}));
    connect(DC_Source.n,PV_Inverter.pin_n) annotation(Line(points = {{-44.25,-109},{-28.25,-109},{-28.25,-113},{-16.25,-113}},color = {0,0,255}));
    connect(DC_Source.p,PV_Inverter.pin_p) annotation(Line(points = {{-44.25,-129},{-16.25,-129}},color = {0,0,255}));
    connect(PV_Inverter.hPin_N,ground.pin) annotation(Line(points = {{3.7500000000000018,-113},{9.750000000000002,-113},{9.750000000000002,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(PV_Inverter.hPin_A,voltageSource.pinP_phA) annotation(Line(points = {{3.7499999999999982,-129},{9.749999999999998,-129},{9.749999999999998,0},{-60,0},{-60,-6}},color = {92,53,102}));
    connect(PV_Inverter.hPin_B,voltageSource.pinP_phB) annotation(Line(points = {{3.75,-124},{9.75,-124},{9.75,-14},{-60,-14}},color = {92,53,102}));
    connect(PV_Inverter.hPin_C,voltageSource.pinP_phC) annotation(Line(points = {{3.75,-119},{9.75,-119},{9.75,-28},{-60,-28},{-60,-22}},color = {92,53,102}));
    connect(voltageSource.pinP_phA,terminate.hPin_P) annotation(Line(points = {{-60,-6},{-60,0},{26,0},{26,-9},{32,-9}},color = {92,53,102}));

end medoff_acconnected_1;
