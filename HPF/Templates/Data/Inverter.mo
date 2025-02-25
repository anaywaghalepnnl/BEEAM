within HPF.Templates.Data;

record Inverter
  extends .Modelica.Icons.Record;

  parameter Modelica.Units.SI.Power P_nom=100 "Nominal power"
    annotation (Dialog(group="Device Ratings"));
  parameter Modelica.Units.SI.Voltage VAC_nom=277
    "Nominal AC operating voltage (line-neutral)"
    annotation (Dialog(group="Device Ratings"));
  parameter Modelica.Units.SI.Voltage VDC_nom=24 "Nominal DC operating voltage"
    annotation (Dialog(group="Device Ratings"));
  parameter String name="";
  parameter Real alpha = 0.0 "Loss model constant term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real beta =  0.1 "Loss model linear term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real gamma = 0.0 "Loss model quadratic term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
end Inverter;
