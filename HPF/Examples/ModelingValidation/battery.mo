within HPF.Examples.ModelingValidation;
model battery
    .HPF.DC.BESS bESS annotation(Placement(transformation(extent = {{2.0,-72.0},{22.0,-52.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Variable_DC_Load variable_DC_Load annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {86.0,34.0},rotation = -90.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple aCDC_1pRectifierSimple(VDC_nom = 48) annotation(Placement(transformation(extent = {{42.0,24.0},{62.0,44.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground annotation(Placement(transformation(extent = {{68,-68},{88,-48}},origin = {0,0},rotation = 0)));
    .HPF.SinglePhase.Components.Ground ground2 annotation(Placement(transformation(extent = {{-22,12},{-6,28}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_L1_Mechanical(verboseExtrapolation = true,startTime(displayUnit = "h") = 0,offset = {0},timeScale(displayUnit = "h") = 3600,extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,smoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-Mechanical_LP.txt"),tableName = "Mechanical",tableOnFile = true) annotation(HideResult = true,Placement(transformation(extent = {{70.0,68.0},{90.0,88.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = true) annotation(Placement(transformation(extent = {{-120.0,-56.0},{-100.0,-36.0}},origin = {0.0,0.0},rotation = 0.0)));
    inner .HPF.SystemDef systemDef annotation(Placement(transformation(extent = {{-78,-10},{-50,14}},origin = {0,0},rotation = 0)));
    .HPF.SinglePhase.Components.Terminate terminate annotation(Placement(transformation(extent = {{17.0,67.0},{31.0,81.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Terminate terminate2 annotation(Placement(transformation(extent = {{17.0,57.0},{31.0,71.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.ThreePhase.VoltageSource_outage voltageSource annotation(Placement(transformation(extent = {{-16,64},{0,80}},origin = {0,0},rotation = 0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pBidirectionalSimple aCDC_1pInverterSimple(VDC_nom = 48) annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {12.0,-24.0},rotation = 90.0)));
    .Modelica.Blocks.Logical.Switch switch annotation(Placement(transformation(extent = {{-58,-56},{-38,-36}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Math.Gain gain(k = -1) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {110.0,-4.0},rotation = -90.0)));
equation
    connect(aCDC_1pRectifierSimple.hPin_N,ground2.pin) annotation(Line(points = {{42,26},{36,26},{36,34},{-14,34},{-14,28}},color = {117,80,123}));
    connect(aCDC_1pRectifierSimple.pin_p,variable_DC_Load.p) annotation(Line(points = {{62,42},{68,42},{68,50},{86,50},{86,44}},color = {0,0,255}));
    connect(aCDC_1pRectifierSimple.pin_n,variable_DC_Load.n) annotation(Line(points = {{62,26},{68,26},{68,18},{86,18},{86,24}},color = {0,0,255}));
    connect(variable_DC_Load.n,ground.p) annotation(Line(points = {{86,24},{86,-12},{78,-12},{78,-48}},color = {0,0,255}));
    connect(combiTimeTable_L1_Mechanical.y[1],variable_DC_Load.u) annotation(Line(points = {{91,78},{97,78},{97,33.800000000000004},{91,33.800000000000004}},color = {0,0,127}));
    connect(bESS.n,ground.p) annotation(Line(points = {{22,-62},{28,-62},{28,-42},{78,-42},{78,-48}},color = {0,0,255}));
    connect(aCDC_1pInverterSimple.pin_p,bESS.p) annotation(Line(points = {{3.9999999999999982,-34},{3.9999999999999982,-40},{-4,-40},{-4,-62},{2,-62}},color = {0,0,255}));
    connect(aCDC_1pInverterSimple.pin_n,bESS.n) annotation(Line(points = {{20,-34},{20,-40},{28,-40},{28,-62},{22,-62}},color = {0,0,255}));
    connect(aCDC_1pInverterSimple.hPin_N,aCDC_1pRectifierSimple.hPin_N) annotation(Line(points = {{20,-14.000000000000002},{20,26},{42,26}},color = {117,80,123}));
    connect(voltageSource.pinP_phB,terminate.hPin_P) annotation(Line(points = {{2,72},{12,72},{12,73},{22,73}},color = {92,53,102}));
    connect(voltageSource.pinP_phC,terminate2.hPin_P) annotation(Line(points = {{2,64},{2,58},{16,58},{16,63},{22,63}},color = {92,53,102}));
    connect(voltageSource.pinN,ground2.pin) annotation(Line(points = {{-8,61.8},{-8,44.9},{-14,44.9},{-14,28}},color = {117,80,123}));
    connect(aCDC_1pInverterSimple.hPin_L,voltageSource.pinP_phA) annotation(Line(points = {{4.000000000000002,-13.999999999999998},{4.000000000000002,58},{6,58},{6,86},{2,86},{2,80}},color = {92,53,102}));
    connect(voltageSource.pinP_phA,aCDC_1pRectifierSimple.hPin_L) annotation(Line(points = {{2,80},{2,86},{36,86},{36,42},{42,42}},color = {92,53,102}));
    connect(booleanConstant.y,switch.u2) annotation(Line(points = {{-99,-46},{-60,-46}},color = {255,0,255}));
    connect(voltageSource.P,switch.u3) annotation(Line(points = {{-8,83},{-8,89},{-34,89},{-34,-62},{-60,-62},{-60,-54}},color = {0,0,127}));
    connect(combiTimeTable_L1_Mechanical.y[1],gain.u) annotation(Line(points = {{91,78},{110,78},{110,8}},color = {0,0,127}));
    connect(gain.y,switch.u1) annotation(Line(points = {{110,-15},{110,-26.5},{-60,-26.5},{-60,-38}},color = {0,0,127}));
    connect(booleanConstant.y,voltageSource.outage) annotation(Line(points = {{-99,-46},{-90,-46},{-90,76},{-18.6,76}},color = {255,0,255}));
    connect(voltageSource.P,bESS.P_ref) annotation(Line(points = {{-16.8,72},{-22.8,72},{-22.8,-68.2},{12,-68.2},{12,-62.2}},color = {0,0,127}));

end battery;