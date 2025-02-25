within HPF.Templates.Data;
record ACConverter
  extends Modelica.Icons.Record;

  parameter Modelica.Units.SI.Voltage V_Rect=1 "Rectifier DC output";
  parameter Modelica.Units.SI.Power nomP=50 "Rated nominal power";
  parameter Modelica.Units.SI.Voltage nomV=120 "Nominal AC operating voltage";
  parameter Modelica.Units.SI.Angle vAngle=0
    "Nominal voltage angle for solver init";
  parameter Modelica.Units.SI.Power P_stby=0 "Standby (no load) input AC power";
  parameter Modelica.Units.SI.Power P_DCmin=0.5
    "Minimum converter power (2-stage loss model)";
  parameter String name="";
  parameter String modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/demoModel.mat"
    "Rectifier harmonic model mat file";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ACConverter;
