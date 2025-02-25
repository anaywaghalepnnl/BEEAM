within HPF.Templates;

model PAE_Model_DC
    extends .HPF.Templates.PAE_template(
    systemDef(hrms = {i for i in 1:2:2}),redeclare replaceable .HPF.Templates.Data.Examples.PAE_DC_disaggregate modelData,
    fixedVoltage_VariablePower(v_out = 380),
    nEC_CableModel(length = 0),
    redeclare replaceable .HPF.DC.DC2DC_Converters.StepDown interface(modelData(V = 380,alpha = 0,beta = 0.01240931938461472,gamma = 0.009638060870923188,Pnom = 600)),
    nEC_CableModelDC(length = 0),
    gain(k = 1),
    pv_schedule(tableOnFile = true,tableName = "pv_schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/PV_schedule_kW.txt")),
    aCDC_3pInverterSimple(P_nom = 500,VAC_nom = 277,VDC_nom = 380,gamma = 0.03548539119679481,beta = 0.008198182154825016,alpha = 0.01005845604323433),
    aCload(ac_schedule(tableName = "schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/80_schedule.txt")),gain(k = 1),aC_LoadIdealWye(P_nom = 100,V_nom = 277)), 
    loadwStepDown2(redeclare .HPF.DC.DC2DC_Converters.StepDown dcdc_Converter(modelData = .HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss(Pnom=50))),aCConverter(alpha = 0,beta = 0,gamma = 0));
    

end PAE_Model_DC;
