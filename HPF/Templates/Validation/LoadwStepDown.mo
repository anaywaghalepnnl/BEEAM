within HPF.Templates.Validation;
model LoadwStepDown
    extends Modelica.Icons.Example;
    .HPF.Templates.LoadwStepDown loadwStepDown(modelData=loadwStepDown2,dcdc_Converter(i2(fixed = false),n2(i(start = 0.1, fixed=true))),schedule(timeScale = {900})) annotation(Placement(transformation(extent = {{70.0,-10.0},{90.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.Data.LoadwStepDown loadwStepDown2(
          nLoad=1,
          loadNames={"load1"},
          stepDownName="stepDown1",
          stepDownData=HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=6360),
          Pnom={0},
          R={0},
          tableName={"L1-Core-Lights"},
          fileName={ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/San-Diego-L1_Light_LP.txt")})
        annotation(Placement(transformation(extent = {{-4.0,52.0},{16.0,72.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.DC.FixedVoltage_VariablePower fixedVoltage_VariablePower(v_out = 60) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {16.0,0.0},rotation = -180.0)));
    .Modelica.Blocks.Sources.Constant const(k = 10000) annotation(Placement(transformation(extent = {{-36,-28},{-16,-8}},origin = {0,0},rotation = 0)));
    .HPF.DC.Ground ground annotation(Placement(transformation(extent = {{74,-58},{94,-38}},origin = {0,0},rotation = 0)));
equation
    connect(fixedVoltage_VariablePower.p,loadwStepDown.p) annotation(Line(points = {{26,1.2246467991473533e-15},{48,1.2246467991473533e-15},{48,0},{70,0}},color = {0,0,255}));
    connect(fixedVoltage_VariablePower.n,loadwStepDown.n) annotation(Line(points = {{6,-1.2246467991473533e-15},{0,-1.2246467991473533e-15},{0,16},{96,16},{96,0},{90,0}},color = {0,0,255}));
    connect(ground.p,fixedVoltage_VariablePower.n) annotation(Line(points = {{84,-38},{84,-32},{0,-32},{0,-1.2246467991473533e-15},{6,-1.2246467991473533e-15}},color = {0,0,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end LoadwStepDown;
