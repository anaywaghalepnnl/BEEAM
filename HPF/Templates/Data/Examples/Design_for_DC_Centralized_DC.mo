within HPF.Templates.Data.Examples;

record Design_for_DC_Centralized_DC
  extends .HPF.Templates.Data.ACConverterwLoads(
      nConverter=1,
      stepDown_indices={4},
      R={0,0,0,0},
      wireGaugeDC={.HPF.Types.WireGaugeDC.guage_POE_VHC,
        .HPF.Types.WireGaugeDC.guage_POE_VHC,
        .HPF.Types.WireGaugeDC.guage_POE_VHC,
        .HPF.Types.WireGaugeDC.guage_POE_VHC},
      length={30,30,30,30},
      loadwStepDown={
        .HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load1"},
          stepDownName="stepDown1",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.Igor_PoE_Driver_53W(),
          R={0},
          tableName={"schedule"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/schedule.txt")}),
        .HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load2"},
          stepDownName="stepDown2",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.Igor_PoE_Driver_53W(),
          R={0},
          tableName={"schedule"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/schedule.txt")}),
        .HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load3"},
          stepDownName="stepDown3",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.Igor_PoE_Driver_53W(),
          R={0},
          tableName={"schedule"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/schedule.txt")}),
        .HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load4"},
          stepDownName="stepDown4",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.Igor_PoE_Driver_53W(),
          R={0},
          tableName={"schedule"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/schedule.txt")})},
       aCConverter={
          .HPF.Templates.Data.ACConverter(name="PoE Switch",
          modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/transition.mat",
          V_Rect=53,
          nomP=820,
          nomV=120,
          vAngle=0,
          P_stby=37,
          P_DCmin=1)});
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Design_for_DC_Centralized_DC;
