within HPF.Templates;

model ACload
    .HPF.SinglePhase.Interface.HPin_P hPin_A annotation(Placement(transformation(extent = {{149.3623351800197,11.362335180019691},{158.6376648199803,20.63766481998031}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Interface.HPin_P hPin_B annotation(Placement(transformation(extent = {{149.3644870635269,-8.635512936473072},{158.6355129364731,0.6355129364730718}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Interface.HPin_P hPin_C annotation(Placement(transformation(extent = {{148.82354836165376,-29.17645163834619},{159.17645163834624,-18.82354836165381}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Interface.HPin_N hPin_N annotation(Placement(transformation(extent = {{148.37327421138465,-55.62672578861538},{159.62672578861535,-44.37327421138462}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable ac_schedule(tableOnFile = true,timeScale = 1) annotation(Placement(transformation(extent = {{-60.0,-22.0},{-40.0,-2.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.ComplexBlocks.ComplexMath.RealToComplex realToComplex annotation(Placement(transformation(extent = {{35.5,-18.0},{45.5,-8.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Math.Gain gain(k = 0.95) annotation(HideResult = true,Placement(transformation(extent = {{12.0,-18.0},{24.0,-6.0}},rotation = 0.0,origin = {0.0,0.0})));
    .HPF.Loads.ThreePhase.AC_LoadIdealWye aC_LoadIdealWye(V_nom = 120,P_nom = 100) annotation(Placement(transformation(extent = {{77.0,-22.5},{57.0,-2.5}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain loadgain(k = 1) annotation(Placement(transformation(extent = {{-26,-22},{-6,-2}},origin = {0,0},rotation = 0)));
equation
    connect(gain.y,realToComplex.im) annotation(Line(points = {{24.6,-12},{24.6,-16},{34.5,-16}},color = {0,0,127}));
    connect(gain.u,realToComplex.re) annotation(Line(points = {{10.8,-12},{10.8,8},{29.5,8},{29.5,-10},{34.5,-10}},color = {0,0,127}));
    connect(realToComplex.y,aC_LoadIdealWye.S_input) annotation(Line(points = {{46,-13},{51.5,-13},{51.5,-12.5},{57,-12.5}},color = {160,160,164}));
    connect(aC_LoadIdealWye.hPin_A,hPin_A) annotation(Line(points = {{77,-4.5},{115.5,-4.5},{115.5,16},{154,16}},color = {92,53,102}));
    connect(aC_LoadIdealWye.hPin_B,hPin_B) annotation(Line(points = {{77,-9.5},{115.5,-9.5},{115.5,-4},{154,-4}},color = {92,53,102}));
    connect(aC_LoadIdealWye.hPin_C,hPin_C) annotation(Line(points = {{77,-14.5},{115.5,-14.5},{115.5,-24},{154,-24}},color = {92,53,102}));
    connect(aC_LoadIdealWye.hPin_N,hPin_N) annotation(Line(points = {{77,-20.5},{115.5,-20.5},{115.5,-50},{154,-50}},color = {117,80,123}));
    connect(ac_schedule.y[1],loadgain.u) annotation(Line(points = {{-39,-12},{-28,-12}},color = {0,0,127}));
    connect(loadgain.y,gain.u) annotation(Line(points = {{-5,-12},{10.8,-12}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(
      preserveAspectRatio = false,
      extent = {{-100.0,-100.0},{100.0,100.0}}),
      graphics={Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-83,-74},{83,74}},origin={72,-20}),Text(lineColor={0,0,255},extent={{-150,-100},{150,-140}},textString="%name",origin={72,2})}));
end ACload;
