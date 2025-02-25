within HPF.DC.DC2DC_Converters;
model DummyShort
    extends HPF.DC.DC2DC_Converters.Interface;
equation
    connect(p1,p2) annotation(Line(points = {{-100,100},{0,100},{0,100},{100,100}},color = {0,0,255}));
    connect(n1,n2) annotation(Line(points = {{-100,-100},{0,-100},{0,-100},{100,-100}},color = {0,0,255}));
    PLoss=0;
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics={  Rectangle(lineColor={0,0,0},fillColor={230,230,230},
            fillPattern =                                                                                                                                                              FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString=
                                                                                                                                                                                                        "%name")}));
end DummyShort;
