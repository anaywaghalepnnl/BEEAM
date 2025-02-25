within HPF.Templates.Data.Examples;

record PAE
  extends .HPF.Templates.Data.ACConverterwLoads(
      nConverter=1,
      stepDown_indices={1},
      R={0},
      wireGaugeDC={.HPF.Types.WireGaugeDC.guage_POE_Patch},
      length={0},
      loadwStepDown={.HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load1"},
          stepDownName="stepDown1",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50),
          R={0},
          tableName={"schedule"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/40_schedule.txt")})
         },
      loadwStepDown2={.HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load2"},
          stepDownName="stepDown2",
          stepDownData=.HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50),
          R={0},
          tableName={"zero_schedule"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/zero_schedule.txt")})
         },
      aCConverter={.HPF.Templates.Data.ACConverter(name="converter1",
          V_Rect=45,
          nomP=50,
          nomV=277,
          vAngle=0,
          P_stby=0,
          P_DCmin=0.0,
          alpha=0.010058, beta=0.008198182154825016, gamma=0.03548539119679481)});
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PAE;
