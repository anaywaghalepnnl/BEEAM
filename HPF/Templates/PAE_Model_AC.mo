within HPF.Templates;
model PAE_Model_AC
    extends .HPF.Templates.PAE_template(redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort interface,
    aCDC_3pInverterSimple(alpha = 0.001752083262136904,beta = 0.004968741312147945,gamma = 0.01073438174581216,P_nom = 600,VAC_nom = 660,VDC_nom = 277),redeclare replaceable .HPF.Templates.Data.Examples.PAE modelData,gain(k = 0.2),
    pv_schedule(tableOnFile = true,tableName = "pv_schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/PV_schedule_kW.txt"),timeScale = 1),
    aCload(ac_schedule(tableName = "schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/60_schedule.txt")),loadgain(k=1),gain(k = 1),aC_LoadIdealWye(P_nom = 100,V_nom = 277)));
end PAE_Model_AC;
