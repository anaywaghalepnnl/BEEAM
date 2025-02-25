within HPF.Templates;
model LoadwStepDown
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter HPF.Templates.Data.LoadwStepDown modelData
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  final parameter Integer nLoad = modelData.nLoad;
  replaceable .HPF.DC.DC2DC_Converters.Interface dcdc_Converter(final modelData = modelData.stepDownData,name = modelData.stepDownName)
                                            constrainedby
    HPF.DC.DC2DC_Converters.Interface
    annotation(Placement(transformation(
      extent = {{-50.0,-8.0},{-30.0,12.0}},
      origin = {0.0,0.0},rotation = 0.0)),
      choices(
      choice(redeclare replaceable HPF.DC.DC2DC_Converters.StepDown dcdc_Converter
        "DC step down"),
      choice(redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter
      "No step down")));
  HPF.DC.Variable_DC_Load onePort[nLoad](name=modelData.loadNames)
    annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},
      origin={60,0},      rotation = -90.0)));

  Modelica.Electrical.Analog.Basic.Resistor resistor11[nLoad](R=modelData.R)
    annotation (Placement(visible=true,
      transformation(origin={0,30}, extent={{-10,10},{10,-10}})));

  DC.Ground ground
    annotation (Placement(transformation(extent={{-24,-58},{-4,-38}})));
  Modelica.Blocks.Sources.CombiTimeTable schedule[nLoad](
    fileName=modelData.fileName,
    tableName=modelData.tableName,
    tableOnFile=fill(true, nLoad),timeScale = fill(3600,nLoad),smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments,extrapolation = fill(Modelica.Blocks.Types.Extrapolation.HoldLastPoint,nLoad))
    annotation (Placement(visible=true, transformation(
        origin={-50.0,70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=-90.0)));
    .Modelica.Blocks.Math.Gain gain[nLoad](k=modelData.Pnom) annotation(Placement(transformation(extent = {{8,42},{28,62}},origin = {0,0},rotation = 0)));

equation
    for i in 1:nLoad loop
    connect(dcdc_Converter.n2,onePort[i].n)
      annotation(Line(points={{-30,-8.66667},{-30,-14.6667},{60,-14.6667},{60,-10}},
        color = {0,0,255}));
    connect(dcdc_Converter.p2, resistor11[i].p)
      annotation (Line(points={{-30,11.3333},{-20,11.3333},{-20,30},{-10,30}},
        color={0,0,255}));
    end for;
    connect(p,dcdc_Converter.p1)
      annotation(Line(points={{-100,0},{-100,17.33},{-50,17.33},{-50,12}},color = {0,0,255}));
    connect(dcdc_Converter.n1,n)
      annotation(Line(points={{-50,-8},{-50,-24},{100,-24},{100,0}},
        color = {0,0,255}));
    connect(ground.p, dcdc_Converter.n2)
    annotation (Line(points={{-14,-38},{-22,-38},{-22,-8},{-30,-8}}, color={0,0,255}));
    connect(resistor11.n, onePort.p)
    annotation (Line(points={{10,30},{60,30},{60,10}}, color={0,0,255}));
    connect(schedule[1].y,gain.u) annotation(Line(points = {{-50,59},{-50,52},{6,52}},color = {0,0,127}));
    connect(gain.y,onePort.u) annotation(Line(points = {{29,52},{71,52},{71,-0.19999999999999896},{65,-0.19999999999999896}},color = {0,0,127}));
    
    annotation(Icon(coordinateSystem(
      preserveAspectRatio = false,
      extent = {{-100.0,-100.0},{100.0,100.0}}),
      graphics={  Rectangle(lineColor={0,0,0},fillColor={230,230,230},
      fillPattern = FillPattern.Solid,
      extent={{-100,-100},{100,100}}),        Text(lineColor={0,0,255},
      extent={{-150,-100},{150,-140}},
      textString = "%name")}));
end LoadwStepDown;
