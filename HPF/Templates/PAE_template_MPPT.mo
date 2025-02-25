within HPF.Templates;

model PAE_template_MPPT
  //parameter Integer nStepDown=modelData.nConverter;
  inner parameter Real PF = 0.95;
  inner parameter Real PF1 = tan(acos(PF));
  parameter Real Vs = 277;
  parameter Real kp = 3;
  parameter Real ks = 1;
  parameter Real km = 3;
  parameter Integer nConverter = modelData.nConverter;
  replaceable .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple aCConverter[modelData.nConverter](
    VDC_nom=modelData.aCConverter.V_Rect,
    P_nom=modelData.aCConverter.nomP,
    VAC_nom=modelData.aCConverter.nomV,
    vAngle=modelData.aCConverter.vAngle,
    P_stby=modelData.aCConverter.P_stby,
    P_DCmin=modelData.aCConverter.P_DCmin,
    alpha = modelData.aCConverter.alpha,
    beta = modelData.aCConverter.beta,
    gamma = modelData.aCConverter.gamma) constrainedby
    .HPF.PowerConverters.SinglePhase.ACDC_1pConverterBase
    annotation (Placement(transformation(extent={{-40.0,20.0},{-20.0,40.0}},rotation = 0.0,origin = {0.0,0.0})));
  .HPF.SinglePhase.Components.Ground ground
    annotation(Placement(visible = true,
      transformation(extent={{-56.25,-35.0},{-36.25,-15.0}},rotation = 0.0,origin = {0.0,0.0})));
  replaceable parameter .HPF.Templates.Data.Examples.PAE_DC_disaggregate modelData(loadwStepDown2(redeclare HPF.Data.ConverterModels.DC2DC_StepDown.Laptop_18V_90W_LapChrg4 stepDownData))
    annotation (Placement(transformation(extent={{60.0,60.0},{80.0,80.0}},rotation = 0.0,origin = {0.0,0.0})));

  .HPF.DC.Ground ground1
    annotation (Placement(transformation(extent={{0.0,-40.0},{20.0,-20.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Electrical.Analog.Basic.Resistor resistor11[modelData.nStepDown](
    R=modelData.R)
    annotation (Placement(visible=true,
      transformation(origin={0.0,0.0}, extent={{-30.0,80.0},{-10.0,60.0}},rotation = 0.0)));
  .HPF.Cables.NEC_CableModelDC PoE_cable[modelData.nStepDown](
    wireGaugeDC=modelData.wireGaugeDC,
    length=modelData.length)
    annotation (Placement(visible=true,
      transformation(
      origin={0.0,0.0},
      extent={{0.0,60.0},{20.0,80.0}},rotation = 0.0)));

  inner .HPF.SystemDef systemDef(fs=10e3, hrms={i for i in 1:2:2})
    annotation (Placement(visible = true,
      transformation(extent={{114.0,164.0},{142.0,188.0}},rotation = 0.0,origin = {0.0,0.0})));
    .HPF.Cables.NEC_CableModel nEC_CableModel(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12,length = 60) annotation(Placement(transformation(extent = {{-68.0,42.0},{-48.0,62.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{-162.5,55.25},{-142.5,75.25}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable pv_schedule(tableOnFile = true,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/PV_schedule_kW.txt"),tableName = "pv_schedule") annotation(Placement(transformation(extent = {{-226.0,92.0},{-206.0,112.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown loadwStepDown[modelData.nStepDown](redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=modelData.loadwStepDown) annotation(Placement(transformation(extent = {{26.0,34.0},{46.0,54.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown loadwStepDown2[modelData.nStepDown](redeclare replaceable .HPF.DC.DC2DC_Converters.StepDown dcdc_Converter, modelData=modelData.loadwStepDown2) annotation(Placement(transformation(extent = {{-104.0,154.0},{-124.0,174.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.ACload aCload(ac_schedule(tableName = "schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/80_schedule.txt"),timeScale = 1),gain(k = 1),aC_LoadIdealWye(P_nom = 100,V_nom = 277)) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {-84.0,-30.0},rotation = 90.0)));
    .HPF.SinglePhase.Components.Ground GndAC annotation(Placement(HideResult = true,visible = true,transformation(origin = {0.0,0.0},extent = {{-227.33333333333334,-21.333333333333343},{-211.33333333333334,-5.333333333333343}},rotation = 0.0)));
    .HPF.Sources.ThreePhase.VoltageSource voltageSource2(vMag_phC = {Vs},vMag_phB = {Vs},vMag_phA = {Vs},vArg_phC = {2.0944},vArg_phB = {-2.0944},vArg_phA = {0}) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-208.0,20.0},{-188.0,40.0}},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC[modelData.nStepDown](length = {1,1,1,1}) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {-90.0,188.0},rotation = -180.0)));
    .HPF.PowerConverters.ThreePhase.ACDC_3pBidirectionalSimple aCDC_3pInverterSimple(P_nom = 500,VDC_nom = 380,alpha_ACDC = 0.005005845604323433,gamma_ACDC = 0.03548539119679481,beta_ACDC = 0.008198182154825016,alpha_DCAC = 0.005005845604323433,beta_DCAC = 0.008198182154825016,gamma_DCAC = 0.03548539119679481) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {-72.0,86.0},rotation = 90.0)));
    .Modelica.Blocks.Math.Gain gain(k = 0.9) annotation(Placement(transformation(extent = {{-192.0,94.0},{-172.0,114.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.DC2DC_Converters.DC_DC_MPPT dC_DC_MPPT(P_nom = 600,alpha = 0.0020092200483991,gamma = 0.009638060870923188,beta = 0.01240931938461472,VDC_nom = 380) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {-122.0,110.0},rotation = -90.0)));
    .Modelica.Electrical.Analog.Basic.Resistor resistor(R = 0) annotation(Placement(transformation(extent = {{-62.0,148.0},{-42.0,168.0}},origin = {0.0,0.0},rotation = 0.0)));

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
       connect(loadwStepDown2[j].p,nEC_CableModelDC[j].n) annotation(Line(points = {{-122,146},{-128,146},{-128,112},{-120,112}},color = {0,0,255}));
       connect(loadwStepDown2[j].n,aCDC_3pInverterSimple.pin_n) annotation(Line(points = {{-102,146},{-94,146},{-94,96},{-86,96}},color = {0,0,255}));
        connect(resistor.n,nEC_CableModelDC[j].p) annotation(Line(points = {{-46,164},{-40,164},{-40,190},{-76,190}},color = {0,0,255}));

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
       connect(loadwStepDown2[j].p,nEC_CableModelDC[j].n) annotation(Line(points = {{-122,146},{-128,146},{-128,112},{-120,112}},color = {0,0,255}));
       connect(loadwStepDown2[j].n,aCDC_3pInverterSimple.pin_n) annotation(Line(points = {{-102,146},{-94,146},{-94,96},{-86,96}},color = {0,0,255}));
    connect(resistor.n,nEC_CableModelDC[j].p) annotation(Line(points = {{-46,164},{-40,164},{-40,190},{-76,190}},color = {0,0,255}));
     end for;
    end if;
  connect(aCConverter[i].hPin_N, ground.pin)
    annotation (Line(points={{-40,22},{-46,22},{-46,-15},{-46.25,-15}},
      color={117,80,123}));
  connect(aCConverter[i].pin_n, ground1.p)
    annotation (Line(points={{-20,22},{10,22},{10,-20}}, color={0,0,255}));
  connect(nEC_CableModel.pin_n,aCConverter[i].hPin_L) annotation(Line(points = {{-50,50},{-45,50},{-45,38},{-40,38}},color = {117,80,123}));
  end for;
    connect(voltageSource2.pinN,GndAC.pin) annotation(Line(points = {{-198,17.25},{-198,-5.333333333333343},{-219.33333333333334,-5.333333333333343}},color = {117,80,123}));
    connect(loadwStepDown2[1].n,ground2.p) annotation(Line(points = {{-124,164},{-152.5,164},{-152.5,75.25}},color = {0,0,255}));

    connect(voltageSource2.pinP_phA,aCDC_3pInverterSimple.hPin_A) annotation(Line(points = {{-185.5,40},{-185.5,56},{-80,56},{-80,76}},color = {92,53,102}));
    connect(voltageSource2.pinP_phB,aCDC_3pInverterSimple.hPin_B) annotation(Line(points = {{-185.5,30},{-75,30},{-75,76}},color = {92,53,102}));
    connect(voltageSource2.pinP_phC,aCDC_3pInverterSimple.hPin_C) annotation(Line(points = {{-185.5,20},{-185.5,14},{-70,14},{-70,76}},color = {92,53,102}));
    connect(voltageSource2.pinP_phA,aCload.hPin_A) annotation(Line(points = {{-185.5,40},{-185.5,46},{-85.6,46},{-85.6,-14.6}},color = {92,53,102}));
    connect(voltageSource2.pinP_phB,aCload.hPin_B) annotation(Line(points = {{-185.5,30},{-83.6,30},{-83.6,-14.599999999999998}},color = {92,53,102}));
    connect(voltageSource2.pinP_phC,aCload.hPin_C) annotation(Line(points = {{-185.5,20},{-185.5,2.7},{-81.6,2.7},{-81.6,-14.6}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_N,voltageSource2.pinN) annotation(Line(points = {{-64,76},{-64,11.25},{-198,11.25},{-198,17.25}},color = {117,80,123}));
    connect(aCload.hPin_N,GndAC.pin) annotation(Line(points = {{-79,-14.6},{-73,-14.6},{-73,0.6666666666666572},{-219.33333333333334,0.6666666666666572},{-219.33333333333334,-5.333333333333343}},color = {117,80,123}));
    connect(pv_schedule.y[1],gain.u) annotation(Line(points = {{-205,102},{-194,102},{-194,104}},color = {0,0,127}));
    connect(voltageSource2.pinP_phA,nEC_CableModel.pin_p) annotation(Line(points = {{-185.5,40},{-185.5,52},{-68,52}},color = {92,53,102}));
    connect(gain.y,dC_DC_MPPT.P_pv) annotation(Line(points = {{-171,104},{-154.5,104},{-154.5,117.6},{-130,117.6}},color = {0,0,127}));
    connect(dC_DC_MPPT.p,aCDC_3pInverterSimple.pin_p) annotation(Line(points = {{-122,120},{-80,120},{-80,96}},color = {0,0,255}));
    connect(dC_DC_MPPT.n,aCDC_3pInverterSimple.pin_n) annotation(Line(points = {{-122,100},{-122,90},{-100,90},{-100,104},{-64,104},{-64,96}},color = {0,0,255}));
    connect(dC_DC_MPPT.n,ground2.p) annotation(Line(points = {{-122,100},{-122,85.625},{-152.5,85.625},{-152.5,75.25}},color = {0,0,255}));
    connect(aCDC_3pInverterSimple.pin_p,resistor.p) annotation(Line(points = {{-80,96},{-80,158},{-62,158}},color = {0,0,255}));

    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent={{-100,-100},
            {100,100}}),                                                                                   graphics={                                                                                                                            Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString
            =                                                                                                                                                                                                        "%name")}),
      Diagram(coordinateSystem(extent={{-160,-100},{160,100}})));
end PAE_template_MPPT;
