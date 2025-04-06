within HPF.Templates;

model LoadwStepDown_woCTT
  extends .Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter .HPF.Templates.Data.LoadwStepDown modelData
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  final parameter Integer nLoad = modelData.nLoad;
  replaceable .HPF.DC.DC2DC_Converters.Interface dcdc_Converter
  constrainedby
    .HPF.DC.DC2DC_Converters.Interface(final modelData = modelData.stepDownData,name = modelData.stepDownName)
    annotation(Placement(transformation(
      extent = {{-50.0,-8.0},{-30.0,12.0}},
      origin = {0.0,0.0},rotation = 0.0)),
      choices(
      choice(redeclare replaceable .HPF.DC.DC2DC_Converters.StepDown dcdc_Converter
        "DC step down"),
      choice(redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter
      "No step down")));
  .HPF.DC.Variable_DC_Load onePort[nLoad](name=modelData.loadNames)
    annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},
      origin={60,0},      rotation = -90.0)));

  .Modelica.Electrical.Analog.Basic.Resistor resistor11[nLoad](R=modelData.R)
    annotation (Placement(visible=true,
      transformation(origin={0,30}, extent={{-10,10},{10,-10}})));

  .HPF.DC.Ground ground
    annotation (Placement(transformation(extent={{-24,-58},{-4,-38}})));
    .Modelica.Blocks.Math.Gain gain[nLoad](k=modelData.Pnom) annotation(Placement(transformation(extent = {{8,42},{28,62}},origin = {0,0},rotation = 0)));
    replaceable .Modelon.Blocks.Routing.Throughput sISO constrainedby .Modelica.Blocks.Interfaces.SISO annotation(Placement(transformation(extent = {{-72,46},{-52,66}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-102.98075228121914,59.01924771878085},{-85.01924771878086,76.98075228121914}},origin = {0.0,0.0},rotation = 0.0)));

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
    connect(gain.y,onePort.u) annotation(Line(points = {{29,52},{71,52},{71,-0.19999999999999896},{65,-0.19999999999999896}},color = {0,0,127}));
    connect(sISO.y,gain[1].u) annotation(Line(points = {{-51,56},{-22.5,56},{-22.5,52},{6,52}},color = {0,0,127}));
    connect(u,sISO.u) annotation(Line(points = {{-94,68},{-84,68},{-84,56},{-74,56}},color = {0,0,127}));
    
    annotation(Icon(coordinateSystem(
      preserveAspectRatio = false,
      extent = {{-100.0,-100.0},{100.0,100.0}}),
      graphics={  Rectangle(lineColor={0,0,0},fillColor={230,230,230},
      fillPattern = FillPattern.Solid,
      extent={{-100,-100},{100,100}}),        Text(lineColor={0,0,255},
      extent={{-150,-100},{150,-140}},
      textString = "%name")}));
end LoadwStepDown_woCTT;
