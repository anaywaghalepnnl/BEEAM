within HPF.Examples.ModelingValidation;
model lengthSensitivity
    inner parameter Real PF = 0.95;
    inner parameter Real PF1 = tan(acos(PF));
    parameter Real Vs = 7200;
    parameter Real kp = 3;
    parameter Real ks = 1;
    parameter Real km = 3;
    
    .PrototypeBuildingElectricalModels.Subsystems.LightingPanels.San_Diego.Conv_AC.Light_Panel_L1_2A light_Panel_L1_2A(cable_light_L1_2A(length = 61)) annotation(Placement(transformation(extent = {{66.0,38.0},{86.0,58.0}},origin = {0.0,0.0},rotation = 0.0)));
    .PrototypeBuildingElectricalModels.Subsystems.LightingPanels.San_Diego.Conv_AC.Light_Panel_L1_2B light_Panel_L1_2B(cable_light_L1_2B(length = 52)) annotation(Placement(transformation(extent = {{66.0,20.0},{86.0,40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground GndAC annotation(Placement(HideResult = true,visible = true,transformation(origin = {0.0,0.0},extent = {{9.25,-57.0},{25.25,-41.0}},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground GndAC2 annotation(Placement(HideResult = true,visible = true,transformation(origin = {0.0,0.0},extent = {{-100.75,-29.0},{-84.75,-13.0}},rotation = 0.0)));
    .HPF.Transformers.ThreePhase.Symmetric.D1Y Dist_Xmer(Xs = 0.00665 * ks,Xp = 4.4882 * kp,Xm = 10366.7 * km,Rs = 0.0006488 * ks,Rp = 0.43785 * kp,Rc = 110450.1 * km,VSecRated = 480,VPrimRated = 12470) annotation(Placement(visible = true,transformation(extent = {{-22.75,3.0},{27.25,43.0}},rotation = 0.0,origin = {0.0,0.0})));
    .HPF.Sources.ThreePhase.VoltageSource voltageSource(vMag_phC = {Vs},vMag_phB = {Vs},vMag_phA = {Vs},vArg_phC = {2.0944},vArg_phB = {-2.0944},vArg_phA = {0}) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-80.75,13.0},{-60.75,33.0}},rotation = 0.0)));
    .HPF.SinglePhase.Components.Terminate terminate annotation(Placement(transformation(extent = {{61,9},{75,23}},origin = {0,0},rotation = 0)));
    inner .HPF.SystemDef systemDef(numPh = 3,hrms = {1},fs = 5000,fFund = 60) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-126.0,76.2857},{-94.0,103.7143}},rotation = 0.0)));
equation
    connect(Dist_Xmer.pinSec_N,GndAC.pin) annotation(Line(points = {{27.25,-1},{27.25,-41},{17.25,-41}},color = {117,80,123}));
    connect(voltageSource.pinN,GndAC2.pin) annotation(Line(points = {{-70.75,10.25},{-70.75,-13},{-92.75,-13}},color = {117,80,123}));
    connect(voltageSource.pinP_phA,Dist_Xmer.pinPrim_A) annotation(Line(points = {{-58.25,33},{-42.75,33},{-42.75,43},{-22.75,43}},color = {92,53,102}));
    connect(voltageSource.pinP_phB,Dist_Xmer.pinPrim_B) annotation(Line(points = {{-58.25,23},{-22.75,23}},color = {92,53,102}));
    connect(voltageSource.pinP_phC,Dist_Xmer.pinPrim_C) annotation(Line(points = {{-58.25,13},{-52.75,13},{-52.75,9},{-48.75,9},{-48.75,3},{-22.75,3}},color = {92,53,102}));
    connect(Dist_Xmer.pinSec_A,light_Panel_L1_2A.pin_p) annotation(Line(points = {{27.25,47},{46.625,47},{46.625,48},{66,48}},color = {92,53,102}));
    connect(Dist_Xmer.pinSec_B,light_Panel_L1_2B.pin_p) annotation(Line(points = {{27.25,31},{46.625,31},{46.625,30},{66,30}},color = {92,53,102}));
    connect(Dist_Xmer.pinSec_C,terminate.hPin_P) annotation(Line(points = {{27.25,15},{66,15}},color = {92,53,102}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end lengthSensitivity;
