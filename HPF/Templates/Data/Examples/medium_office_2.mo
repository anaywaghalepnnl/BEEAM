within HPF.Templates.Data.Examples;
record medium_office_2
    extends .HPF.Templates.Data.medoff_record_2(
      nconverter_lumA = 1,
      stepDown_indices_lumA={1},
      nStepDown_lumA=sum(stepDown_indices_lumA),
      nconverter_lumB= 1,
      stepDown_indices_lumB={1},
      nconverter_lumC = 1,
      stepDown_indices_lumC={1},
      nconverter_melA = 1,
      stepDown_indices_melA={1},
      nconverter_melB= 1,
      stepDown_indices_melB={1},
      nconverter_melC = 1,
      stepDown_indices_melC={1},
      
      lumconv_phaseA={.HPF.Templates.Data.ACConverter(name="converter1",
          V_Rect=45,
          nomP=50,
          nomV=277,
          vAngle=0,
          P_stby=0,
          P_DCmin=0.0,
          alpha=0.010058, beta=0.008198182154825016, gamma=0.03548539119679481)},
     lum_phaseA={.HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load1"},
          stepDownName="stepDown1",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50),
          Pnom={20},
          R={0},
          tableName={"L1-Core-Lights"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-L1_Light_LP.txt")})},


     lumconv_phaseB={.HPF.Templates.Data.ACConverter(name="converter1",
          V_Rect=45,
          nomP=50,
          nomV=277,
          vAngle=0,
          P_stby=0,
          P_DCmin=0.0,
          alpha=0.010058, beta=0.008198182154825016, gamma=0.03548539119679481)},
     lum_phaseB={.HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load1"},
          stepDownName="stepDown1",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50),
          Pnom={30},
          R={0},
          tableName={"L1-Core-Lights"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-L1_Light_LP.txt")})},


     lumconv_phaseC={.HPF.Templates.Data.ACConverter(name="converter1",
          V_Rect=45,
          nomP=50,
          nomV=277,
          vAngle=0,
          P_stby=0,
          P_DCmin=0.0,
          alpha=0.010058, beta=0.008198182154825016, gamma=0.03548539119679481)},
     lum_phaseC={.HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load1"},
          stepDownName="stepDown1",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50),
          Pnom={40},
          R={0},
          tableName={"L1-Core-Lights"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-L1_Light_LP.txt")})}
);
end medium_office_2;
