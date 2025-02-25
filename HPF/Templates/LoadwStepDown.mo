within HPF.Templates;
model LoadwStepDown
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  final parameter Integer nLoad = modelData.nLoad;
  replaceable HPF.DC.DC2DC_Converters.Interface dcdc_Converter(
    final modelData=modelData.stepDownData, name=modelData.stepDownName)
                                            constrainedby
    HPF.DC.DC2DC_Converters.Interface
    annotation(Placement(transformation(
      extent = {{-50.0,-8.666666666666666},{-30.0,11.333333333333334}},
      origin = {0.0,0.0},rotation = 0.0)),
      choices(
      choice(redeclare replaceable HPF.DC.DC2DC_Converters.StepDown dcdc_Converter
        "DC step down"),
      choice(redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter
      "No step down")));
  HPF.DC.Variable_DC_Load onePort[nLoad](name=modelData.loadNames)
    annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},
      origin={60,0},      rotation = -90.0)));
  parameter HPF.Templates.Data.LoadwStepDown modelData
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor11[nLoad](R=modelData.R)
    annotation (Placement(visible=true,
      transformation(origin={0,30}, extent={{-10,10},{10,-10}})));

  DC.Ground ground
    annotation (Placement(transformation(extent={{-24,-58},{-4,-38}})));
  Modelica.Blocks.Sources.CombiTimeTable schedule[nLoad](
    fileName=modelData.fileName,
    tableName=modelData.tableName,
    tableOnFile=fill(true, nLoad))
    annotation (Placement(visible=true, transformation(
        origin={-50,70},
        extent={{-10,-10},{10,10}},
        rotation=-90)));

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
      annotation(Line(points={{-100,0},{-100,17.33},{-50,17.33},{-50,11.3333}},color = {0,0,255}));
    connect(dcdc_Converter.n1,n)
      annotation(Line(points={{-50,-8.66667},{-50,-24},{100,-24},{100,0}},
        color = {0,0,255}));
  connect(ground.p, dcdc_Converter.n2)
    annotation (Line(points={{-14,-38},{-22,-38},
          {-22,-8.66667},{-30,-8.66667}}, color={0,0,255}));
  connect(schedule.y[1], onePort.u) annotation (Line(points={{-50,59},{-50,40},{
          76,40},{76,0},{65,0},{65,-0.2}}, color={0,0,127}));
  connect(resistor11.n, onePort.p)
    annotation (Line(points={{10,30},{60,30},{60,10}}, color={0,0,255}));
    annotation(Icon(coordinateSystem(
      preserveAspectRatio = false,
      extent = {{-100.0,-100.0},{100.0,100.0}}),
      graphics={  Rectangle(lineColor={0,0,0},fillColor={230,230,230},
      fillPattern = FillPattern.Solid,
      extent={{-100,-100},{100,100}}),        Text(lineColor={0,0,255},
      extent={{-150,-100},{150,-140}},
      textString = "%name")}));
end LoadwStepDown;
