within HPF.Templates;

model PAE_AC_1
  //   parameter Integer nStepDown=modelData.nStepDown
  inner parameter Real PF = 0.95;
  inner parameter Real PF1 = tan(acos(PF));
  parameter Real Vs = 7200;
  parameter Real kp = 3;
  parameter Real ks = 1;
  parameter Real km = 3;
  parameter Integer nConverter = modelData.nConverter;
  replaceable .HPF.SinglePhase.Interface.ACDC_ConverterBase aCConverter[modelData.nConverter](
    name=modelData.aCConverter.name,
    V_Rect=modelData.aCConverter.V_Rect,
    nomP=modelData.aCConverter.nomP,
    nomV=modelData.aCConverter.nomV,
    vAngle=modelData.aCConverter.vAngle,
    P_stby=modelData.aCConverter.P_stby,
    P_DCmin=modelData.aCConverter.P_DCmin) constrainedby
    .HPF.SinglePhase.Interface.ACDC_ConverterBase
    annotation (Placement(transformation(extent={{-40.0,20.0},{-20.0,40.0}},rotation = 0.0,origin = {0.0,0.0})));
  .HPF.SinglePhase.Components.Ground ground
    annotation(Placement(visible = true,
      transformation(extent={{-56.25,-35},{-36.25,-15}})));
  replaceable parameter .HPF.Templates.Data.ACConverterwLoads modelData
    annotation (Placement(transformation(extent={{60.0,60.0},{80.0,80.0}},rotation = 0.0,origin = {0.0,0.0})));

  .HPF.DC.Ground ground1
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  .Modelica.Electrical.Analog.Basic.Resistor resistor11[modelData.nStepDown](
    R=modelData.R)
    annotation (Placement(visible=true,
      transformation(origin={-20,70}, extent={{-10,10},{10,-10}})));
  .HPF.Cables.NEC_CableModelDC PoE_cable[modelData.nStepDown](
    wireGaugeDC=modelData.wireGaugeDC,
    length=modelData.length)
    annotation (Placement(visible=true,
      transformation(
      origin={10,70},
      extent={{-10,-10},{10,10}})));

  inner .HPF.SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:2})
    annotation (Placement(visible = true,
      transformation(extent={{114.0,164.0},{142.0,188.0}},rotation = 0.0,origin = {0.0,0.0})));
    .HPF.Cables.NEC_CableModel nEC_CableModel(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12,length = 60) annotation(Placement(transformation(extent = {{-68.0,42.0},{-48.0,62.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.DC.FixedVoltage_VariablePower fixedVoltage_VariablePower(v_out = 660) annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {-138.5,105.25},rotation = 90.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{-162.5,55.25},{-142.5,75.25}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable pv_schedule(tableOnFile = true) annotation(Placement(transformation(extent = {{-190.5,121.25},{-170.5,141.25}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown loadwStepDown[modelData.nStepDown](redeclare replaceable .HPF.DC.DC2DC_Converters.StepDown dcdc_Converter, modelData=
         modelData.loadwStepDown) annotation(Placement(transformation(extent = {{26.0,34.0},{46.0,54.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown loadwStepDown2(redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter,schedule(tableName = "zero_schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/zero_schedule.txt"))) annotation(Placement(transformation(extent = {{-122.0,136.0},{-102.0,156.0}},origin = {0.0,0.0},rotation = 0.0)));
    replaceable .HPF.PowerConverters.SinglePhase.ACDC_1pConverterBase aCDC_1pInverterSimple(P_nom = 600000,VDC_nom = 660,VAC_nom = 277) annotation(Placement(transformation(extent = {{-72.0,98.0},{-92.0,118.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Sources.VoltageSource v(vMag = {277}) annotation(Placement(transformation(extent = {{-22.97877793873016,-22.978777938730147},{22.97877793873016,22.978777938730147}},origin = {-144.0,28.0},rotation = -90.0)));
    .HPF.Loads.SinglePhase.AC_LoadIdeal1P aC_LoadIdeal1P(V_nom = 277) annotation(Placement(transformation(extent = {{-36,124},{-16,144}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.CombiTimeTable ac_schedule(tableOnFile = true) annotation(Placement(transformation(extent = {{-80.16666666666666,147.33333333333334},{-60.16666666666666,167.33333333333334}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.ComplexBlocks.ComplexMath.RealToComplex realToComplex annotation(Placement(transformation(extent = {{-21.666666666666664,149.83333333333334},{-11.666666666666664,159.83333333333334}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Math.Gain gain(k = 0.95) annotation(HideResult = true,Placement(transformation(extent = {{-45.166666666666664,149.83333333333334},{-33.166666666666664,161.83333333333334}},rotation = 0.0,origin = {0.0,0.0})));
equation
  for i in 1:modelData.nConverter loop
    if i>1 then
     for j in (sum(modelData.stepDown_indices[1:(i-1)])+1):(sum(modelData.stepDown_indices[1:(i-1)])+modelData.stepDown_indices[i]) loop
       connect(aCConverter[i].pin_p, resistor11[j].p)
         annotation (Line(points={{-20,38},{-12,38},{-12,52},{-36,52},{-36,70},{-30,70}},
           color={0,0,255}));
       connect(loadwStepDown[j].n, aCConverter[i].pin_n)
         annotation (Line(points={{40,40},{60,40},{60,20},{10,20},{10,22},{-20,22}},
           color={0,0,255}));
       connect(resistor11[j].n, PoE_cable[j].p)
    annotation (Line(points={{-10,70},{0,70}}, color={0,0,255}));
       connect(PoE_cable[j].n, loadwStepDown[j].p) annotation (Line(points={{20,70},{30,70},{30,60},{14,60},{14,44},{24,44}}, color={0,0,255}));
     end for;
     else
     for j in (1:modelData.stepDown_indices[1]) loop
       connect(aCConverter[1].pin_p, resistor11[j].p)
         annotation (Line(points={{-20,38},{-12,38},{-12,52},{-36,52},{-36,70},{-30,70}},
           color={0,0,255}));
       connect(loadwStepDown[j].n, aCConverter[1].pin_n)
         annotation (Line(points={{40,40},{60,40},{60,20},{10,20},{10,22},{-20,22}},
           color={0,0,255}));
       connect(resistor11[j].n, PoE_cable[j].p)
    annotation (Line(points={{-10,70},{0,70}}, color={0,0,255}));
       connect(PoE_cable[j].n, loadwStepDown[j].p) annotation (Line(points={{20,70},{30,70},{30,60},{14,60},{14,44},{24,44}}, color={0,0,255}));
     end for;
    end if;
  connect(aCConverter[i].hPin_N, ground.pin)
    annotation (Line(points={{-40,22},{-46,22},{-46,-15},{-46.25,-15}},
      color={117,80,123}));
  connect(aCConverter[i].pin_n, ground1.p)
    annotation (Line(points={{-20,22},{10,22},{10,-20}}, color={0,0,255}));
  connect(nEC_CableModel.pin_n,aCConverter[i].hPin_P) annotation(Line(points = {{-50,50},{-45,50},{-45,38},{-40,38}},color = {117,80,123}));
  end for;
    connect(fixedVoltage_VariablePower.n,ground2.p) annotation(Line(points = {{-138.5,95.25},{-138.5,85.25},{-152.5,85.25},{-152.5,75.25}},color = {0,0,255}));
    connect(pv_schedule.y[1],fixedVoltage_VariablePower.p_out) annotation(Line(points = {{-169.5,131.25},{-158,131.25},{-158,105.25},{-146.5,105.25}},color = {0,0,127}));
    connect(fixedVoltage_VariablePower.p,loadwStepDown2.p) annotation(Line(points = {{-138.5,115.25},{-138.5,146},{-122,146}},color = {0,0,255}));
    connect(fixedVoltage_VariablePower.n,loadwStepDown2.n) annotation(Line(points = {{-138.5,95.25},{-138.5,89.25},{-96,89.25},{-96,146},{-102,146}},color = {0,0,255}));
    connect(fixedVoltage_VariablePower.p,aCDC_1pInverterSimple.pin_p) annotation(Line(points = {{-138.5,115.25},{-138.5,121.25},{-98,121.25},{-98,116},{-92,116}},color = {0,0,255}));
    connect(fixedVoltage_VariablePower.n,aCDC_1pInverterSimple.pin_n) annotation(Line(points = {{-138.5,95.25},{-138.5,89.25},{-98,89.25},{-98,100},{-92,100}},color = {0,0,255}));
    connect(v.pin_n,ground.pin) annotation(Line(points = {{-144,5.021222061269839},{-144,-3.9893889693650806},{-46.25,-3.9893889693650806},{-46.25,-15}},color = {117,80,123}));
    connect(gain.y,realToComplex.im) annotation(Line(points = {{-32.566666666666656,155.83333333333334},{-32.566666666666656,151.83333333333334},{-22.666666666666657,151.83333333333334}},color = {0,0,127}));
    connect(gain.u,realToComplex.re) annotation(Line(points = {{-46.36666666666666,155.83333333333334},{-46.36666666666666,175.83333333333334},{-27.666666666666657,175.83333333333334},{-27.666666666666657,157.83333333333334},{-22.666666666666657,157.83333333333334}},color = {0,0,127}));
    connect(ac_schedule.y[1],gain.u) annotation(Line(points = {{-59.16666666666666,157.33333333333334},{-53.01666666666666,157.33333333333334},{-53.01666666666666,155.83333333333334},{-46.36666666666666,155.83333333333334}},color = {0,0,127}));
    connect(realToComplex.y,aC_LoadIdeal1P.S_input) annotation(Line(points = {{-11.166666666666664,154.83333333333334},{-5.166666666666664,154.83333333333334},{-5.166666666666664,150},{-25.8,150},{-25.8,139}},color = {160,160,164}));
    connect(aCDC_1pInverterSimple.hPin_L,v.pin_p) annotation(Line(points = {{-72,116},{-66,116},{-66,56.97877793873015},{-144,56.97877793873015},{-144,50.97877793873016}},color = {92,53,102}));
    connect(aCDC_1pInverterSimple.hPin_N,v.pin_n) annotation(Line(points = {{-72,100},{-66,100},{-66,-0.9787779387301612},{-144,-0.9787779387301612},{-144,5.021222061269839}},color = {117,80,123}));
    connect(nEC_CableModel.pin_p,v.pin_p) annotation(Line(points = {{-68,52},{-74,52},{-74,56.97877793873016},{-144,56.97877793873016},{-144,50.97877793873016}},color = {92,53,102}));
    connect(aC_LoadIdeal1P.hPin_L,v.pin_p) annotation(Line(points = {{-36,134},{-144,134},{-144,50.97877793873016}},color = {92,53,102}));
    connect(aC_LoadIdeal1P.hPin_N,v.pin_n) annotation(Line(points = {{-16,134},{-10,134},{-10,-0.9787779387301612},{-144,-0.9787779387301612},{-144,5.021222061269839}},color = {117,80,123}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent={{-100,-100},
            {100,100}}),                                                                                   graphics={                                                                                                                            Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString
            =                                                                                                                                                                                                        "%name")}),
      Diagram(coordinateSystem(extent={{-160,-100},{160,100}})));
end PAE_AC_1;
