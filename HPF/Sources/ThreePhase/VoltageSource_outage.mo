within HPF.Sources.ThreePhase;
model VoltageSource_outage "Three phase voltage source with outage capability"
 outer .HPF.SystemDef systemDef;
 // Pins
 .HPF.SinglePhase.Interface.HPin_P pinP_phA(h = systemDef.numHrm) annotation (
   Placement(transformation(extent = {{90, 50}, {110, 70}}),
             iconTransformation(extent = {{90, 70}, {110, 90}})));
 .HPF.SinglePhase.Interface.HPin_P pinP_phB(h = systemDef.numHrm) annotation (
   Placement(transformation(extent = {{90, -10}, {110, 10}}),
             iconTransformation(extent = {{90, -10}, {110, 10}})));
 .HPF.SinglePhase.Interface.HPin_P pinP_phC(h = systemDef.numHrm) annotation (
   Placement(transformation(extent = {{90, -70}, {110, -50}}),
             iconTransformation(extent = {{90, -90}, {110, -70}})));
 .HPF.SinglePhase.Interface.HPin_N pinN(h = systemDef.numHrm) annotation (
   Placement(transformation(extent = {{90, -90}, {110, -70}}),
             iconTransformation(extent = {{-10, -110}, {10, -90}})));
 // Voltage sources
 .HPF.SinglePhase.Sources.VoltageSource vSrc_phA(vMag = effective_vMag_phA, vArg = effective_vArg_phA) annotation (
   Placement(transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
 .HPF.SinglePhase.Sources.VoltageSource vSrc_phB(vMag = effective_vMag_phB, vArg = effective_vArg_phB) annotation (
   Placement(transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
 .HPF.SinglePhase.Sources.VoltageSource vSrc_phC(vMag = effective_vMag_phC, vArg = effective_vArg_phC) annotation (
   Placement(transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
 // Parameters
 parameter .Modelica.Units.SI.Voltage vMag_phA[systemDef.numHrm] = fill(120.0, systemDef.numHrm) "Phase A magnitude";
 parameter Real vArg_phA[systemDef.numHrm] = fill(0.0, systemDef.numHrm) "Phase A angle";
 parameter .Modelica.Units.SI.Voltage vMag_phB[systemDef.numHrm] = fill(120.0, systemDef.numHrm) "Phase B magnitude";
 parameter Real vArg_phB[systemDef.numHrm] = fill(-2*Modelica.Constants.pi/3, systemDef.numHrm) "Phase B angle";
 parameter .Modelica.Units.SI.Voltage vMag_phC[systemDef.numHrm] = fill(120.0, systemDef.numHrm) "Phase C magnitude";
 parameter Real vArg_phC[systemDef.numHrm] = fill(2*Modelica.Constants.pi/3, systemDef.numHrm) "Phase C angle";
 // Effective voltage magnitudes and angles
 Real effective_vMag_phA[systemDef.numHrm];
 Real effective_vArg_phA[systemDef.numHrm];
 Real effective_vMag_phB[systemDef.numHrm];
 Real effective_vArg_phB[systemDef.numHrm];
 Real effective_vMag_phC[systemDef.numHrm];
 Real effective_vArg_phC[systemDef.numHrm];
 // Inputs and outputs
 .Modelica.Blocks.Interfaces.RealOutput P annotation (
   Placement(transformation(extent = {{-110, 60}, {-90, 80}}),
             iconTransformation(extent = {{-10, 100}, {10, 120}}, rotation = 90)));
 .Modelica.Blocks.Interfaces.BooleanInput outage annotation (
   Placement(transformation(extent = {{-120, 30}, {-100, 50}})));
equation
 // Compute effective voltage magnitudes and angles based on outage
 for h in 1:systemDef.numHrm loop
   effective_vMag_phA[h] = if outage then 0.0 else vMag_phA[h];
   effective_vArg_phA[h] = if outage then 0.0 else vArg_phA[h];
   effective_vMag_phB[h] = if outage then 0.0 else vMag_phB[h];
   effective_vArg_phB[h] = if outage then 0.0 else vArg_phB[h];
   effective_vMag_phC[h] = if outage then 0.0 else vMag_phC[h];
   effective_vArg_phC[h] = if outage then 0.0 else vArg_phC[h];
 end for;
 // Power calculation
 P = sum(vSrc_phA.v[:].re .* vSrc_phA.i[:].re + vSrc_phA.v[:].im .* vSrc_phA.i[:].im) +
     sum(vSrc_phB.v[:].re .* vSrc_phB.i[:].re + vSrc_phB.v[:].im .* vSrc_phB.i[:].im) +
     sum(vSrc_phC.v[:].re .* vSrc_phC.i[:].re + vSrc_phC.v[:].im .* vSrc_phC.i[:].im);
    connect(vSrc_phA.pin_p,pinP_phA) annotation(Line(points = {{0,60},{100,60}},color = {92,53,102}));
    connect(vSrc_phB.pin_p,pinP_phB) annotation(Line(points = {{0,-1.2246467991473533e-15},{100,0}},color = {92,53,102}));
    connect(vSrc_phC.pin_p,pinP_phC) annotation(Line(points = {{0,-40},{50,-40},{50,-60},{100,-60}},color = {92,53,102}));
    connect(vSrc_phA.pin_n,pinN) annotation(Line(points = {{-20,60},{-26,60},{-26,-80},{100,-80}},color = {117,80,123}));
    connect(vSrc_phB.pin_n,pinN) annotation(Line(points = {{-20,1.2246467991473533e-15},{-26,1.2246467991473533e-15},{-26,-80},{100,-80}},color = {117,80,123}));
    connect(vSrc_phC.pin_n,pinN) annotation(Line(points = {{-20,-40},{-26,-40},{-26,-80},{100,-80}},color = {117,80,123}));
 // Connections

annotation (
 Icon(graphics={
   Rectangle(extent = {{-100, 100}, {100, -100}}),
   Ellipse(origin = {-15, 7}, extent = {{-45, 53}, {75, -67}}, endAngle = 360),
   Line(points = {{-40, 0}, {-36, 12}, {-32, 22}, {-26, 30}, {-18, 34}, {-8, 26}, {-4, 14}, {0, 0}, {4, -12}, {6, -18}, {12, -28}, {22, -34}, {30, -24}, {34, -16}, {38, -6}, {40, 0}}, smooth = Smooth.Bezier),
   Text(origin = {100, -80}, extent = {{-10, 10}, {10, -10}}, textString = "C"),
   Text(origin = {100, 0}, extent = {{-10, 10}, {10, -10}}, textString = "B"),
   Text(origin = {100, 80}, extent = {{-10, 10}, {10, -10}}, textString = "A"),
   Text(extent = {{-150, 150}, {150, 110}}, textString = "%name"),
   Text(extent = {{-30, 130}, {30, 110}}, textString = "P")}),
 Documentation(info = "<html><p>Three-phase voltage source with outage capability.</p></html>"),
 Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end VoltageSource_outage;