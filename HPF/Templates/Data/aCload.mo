within HPF.Templates.Data;

record aCload
  extends .Modelica.Icons.Record;

  parameter Modelica.Units.SI.Voltage V_nom=1 "Nominal voltage";
  parameter Modelica.Units.SI.Power P_nom=50 "Rated nominal power";
  parameter String name="";
  parameter String fileName="";
  parameter String tableName="";
  parameter Real gain=1;

end aCload;
