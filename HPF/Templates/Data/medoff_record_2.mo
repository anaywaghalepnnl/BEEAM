within HPF.Templates.Data;

record medoff_record_2
  extends .Modelica.Icons.Record;
//   parameter Integer nconverter[6]={1,1,1,1,1,1};
//   parameter Integer stepDown_indices[6,1]={{1},{1},{1},{1},{1},{1}};
//   parameter Integer nStepDown[6]={sum(stepDown_indices[1]),sum(stepDown_indices[2]),sum(stepDown_indices[3]),sum(stepDown_indices[4]),sum(stepDown_indices[5]),sum(stepDown_indices[6])};
  //parameter Modelica.Units.SI.Resistance R[nStepDown]=fill(1,nStepDown)
   // "Resistance at temperature T_ref";
  //parameter Types.WireGaugeDC dccable_lumA[nStepDown_lumA]=fill(HPF.Types.WireGaugeDC.gauge_POE,nStepDown);
  //parameter Real length[nStepDown]=fill(4,nStepDown) "Length of wire";
  
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


  parameter .HPF.Templates.Data.LoadwStepDown lum_phaseA[nStepDown_lumA]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter .HPF.Templates.Data.LoadwStepDown lum_phaseB[nStepDown_lumB]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter .HPF.Templates.Data.LoadwStepDown lum_phaseC[nStepDown_lumC]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter .HPF.Templates.Data.LoadwStepDown mel_phaseA[nStepDown_melA]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter .HPF.Templates.Data.LoadwStepDown mel_phaseB[nStepDown_melB]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter .HPF.Templates.Data.LoadwStepDown mel_phaseC[nStepDown_melC]
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  parameter .HPF.Templates.Data.ACConverter lumconv_phaseA[nconverter_lumA]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter .HPF.Templates.Data.ACConverter lumconv_phaseB[nconverter_lumB]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter .HPF.Templates.Data.ACConverter lumconv_phaseC[nconverter_lumC]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter .HPF.Templates.Data.ACConverter melconv_phaseA[nconverter_melA]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter .HPF.Templates.Data.ACConverter melconv_phaseB[nconverter_melB]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  parameter .HPF.Templates.Data.ACConverter melconv_phaseC[nconverter_melC]
    annotation (Placement(transformation(extent={{60,20},{80,40}})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));

end medoff_record_2;
