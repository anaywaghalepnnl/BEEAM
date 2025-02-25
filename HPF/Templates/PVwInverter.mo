within HPF.Templates;

model PVwInverter
    .HPF.Sources.DC.FixedVoltage_VariablePower fixedVoltage_VariablePower annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {53.5,-28.75},rotation = 90.0)));
    .HPF.DC.Ground ground annotation(Placement(transformation(extent = {{29.5,-78.75},{49.5,-58.75}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable pv_schedule annotation(Placement(transformation(extent = {{1.5,-12.75},{21.5,7.25}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.ThreePhase.ACDC_3pInverterSimple aCDC_3pInverterSimple annotation(Placement(transformation(extent = {{89.5,-37.75},{69.5,-17.75}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Interface.HPin_P hPin_A annotation(Placement(transformation(extent = {{144.0,6.0},{164.0,26.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Interface.HPin_P hPin_B annotation(Placement(transformation(extent = {{144,-34},{164,-14}},origin = {0,0},rotation = 0)));
    .HPF.SinglePhase.Interface.HPin_P hPin_C annotation(Placement(transformation(extent = {{144,-68},{164,-48}},origin = {0,0},rotation = 0)));
    .HPF.SinglePhase.Interface.HPin_N hPin_N annotation(Placement(transformation(extent = {{144.0,-100.0},{164.0,-80.0}},origin = {0.0,0.0},rotation = 0.0)));

equation
  
    connect(fixedVoltage_VariablePower.n,ground.p) annotation(Line(points = {{53.5,-38.75},{53.5,-48.75},{39.5,-48.75},{39.5,-58.75}},color = {0,0,255}));
    connect(combiTimeTable.y[1],fixedVoltage_VariablePower.p_out) annotation(Line(points = {{22.5,-2.75},{34,-2.75},{34,-28.75},{45.5,-28.75}},color = {0,0,127}));
    connect(fixedVoltage_VariablePower.p,aCDC_3pInverterSimple.pin_p) annotation(Line(points = {{53.5,-18.75},{53.5,-12.75},{63.5,-12.75},{63.5,-19.75},{69.5,-19.75}},color = {0,0,255}));
    connect(fixedVoltage_VariablePower.n,aCDC_3pInverterSimple.pin_n) annotation(Line(points = {{53.5,-38.75},{53.5,-44.75},{63.5,-44.75},{63.5,-35.75},{69.5,-35.75}},color = {0,0,255}));
    connect(aCDC_3pInverterSimple.hPin_A,hPin_P) annotation(Line(points = {{89.5,-19.75},{121.75,-19.75},{121.75,16},{154,16},{154,12}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_B,hPin_P2) annotation(Line(points = {{89.5,-24.75},{121.75,-24.75},{121.75,-24},{154,-24}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_C,hPin_P3) annotation(Line(points = {{89.5,-29.75},{121.75,-29.75},{121.75,-58},{154,-58}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_N,hPin_N) annotation(Line(points = {{89.5,-35.75},{114,-35.75},{114,-90},{154,-90}},color = {117,80,123}));
    annotation(Icon(coordinateSystem(
      preserveAspectRatio = false,
      extent = {{-100.0,-100.0},{100.0,100.0}}),
      graphics={Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100,-100},{100,100}},origin={54,-34}),Text(lineColor={0,0,255},extent={{-150,-100},{150,-140}},textString="%name",origin={58,-36})}));
end PVwInverter;
