within HPF.Templates.Data.Examples;
record Design_for_DC_Distributed_DC
  extends HPF.Templates.Data.ACConverterwLoads(
      nConverter=1,
      stepDown_indices={4},
      loadwStepDown={HPF.Templates.Data.LoadwStepDown(
          loadNames={"load1"},
          stepDownName="stepDown1",
          stepDownData=HPF.Data.ConverterModels.DC2DC_StepDown.ModelData()),
          HPF.Templates.Data.LoadwStepDown(
          loadNames={"load2"},
          stepDownName="stepDown2",
          stepDownData=HPF.Data.ConverterModels.DC2DC_StepDown.ModelData()),
          HPF.Templates.Data.LoadwStepDown(
          loadNames={"load3"},
          stepDownName="stepDown3",
          stepDownData=HPF.Data.ConverterModels.DC2DC_StepDown.ModelData()),
          HPF.Templates.Data.LoadwStepDown(
          loadNames={"load4"},
          stepDownName="stepDown4",
          stepDownData=HPF.Data.ConverterModels.DC2DC_StepDown.ModelData())},
      aCConverter={HPF.Templates.Data.ACConverter(name="converter1"),
          HPF.Templates.Data.ACConverter(name="converter2"),
          HPF.Templates.Data.ACConverter(name="converter3"),
          HPF.Templates.Data.ACConverter(name="converter4")});
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Design_for_DC_Distributed_DC;
