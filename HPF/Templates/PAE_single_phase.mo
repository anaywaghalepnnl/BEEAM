within HPF.Templates;
        model PAE_single_phase
            extends .HPF.Templates.PAE_AC_1(
    redeclare HPF.PowerConverters.SinglePhase.ACDC_EmpMdl aCConverter(modelFileName=modelData.aCConverter.modelFileName),
    ac_schedule(tableName="ac_schedule", fileName=ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/AC_schedule_kW.txt")),
    pv_schedule(fileName=ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/zero_schedule.txt"),tableName = "zero_schedule"),redeclare replaceable .HPF.Templates.Data.Examples.PAE_AC modelData,v(vMag = {277}),redeclare replaceable .HPF.PowerConverters.SinglePhase.ACDC_1pBidirectionalSimple aCDC_1pInverterSimple);
        end PAE_single_phase;
