within HPF.Templates;
model ACConverterwLoads
  //   parameter Integer nStepDown=modelData.nStepDown;
  parameter Integer nConverter;

  replaceable HPF.Templates.LoadwStepDown loadwStepDown[modelData.nStepDown]
    annotation(Placement(transformation(extent={{20,30},{40,50}})));
  replaceable .HPF.SinglePhase.Interface.ACDC_ConverterBase aCDC_ConverterBase[modelData.nConverter](
    name=modelData.aCConverter.name,
    V_Rect=modelData.aCConverter.V_Rect,
    nomP=modelData.aCConverter.nomP,
    nomV=modelData.aCConverter.nomV,
    vAngle=modelData.aCConverter.vAngle,
    P_stby=modelData.aCConverter.P_stby,
    P_DCmin=modelData.aCConverter.P_DCmin) constrainedby
    HPF.SinglePhase.Interface.ACDC_ConverterBase
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  HPF.SinglePhase.Components.Ground ground
    annotation(Placement(visible = true,
      transformation(extent={{-56.25,-35},{-36.25,-15}})));
  replaceable parameter Data.ACConverterwLoads modelData
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  DC.Ground ground1
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor11[modelData.nStepDown](
    R=modelData.R)
    annotation (Placement(visible=true,
      transformation(origin={-20,70}, extent={{-10,10},{10,-10}})));
  Cables.NEC_CableModelDC PoE_cable[modelData.nStepDown](
    wireGaugeDC=modelData.wireGaugeDC,
    length=modelData.length)
    annotation (Placement(visible=true,
      transformation(
      origin={10,70},
      extent={{-10,-10},{10,10}})));

  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})
    annotation (Placement(visible = true,
      transformation(extent={{-152,68},{-124,92}})));

  Sources.ThreePhase.VoltageSource voltageSource(
    vArg_phA={0.52196,5.0309,3.137,5.1211,0.88185,0.5405,2.7381,3.3571,3.1032,1.0556,
        4.7534,0.08957,4.2676,4.1244,4.4068},
    vArg_phB={4.7098,2.6393,0.15983,3.0248,0.54992,2.8356,0.30425,1.6224,5.1955,
        4.6578,1.421,1.561,2.3545,1.471,0.6687},
    vArg_phC={2.616,0.41259,4.8314,0.56289,3.7924,4.8133,4.8348,-0.2768,0.88781,
        2.6372,4.1405,4.1314,0.31627,0.0998,2.1076},
    vMag_phA={281.6099,0.52895,0.47049,0.73987,0.12572,0.73742,0.42769,0.058304,
        0.29207,0.058748,0.015748,0.02911,0.017013,0.0086381,0.017564},
    vMag_phB={281.5887,0.66547,0.46821,1.1624,0.27892,0.72691,0.37598,0.030611,0.254,
        0.065578,0.021447,0.041925,0.013833,0.0068935,0.013253},
    vMag_phC={281.39,0.46521,0.075759,1.0168,0.39967,0.60233,0.28322,0.061309,0.27537,
        0.028665,0.0058585,0.053376,0.017543,0.0048111,0.010129})
    annotation(Placement(visible = true, transformation(origin={-144,38},
      extent = {{-10, -10}, {10, 10}})));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(
    Rc=15117.5,
    Rp=8.333,
    Rs=1.4404E-01,
    Xm=2.3311e+03,
    Xp=3.3002,
    Xs=0.6197)
    annotation (Placement(transformation(extent={{-98,28},{-78,48}})));
  SinglePhase.Components.Terminate terminate
    annotation(Placement(transformation(extent={{-80,0},{-60,20}})));
equation
  for i in 1:modelData.nConverter loop
    if i>1 then
     for j in (sum(modelData.stepDown_indices[1:(i-1)])+1):(sum(modelData.stepDown_indices[1:(i-1)])+modelData.stepDown_indices[i]) loop
       connect(aCDC_ConverterBase[i].pin_p, resistor11[j].p)
         annotation (Line(points={{-20,38},{-12,38},{-12,52},{-36,52},{-36,70},{-30,70}},
           color={0,0,255}));
       connect(loadwStepDown[j].n, aCDC_ConverterBase[i].pin_n)
         annotation (Line(points={{40,40},{60,40},{60,20},{10,20},{10,22},{-20,22}},
           color={0,0,255}));
     end for;
     else
     for j in 1:(modelData.stepDown_indices[1]) loop
       connect(aCDC_ConverterBase[1].pin_p, resistor11[j].p)
         annotation (Line(points={{-20,38},{-12,38},{-12,52},{-36,52},{-36,70},{-30,70}},
           color={0,0,255}));
       connect(loadwStepDown[j].n, aCDC_ConverterBase[1].pin_n)
         annotation (Line(points={{40,40},{60,40},{60,20},{10,20},{10,22},{-20,22}},
           color={0,0,255}));
     end for;
    end if;
    connect(deltaWye.pinSec_A, aCDC_ConverterBase[i].hPin_P)
      annotation (Line(points={{-78,50},{-46,50},{-46,38},{-40,38}},
        color={92,53,102}));
  connect(aCDC_ConverterBase[i].hPin_N, ground.pin)
    annotation (Line(points={{-40,22},{-46,22},{-46,-15},{-46.25,-15}},
      color={117,80,123}));
  connect(aCDC_ConverterBase[i].pin_n, ground1.p)
    annotation (Line(points={{-20,22},{10,22},{10,-20}}, color={0,0,255}));
  end for;
  connect(resistor11.n, PoE_cable.p)
    annotation (Line(points={{-10,70},{0,70}}, color={0,0,255}));
  connect(PoE_cable.n, loadwStepDown.p) annotation (Line(points={{20,70},{30,70},
          {30,60},{10,60},{10,40},{20,40}}, color={0,0,255}));

  connect(voltageSource.pinP_phC,deltaWye. pinPrim_C) annotation (
    Line(points={{-131.5,28},{-98,28}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phB,deltaWye. pinPrim_B) annotation (
    Line(points={{-131.5,38},{-98,38}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phA,deltaWye. pinPrim_A) annotation (
    Line(points={{-131.5,48},{-98,48}},      color = {92, 53, 102}));
  connect(deltaWye.pinSec_N, ground.pin) annotation (Line(points={{-78,26},{-46.25,
          26},{-46.25,-15}},        color={117,80,123}));
  connect(voltageSource.pinN, ground.pin) annotation (Line(points={{-144,25.25},
          {-144,-15},{-46.25,-15}},           color={117,80,123}));
  connect(deltaWye.pinSec_C, terminate.hPin_P) annotation (Line(points={{-78,34},
          {-74,34},{-74,8.57143},{-72.8571,8.57143}},   color={92,53,102}));
  connect(deltaWye.pinSec_B, terminate.hPin_P) annotation (Line(points={{-78,42},
          {-74,42},{-74,8.57143},{-72.8571,8.57143}},   color={92,53,102}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent={{-100,-100},
            {100,100}}),                                                                                   graphics={                                                                                                                            Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString
            =                                                                                                                                                                                                        "%name")}),
      Diagram(coordinateSystem(extent={{-160,-100},{160,100}})));
end ACConverterwLoads;
