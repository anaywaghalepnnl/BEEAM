within HPF.Templates.Data;
record LoadwStepDown
  extends Modelica.Icons.Record;
  //Configuration parameters
  parameter Integer nLoad=1;
  parameter String loadNames[nLoad]=fill("", nLoad);
  parameter String stepDownName="";

  //Resistance parameters
  parameter Modelica.Units.SI.Resistance R[nLoad]=fill(1, nLoad)
    "Resistance in series with load";

  //Step-down parameters
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.ModelData stepDownData
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  //Load parameters
  parameter String tableName[nLoad]=fill("schedule",  nLoad)
    "Table name on file or in function usertab (see docu)";
  parameter String fileName[nLoad]=fill(ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/schedule.txt"), nLoad)
    "File where matrix is stored";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LoadwStepDown;
