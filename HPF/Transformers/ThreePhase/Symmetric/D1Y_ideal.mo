within HPF.Transformers.ThreePhase.Symmetric;

model D1Y_ideal
  outer .HPF.SystemDef systemDef;
  parameter Real VPrimRated = 480 "Rated primary voltage (ph-ph)";
  parameter Real VSecRated = 208 "Rated secondary voltage (ph-ph)";

  .HPF.SinglePhase.Interface.HPin_P pinPrim_A(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-102, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .HPF.SinglePhase.Interface.HPin_P pinPrim_B(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .HPF.SinglePhase.Interface.HPin_P pinPrim_C(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .HPF.SinglePhase.Interface.HPin_P pinSec_A(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{90.0,110.0},{110.0,130.0}}, rotation = 0.0), iconTransformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .HPF.SinglePhase.Interface.HPin_P pinSec_B(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .HPF.SinglePhase.Interface.HPin_P pinSec_C(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .HPF.SinglePhase.Interface.HPin_N pinSec_N(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  .HPF.SinglePhase.Components.IdealTransformer T1 annotation (Placement(visible=true, transformation(
        origin={4,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  .HPF.SinglePhase.Components.IdealTransformer T2 annotation (Placement(visible=true, transformation(
        origin={4,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  .HPF.SinglePhase.Components.IdealTransformer T3 annotation (Placement(visible=true, transformation(
        origin={2,-110},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  /* Measurements
      * Total power loss
      * Core losses
      * Winding losses etc
    */
  // private
  /*
        Transformer ratio N:1 is defined for volatges at the input and output 
        port. 
        For a delta-Y transformer, the input voltage is phase 2 phase.
        The output voltage is phase to ground. For consistency, the parameters
        are defined phase-phase. 
        Performing appropriate conversion for the secondary. 
      */
  final parameter Real N = VPrimRated / (VSecRated / sqrt(3)) "Turns ratio N:1";
equation
  connect(pinSec_A, pinSec_A) annotation (
    Line(points = {{100,120},{100,120}}, color = {92, 53, 102}));
    connect(pinPrim_A,T1.pinP_Prim) annotation(Line(points = {{-102,100},{-102,90},{-6,90},{-6,80}},color = {92,53,102}));
    connect(pinPrim_A,T2.pinN_Prim) annotation(Line(points = {{-102,100},{-30,100},{-30,-20},{-6,-20}},color = {92,53,102}));
    connect(pinPrim_B,T2.pinP_Prim) annotation(Line(points = {{-100,0},{-100,6},{-6,6},{-6,0}},color = {92,53,102}));
    connect(pinPrim_B,T3.pinN_Prim) annotation(Line(points = {{-100,0},{-30,0},{-30,-120},{-8,-120}},color = {92,53,102}));
    connect(pinPrim_C,T3.pinP_Prim) annotation(Line(points = {{-100,-100},{-100,-94},{-8,-94},{-8,-100}},color = {92,53,102}));
    connect(pinPrim_C,T1.pinN_Prim) annotation(Line(points = {{-100,-100},{-100,-20},{-52,-20},{-52,60},{-6,60}},color = {92,53,102}));
    connect(T1.pinP_Sec,pinSec_A) annotation(Line(points = {{14,80},{14,100},{100,100},{100,120}},color = {92,53,102}));
    connect(T2.pinP_Sec,pinSec_B) annotation(Line(points = {{14,0},{14,20},{100,20},{100,40}},color = {92,53,102}));
    connect(T3.pinP_Sec,pinSec_C) annotation(Line(points = {{12,-100},{12,-70},{100,-70},{100,-40}},color = {92,53,102}));
    connect(T1.pinN_Sec,pinSec_N) annotation(Line(points = {{14,60},{14,-120},{100,-120}},color = {117,80,123}));
    connect(T2.pinN_Sec,pinSec_N) annotation(Line(points = {{14,-20},{14,-70},{100,-70},{100,-120}},color = {117,80,123}));
    connect(T3.pinN_Sec,pinSec_N) annotation(Line(points = {{12,-120},{12,-126},{100,-126},{100,-120}},color = {117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, initialScale = 0.1)),
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {10, 40}, extent = {{-100, 100}, {80, -180}}), Line(origin = {-1.36, -25.17}, points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {92, 53, 102}), Line(origin = {-0.204807, -24.3999}, points = {{42, 36}, {60, 0}, {78, 36}}, color = {92, 53, 102}), Line(origin = {-0.208107, -24.0148}, points = {{60, 0}, {60, -30}}, color = {92, 53, 102}), Text(origin = {28, -50}, lineColor = {92, 53, 102}, extent = {{-88, -20}, {32, -50}}, textString = "D1Y"), Ellipse(origin = {-15, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Ellipse(origin = {17, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Line(origin = {-50.5497, 80.1482}, points = {{11, 0}, {-11, 0}}), Line(origin = {53.2923, 79.9842}, points = {{11, 0}, {-11, 0}}), Text(origin = {-6.01881, 156}, lineColor = {92, 53, 102}, extent = {{-323.981, 14}, {326.019, -16}}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end D1Y_ideal;
