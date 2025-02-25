within HPF.DC.DC2DC_Converters;
partial model Interface
  extends Modelica.Electrical.Analog.Interfaces.TwoPort;
  // One can pass the name of the object, here the object is of the class (or record)
  // ModelData. The object name will have the appropriate fields.


  //parameter Data.ConverterModels.DC2DC_StepDown.ModelData modelData
  parameter Data.ConverterModels.DC2DC_StepDown.ModelData modelData
    annotation (Placement(transformation(extent={{60,72},{80,92}})));
  parameter String name="";
  Modelica.Blocks.Interfaces.RealOutput PLoss=abs(PPri) - abs(v2*i2)
    annotation (Placement(visible = true,
      transformation(origin={110,80},extent = {{-10, -10}, {10, 10}}),
      iconTransformation(origin = {0, 148},
        extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Units.SI.Power PPri
    "Primary power";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Interface;
