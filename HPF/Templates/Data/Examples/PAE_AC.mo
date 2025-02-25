within HPF.Templates.Data.Examples;
record PAE_AC
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
          stepDownData=HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50),
          R={0},
          tableName={"dc_schedule"},
          fileName={.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/DC_schedule_kW.txt")})
         },
      loadwStepDown2={.HPF.Templates.Data.LoadwStepDown(
          nLoad=1,
          loadNames={"load2"},
          stepDownName="stepDown2",
          stepDownData=HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50),
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
          alpha=0.01086013, beta=0.0104616, gamma=0.03206889)},
      Inverter=.HPF.Templates.Data.Inverter(
          name="inverter",
          P_nom=500,
          VAC_nom=277,
          VDC_nom=380,
          alpha=0.01086013, beta=0.0104616, gamma=0.03206889),
      aCload=.HPF.Templates.Data.aCload(
          name="ac load",
          fileName=.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/AC_schedule_kW.txt"),
          tableName="ac_schedule",
          V_nom=277,
          P_nom=100,
          gain=1),
      PV=.HPF.Templates.Data.PV(
          fileName=.ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/PV_schedule_kW.txt"),
          tableName="pv_schedule"),
      MPPT=.HPF.Templates.Data.MPPT(
          modelData = .HPF.Data.ConverterModels.DC2DC_StepDown.mppt));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PAE_AC;
