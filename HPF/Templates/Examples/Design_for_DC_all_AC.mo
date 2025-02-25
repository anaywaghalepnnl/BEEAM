within HPF.Templates.Examples;
model Design_for_DC_all_AC
  extends Modelica.Icons.Example;
  extends HPF.Templates.Examples.Trial.ACConverterwLoads(
    redeclare HPF.Templates.Data.Examples.Design_for_DC_all_AC modelData);
equation
  connect(resistor11.p, aCDC_ConverterBase.pin_p) annotation(
    Line(points = {{-30, 70}, {-20, 70}, {-20, 38}}, color = {0, 0, 255}, thickness = 0.5));
  connect(loadwStepDown.n, aCDC_ConverterBase.pin_n) annotation(
    Line(points = {{40, 40}, {-20, 40}, {-20, 22}}, color = {0, 0, 255}, thickness = 0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end Design_for_DC_all_AC;
