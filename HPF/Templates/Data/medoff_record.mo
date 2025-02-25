within HPF.Templates.Data;
record medoff_record
  extends .Modelica.Icons.Record;
  parameter Integer nconverter[6]={1,1,1,1,1,1};
  parameter Integer stepDown_indices[6,1]={{1},{1},{1},{1},{1},{1}};
  parameter Integer nStepDown[6]={sum(stepDown_indices[1]),sum(stepDown_indices[2]),sum(stepDown_indices[3]),sum(stepDown_indices[4]),sum(stepDown_indices[5]),sum(stepDown_indices[6])};
  //parameter Modelica.Units.SI.Resistance R[nStepDown]=fill(1,nStepDown)
   // "Resistance at temperature T_ref";
  //parameter Types.WireGaugeDC wireGaugeDC[nStepDown]=fill(HPF.Types.WireGaugeDC.gauge_POE,nStepDown);
 // parameter Real length[nStepDown]=fill(1,nStepDown) "Length of wire";
  parameter Integer nconverter_lumA = 1;
  parameter Integer stepDown_indices_lumA[nconverter_lumA] = {1};
  parameter Integer nStepDown_lumA=sum(stepDown_indices_lumA);
  
  parameter Integer nconverter_lumB = 1;
  parameter Integer stepDown_indices_lumB[nconverter_lumB] = {1};
  parameter Integer nStepDown_lumB=sum(stepDown_indices_lumB);

  parameter Integer nconverter_lumC = 1;
  parameter Integer stepDown_indices_lumC[nconverter_lumC] = {1};
  parameter Integer nStepDown_lumC=sum(stepDown_indices_lumC);

  parameter Integer nconverter_melA = 1;
  parameter Integer stepDown_indices_melA[nconverter_melA] = {1};
  parameter Integer nStepDown_melA=sum(stepDown_indices_melA);
  
  parameter Integer nconverter_melB = 1;
  parameter Integer stepDown_indices_melB[nconverter_melB] = {1};
  parameter Integer nStepDown_melB=sum(stepDown_indices_melB);

  parameter Integer nconverter_melC = 1;
  parameter Integer stepDown_indices_melC[nconverter_melC] = {1};
  parameter Integer nStepDown_melC=sum(stepDown_indices_melC);


  parameter LoadwStepDown lum_phaseA[stepDown_indices[1,1]]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter LoadwStepDown lum_phaseB[stepDown_indices[2,1]]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter LoadwStepDown lum_phaseC[stepDown_indices[3,1]]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter LoadwStepDown mel_phaseA[stepDown_indices[4,1]]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter LoadwStepDown mel_phaseB[stepDown_indices[5,1]]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter LoadwStepDown mel_phaseC[stepDown_indices[6,1]]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  parameter ACConverter lumconv_phaseA[nconverter[1]]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter ACConverter lumconv_phaseB[nconverter[2]]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter ACConverter lumconv_phaseC[nconverter[3]]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter ACConverter melconv_phaseA[nconverter[4]]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter ACConverter melconv_phaseB[nconverter[5]]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter ACConverter melconv_phaseC[nconverter[6]]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter Inverter Inverter;
  parameter aCload aCload;
  parameter PV PV;
  parameter MPPT MPPT;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));

end medoff_record;
