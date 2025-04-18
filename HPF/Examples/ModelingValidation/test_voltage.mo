within HPF.Examples.ModelingValidation;
model test_voltage
    .HPF.Sources.ThreePhase.VoltageSource_outage voltageSource_outage annotation(Placement(transformation(extent = {{-62.0,12.0},{-42.0,32.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Resistor R annotation(Placement(transformation(extent = {{2,22},{22,42}},origin = {0,0},rotation = 0)));
    .HPF.SinglePhase.Components.Resistor R2 annotation(Placement(transformation(extent = {{16,36},{36,56}},origin = {0,0},rotation = 0)));
    .HPF.SinglePhase.Components.Resistor R3 annotation(Placement(transformation(extent = {{30,50},{50,70}},origin = {0,0},rotation = 0)));
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{2,-16},{18,0}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = false) annotation(Placement(transformation(extent = {{-98,16},{-78,36}},origin = {0,0},rotation = 0)));
equation
    connect(booleanConstant.y,voltageSource_outage.outage) annotation(Line(points = {{-77,26},{-63,26}},color = {255,0,255}));
    connect(voltageSource_outage.pinP_phA,R3.pin_p) annotation(Line(points = {{-42,30},{-6,30},{-6,60},{30,60}},color = {92,53,102}));
    connect(voltageSource_outage.pinP_phB,R2.pin_p) annotation(Line(points = {{-42,22},{-13,22},{-13,46},{16,46}},color = {92,53,102}));
    connect(voltageSource_outage.pinP_phC,R.pin_p) annotation(Line(points = {{-42,14},{-20,14},{-20,32},{2,32}},color = {92,53,102}));
    connect(R3.pin_n,ground.pin) annotation(Line(points = {{50,60},{56,60},{56,6},{10,6},{10,0}},color = {117,80,123}));
    connect(R2.pin_n,ground.pin) annotation(Line(points = {{36,46},{42,46},{42,6},{10,6},{10,0}},color = {117,80,123}));
    connect(R.pin_n,ground.pin) annotation(Line(points = {{22,32},{28,32},{28,6},{10,6},{10,0}},color = {117,80,123}));
    connect(voltageSource_outage.pinN,ground.pin) annotation(Line(points = {{-52,12},{-52,6},{10,6},{10,0}},color = {117,80,123}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end test_voltage;
