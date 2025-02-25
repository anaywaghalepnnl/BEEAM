within HPF.Templates.Data;
record ACConverterwLoads
  extends Modelica.Icons.Record;
  parameter Integer nConverter=1;
  parameter Integer stepDown_indices[nConverter]={1};
  parameter Integer nStepDown=sum(stepDown_indices);
  parameter Modelica.Units.SI.Resistance R[nStepDown]=fill(1,nStepDown)
    "Resistance at temperature T_ref";
  parameter Types.WireGaugeDC wireGaugeDC[nStepDown]=fill(HPF.Types.WireGaugeDC.gauge_POE,nStepDown);
  parameter Real length[nStepDown]=fill(1,nStepDown) "Length of wire";

  parameter LoadwStepDown loadwStepDown[nStepDown]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  parameter ACConverter aCConverter[nConverter]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ACConverterwLoads;
