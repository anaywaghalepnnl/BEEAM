within HPF.Templates.Examples;
model medoff_template_1
    inner parameter Real PF = 0.95;
    inner parameter Real PF1 = tan(acos(PF));
    parameter Real Vs = 7200;
    parameter Real kp = 3;
    parameter Real ks = 1;
    parameter Real km = 3;
    parameter Real nconverter[6] = modelData.nconverter;
    
    .HPF.Templates.LoadwStepDown lum_phaseA[modelData.nStepDown[1]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.lum_phaseA) annotation(Placement(transformation(extent = {{129.2,10.0},{149.2,30.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.ThreePhase.VoltageSource voltageSource(
        vArg_phA={0},
        vArg_phB={-2.0944},
        vArg_phC={2.0944},
        vMag_phA={Vs},
        vMag_phB={Vs},
        vMag_phC={Vs}) annotation(Placement(transformation(extent = {{-78.0,-22.0},{-62.0,-6.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseA[modelData.nconverter[1]](VDC_nom=modelData.lumconv_phaseA.V_Rect,
    P_nom=modelData.lumconv_phaseA.nomP,
    VAC_nom=modelData.lumconv_phaseA.nomV,
    vAngle=modelData.lumconv_phaseA.vAngle,
    P_stby=modelData.lumconv_phaseA.P_stby,
    P_DCmin=modelData.lumconv_phaseA.P_DCmin,
    alpha = modelData.lumconv_phaseA.alpha,
    beta = modelData.lumconv_phaseA.beta,
    gamma = modelData.lumconv_phaseA.gamma) annotation(Placement(transformation(extent = {{63.19999999999999,6.0},{83.19999999999999,26.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC[modelData.nStepDown[1]] annotation(Placement(transformation(extent = {{93.19999999999999,18.0},{113.19999999999999,38.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.DC.FixedVoltage_VariablePower fixedVoltage_VariablePower annotation(Placement(transformation(extent = {{-10.0,10.0},{10.0,-10.0}},origin = {-68.0,-76.0},rotation = -90.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable annotation(Placement(transformation(extent = {{-106,-86},{-86,-66}},origin = {0,0},rotation = 0)));
    .HPF.PowerConverters.ThreePhase.ACDC_3pInverterSimple aCDC_3pInverterSimple annotation(Placement(transformation(extent = {{-28.0,-84.0},{-48.0,-64.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel2 annotation(Placement(transformation(extent = {{-21.042887840438844,-71.04288784043885},{-10.957112159561156,-60.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel3 annotation(Placement(transformation(extent = {{-21.042887840438844,-77.04288784043885},{-10.957112159561156,-66.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel4 annotation(Placement(transformation(extent = {{-21.042887840438844,-83.04288784043885},{-10.957112159561156,-72.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{-58.0,-58.0},{-42.0,-42.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{163.92422722805057,-30.07577277194942},{176.07577277194943,-17.92422722805058}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.ACload aCload annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {-12.0,60.0},rotation = 90.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseB[modelData.nconverter[2]](VDC_nom=modelData.lumconv_phaseB.V_Rect,
    P_nom=modelData.lumconv_phaseB.nomP,
    VAC_nom=modelData.lumconv_phaseB.nomV,
    vAngle=modelData.lumconv_phaseB.vAngle,
    P_stby=modelData.lumconv_phaseB.P_stby,
    P_DCmin=modelData.lumconv_phaseB.P_DCmin,
    alpha = modelData.lumconv_phaseB.alpha,
    beta = modelData.lumconv_phaseB.beta,
    gamma = modelData.lumconv_phaseB.gamma) annotation(Placement(transformation(extent = {{62.0,-33.25},{82.0,-13.25}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC2[modelData.nStepDown[2]] annotation(Placement(transformation(extent = {{92.0,-21.25},{112.0,-1.25}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown lum_phaseB[modelData.nStepDown[2]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.lum_phaseB) annotation(Placement(transformation(extent = {{128.0,-29.25},{148.0,-9.25}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel5[modelData.nconverter[2]](wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{34.0,-24.75},{54.0,-4.75}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseC[modelData.nconverter[3]](VDC_nom=modelData.lumconv_phaseC.V_Rect,
    P_nom=modelData.lumconv_phaseC.nomP,
    VAC_nom=modelData.lumconv_phaseC.nomV,
    vAngle=modelData.lumconv_phaseC.vAngle,
    P_stby=modelData.lumconv_phaseC.P_stby,
    P_DCmin=modelData.lumconv_phaseC.P_DCmin,
    alpha = modelData.lumconv_phaseC.alpha,
    beta = modelData.lumconv_phaseC.beta,
    gamma = modelData.lumconv_phaseC.gamma) annotation(Placement(transformation(extent = {{62.0,-68.0},{82.0,-48.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC3[modelData.nStepDown[3]] annotation(Placement(transformation(extent = {{92.0,-56.5},{112.0,-36.5}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown lum_phaseC[modelData.nStepDown[3]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.lum_phaseC) annotation(Placement(transformation(extent = {{128.0,-64.5},{148.0,-44.5}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel6[modelData.nconverter[3]](wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{32.0,-58.0},{52.0,-38.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground3 annotation(Placement(transformation(extent = {{44.0,-98.0},{60.0,-82.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground4 annotation(Placement(transformation(extent = {{-64,-120},{-44,-100}},origin = {0,0},rotation = 0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel7 annotation(Placement(transformation(extent = {{8.0,16.0},{28.0,36.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel8 annotation(Placement(transformation(extent = {{6.0,-24.75},{26.0,-4.75}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel9 annotation(Placement(transformation(extent = {{2.0,-58.75},{22.0,-38.75}},origin = {0.0,0.0},rotation = 0.0)));
    inner .HPF.SystemDef systemDef annotation(Placement(transformation(extent = {{-90,44},{-62,68}},origin = {0,0},rotation = 0)));
    .HPF.Templates.LoadwStepDown mel_phaseA[modelData.nStepDown[4]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.mel_phaseA) annotation(Placement(transformation(extent = {{239.3411764705882,113.11764705882354},{259.3411764705882,133.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseA[modelData.nconverter[4]](VDC_nom=modelData.melconv_phaseA.V_Rect,
    P_nom=modelData.melconv_phaseA.nomP,
    VAC_nom=modelData.melconv_phaseA.nomV,
    vAngle=modelData.melconv_phaseA.vAngle,
    P_stby=modelData.melconv_phaseA.P_stby,
    P_DCmin=modelData.melconv_phaseA.P_DCmin,
    alpha = modelData.melconv_phaseA.alpha,
    beta = modelData.lumconv_phaseA.beta,
    gamma = modelData.lumconv_phaseA.gamma) annotation(Placement(transformation(extent = {{173.3411764705882,109.11764705882354},{193.3411764705882,129.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC4[modelData.nStepDown[4]] annotation(Placement(transformation(extent = {{203.3411764705882,121.11764705882354},{223.3411764705882,141.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel10[modelData.nconverter[4]](wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{148.14117647058822,119.11764705882354},{168.14117647058822,139.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground5 annotation(Placement(transformation(extent = {{274.06540369863876,73.04187428687412},{286.2169492425377,85.19341983077295}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseB[modelData.nconverter[5]](VDC_nom=modelData.melconv_phaseB.V_Rect,
    P_nom=modelData.melconv_phaseB.nomP,
    VAC_nom=modelData.melconv_phaseB.nomV,
    vAngle=modelData.melconv_phaseB.vAngle,
    P_stby=modelData.melconv_phaseB.P_stby,
    P_DCmin=modelData.melconv_phaseB.P_DCmin,
    alpha = modelData.melconv_phaseB.alpha,
    beta = modelData.lumconv_phaseB.beta,
    gamma = modelData.lumconv_phaseB.gamma) annotation(Placement(transformation(extent = {{172.14117647058822,70.61764705882354},{192.14117647058822,90.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC5[modelData.nStepDown[5]] annotation(Placement(transformation(extent = {{202.14117647058822,82.61764705882354},{222.14117647058822,102.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown mel_phaseB[modelData.nStepDown[5]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.mel_phaseB) annotation(Placement(transformation(extent = {{238.14117647058822,74.61764705882354},{258.1411764705882,94.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel11[modelData.nconverter[5]](wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12)  annotation(Placement(transformation(extent = {{144.14117647058822,79.11764705882354},{164.14117647058822,99.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseC[modelData.nconverter[6]](VDC_nom=modelData.melconv_phaseC.V_Rect,
    P_nom=modelData.melconv_phaseC.nomP,
    VAC_nom=modelData.melconv_phaseC.nomV,
    vAngle=modelData.melconv_phaseC.vAngle,
    P_stby=modelData.melconv_phaseC.P_stby,
    P_DCmin=modelData.melconv_phaseC.P_DCmin,
    alpha = modelData.melconv_phaseC.alpha,
    beta = modelData.lumconv_phaseC.beta,
    gamma = modelData.lumconv_phaseC.gamma) annotation(Placement(transformation(extent = {{172.14117647058822,34.61764705882353},{192.14117647058822,54.61764705882353}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC6[modelData.nStepDown[6]] annotation(Placement(transformation(extent = {{202.14117647058822,46.61764705882353},{222.14117647058822,66.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.LoadwStepDown mel_phaseC[modelData.nStepDown[6]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.mel_phaseC) annotation(Placement(transformation(extent = {{238.14117647058822,38.61764705882353},{258.1411764705882,58.61764705882353}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel12[modelData.nconverter[6]](wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{142.14117647058822,45.11764705882353},{162.14117647058822,65.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel13 annotation(Placement(transformation(extent = {{118.14117647058822,119.11764705882354},{138.14117647058822,139.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel14 annotation(Placement(transformation(extent = {{116.14117647058823,79.11764705882354},{136.14117647058822,99.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel15 annotation(Placement(transformation(extent = {{112.14117647058823,45.11764705882353},{132.14117647058822,65.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground6 annotation(Placement(transformation(extent = {{82.0,34.0},{98.0,50.0}},origin = {0.0,0.0},rotation = 0.0)));
    replaceable parameter .HPF.Templates.Data.Examples.medium_office modelData annotation(Placement(transformation(extent = {{-86.0,74.0},{-66.0,94.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel[modelData.nconverter[1]](wireGaugeAC = HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{38.0,20.0},{58.0,40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground7 annotation(Placement(transformation(extent = {{158.0,18.0},{174.0,34.0}},origin = {0.0,0.0},rotation = 0.0)));
    parameter Real stepdown[1];
    .HPF.Transformers.ThreePhase.Symmetric.D1Y d1Y(
        VPrimRated=12470,
        VSecRated=480,
        Rc=110450.1*km,
        Rp=0.43785*kp,
        Rs=0.0006488*ks,
        Xm=10366.7*km,
        Xp=4.4882*kp,
        Xs=0.00665*ks) annotation(Placement(transformation(extent = {{-38.0,-20.0},{-18.0,0.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Transformers.ThreePhase.Symmetric.D1Y d1Y2(VPrimRated=480,
        VSecRated=208,
        Rc=932.1*km,
        Rp=0.01837*kp,
        Rs=0.0034489*ks,
        Xm=81.9*km,
        Xp=0.03661*kp,
        Xs=0.006875*ks) annotation(Placement(transformation(extent = {{68,86},{88,106}},origin = {0,0},rotation = 0)));
equation
        for i in 1:modelData.nconverter[1] loop
            stepdown = modelData.stepDown_indices[i];
            if i>1 then
                 for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
                          connect(lumconv_phaseA[i].hPin_N,ground3.pin) annotation(Line(points = {{63.19999999999999,8},{52,8},{52,-82}},color = {117,80,123}));
                          connect(lumconv_phaseA[i].pin_p,nEC_CableModelDC[j].p) annotation(Line(points = {{83.19999999999999,24},{88.19999999999999,24},{88.19999999999999,28},{93.19999999999999,28}},color = {0,0,255}));
                          connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{149.2,20},{170,20},{170,-17.92422722805058}},color = {0,0,255}));
                          connect(lumconv_phaseA[i].pin_n,ground2.p) annotation(Line(points = {{83.19999999999999,8},{170,8},{170,-17.92422722805058}},color = {0,0,255}));
                          connect(nEC_CableModel[i].pin_n,lumconv_phaseA[i].hPin_L) annotation(Line(points = {{56,28},{59.599999999999994,28},{59.599999999999994,24},{63.19999999999999,24}},color = {117,80,123}));
                          connect(nEC_CableModelDC[j].n,lum_phaseA[j].p) annotation(Line(points = {{113.19999999999999,28},{121.19999999999999,28},{121.19999999999999,20},{129.2,20}},color = {0,0,255}));
                          connect(nEC_CableModel7.pin_n,nEC_CableModel[i].pin_p) annotation(Line(points = {{28,26},{36,26},{36,28}},color = {117,80,123}));
                 end for;
             else
                 for j in (1:stepdown[1]) loop
                          connect(lumconv_phaseA[1].hPin_N,ground3.pin) annotation(Line(points = {{63.19999999999999,8},{52,8},{52,-82}},color = {117,80,123}));
                          connect(lumconv_phaseA[1].pin_p,nEC_CableModelDC[j].p) annotation(Line(points = {{83.19999999999999,24},{88.19999999999999,24},{88.19999999999999,28},{93.19999999999999,28}},color = {0,0,255}));
                          connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{149.2,20},{170,20},{170,-17.92422722805058}},color = {0,0,255}));
                          connect(lumconv_phaseA[1].pin_n,ground2.p) annotation(Line(points = {{83.19999999999999,8},{170,8},{170,-17.92422722805058}},color = {0,0,255}));
                          connect(nEC_CableModel[1].pin_n,lumconv_phaseA[1].hPin_L) annotation(Line(points = {{56,28},{59.599999999999994,28},{59.599999999999994,24},{63.19999999999999,24}},color = {117,80,123}));
                          connect(nEC_CableModelDC[j].n,lum_phaseA[j].p) annotation(Line(points = {{113.19999999999999,28},{121.19999999999999,28},{121.19999999999999,20},{129.2,20}},color = {0,0,255}));
                          connect(nEC_CableModel7.pin_n,nEC_CableModel[1].pin_p) annotation(Line(points = {{28,26},{36,26},{36,28}},color = {117,80,123}));
                 end for;
            end if;
         end for;

        for i in 1:modelData.nconverter[2] loop
            stepdown = modelData.stepDown_indices[i];
            if i>1 then
                 for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
                    connect(nEC_CableModel8.pin_n,nEC_CableModel5[i].pin_p) annotation(Line(points = {{26,-14},{34,-14}},color = {117,80,123}));
                    connect(lumconv_phaseB[i].hPin_L,nEC_CableModel5[i].pin_n) annotation(Line(points = {{62,-14.5},{58,-14.5},{58,-14},{54,-14}},color = {92,53,102}));
                    connect(lumconv_phaseB[i].pin_p,nEC_CableModelDC2[j].p) annotation(Line(points = {{82,-14.5},{87,-14.5},{87,-10.5},{92,-10.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC2[j].n,lum_phaseB[j].p) annotation(Line(points = {{112,-10.5},{120,-10.5},{120,-18.5},{128,-18.5}},color = {0,0,255}));
                    connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{148,-18.5},{154,-18.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseB[i].pin_n,ground2.p) annotation(Line(points = {{82,-30.5},{88,-30.5},{88,-34},{170,-34},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseB[i].hPin_N,ground3.pin) annotation(Line(points = {{62,-30.5},{52,-30.5},{52,-82}},color = {117,80,123}));
    
                 end for;
            else
                 for j in (1:stepdown[1]) loop
                    connect(nEC_CableModel8.pin_n,nEC_CableModel5[1].pin_p) annotation(Line(points = {{26,-14},{34,-14}},color = {117,80,123}));
                    connect(lumconv_phaseB[1].hPin_L,nEC_CableModel5[1].pin_n) annotation(Line(points = {{62,-14.5},{58,-14.5},{58,-14},{54,-14}},color = {92,53,102}));
                    connect(lumconv_phaseB[1].pin_p,nEC_CableModelDC2[j].p) annotation(Line(points = {{82,-14.5},{87,-14.5},{87,-10.5},{92,-10.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC2[j].n,lum_phaseB[j].p) annotation(Line(points = {{112,-10.5},{120,-10.5},{120,-18.5},{128,-18.5}},color = {0,0,255}));
                    connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{148,-18.5},{154,-18.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseB[1].pin_n,ground2.p) annotation(Line(points = {{82,-30.5},{88,-30.5},{88,-34},{170,-34},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseB[1].hPin_N,ground3.pin) annotation(Line(points = {{62,-30.5},{52,-30.5},{52,-82}},color = {117,80,123}));
                 end for;
            end if;
         end for;

         for i in 1:modelData.nconverter[2] loop
            stepdown = modelData.stepDown_indices[i];
            if i>1 then
                 for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
                    connect(nEC_CableModel9.pin_n,nEC_CableModel6[i].pin_p) annotation(Line(points = {{22,-48},{32,-48}},color = {117,80,123}));
                    connect(nEC_CableModel6[i].pin_n,lumconv_phaseC[i].hPin_L) annotation(Line(points = {{52,-48},{57,-48},{57,-50},{62,-50}},color = {117,80,123}));
                    connect(lumconv_phaseC[i].pin_p,nEC_CableModelDC3[j].p) annotation(Line(points = {{82,-50},{87,-50},{87,-46.5},{92,-46.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC3[j].n,lum_phaseC[j].p) annotation(Line(points = {{112,-46.5},{120,-46.5},{120,-54.5},{128,-54.5}},color = {0,0,255}));
                    connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{148,-54.5},{154,-54.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseC[i].pin_n,ground2.p) annotation(Line(points = {{82,-66},{88,-66},{88,-74},{170,-74},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseC[i].hPin_N,ground3.pin) annotation(Line(points = {{62,-66},{52,-66},{52,-82}},color = {117,80,123}));
    
                 end for;
            else
                 for j in (1:stepdown[1]) loop
                    connect(nEC_CableModel9.pin_n,nEC_CableModel6[1].pin_p) annotation(Line(points = {{22,-48},{32,-48}},color = {117,80,123}));
                    connect(nEC_CableModel6[1].pin_n,lumconv_phaseC[1].hPin_L) annotation(Line(points = {{52,-48},{57,-48},{57,-50},{62,-50}},color = {117,80,123}));
                    connect(lumconv_phaseC[1].pin_p,nEC_CableModelDC3[j].p) annotation(Line(points = {{82,-50},{87,-50},{87,-46.5},{92,-46.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC3[j].n,lum_phaseC[j].p) annotation(Line(points = {{112,-46.5},{120,-46.5},{120,-54.5},{128,-54.5}},color = {0,0,255}));
                    connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{148,-54.5},{154,-54.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseC[1].pin_n,ground2.p) annotation(Line(points = {{82,-66},{88,-66},{88,-74},{170,-74},{170,-17.92422722805058}},color = {0,0,255}));
                    connect(lumconv_phaseC[1].hPin_N,ground3.pin) annotation(Line(points = {{62,-66},{52,-66},{52,-82}},color = {117,80,123}));
                 end for;
            end if;
         end for;

         for i in 1:modelData.nconverter[2] loop
            stepdown = modelData.stepDown_indices[i];
            if i>1 then
                 for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
                    connect(nEC_CableModel13.pin_n,nEC_CableModel10[i].pin_p) annotation(Line(points = {{138.14117647058822,129.11764705882354},{148.14117647058822,129.11764705882354}},color = {117,80,123}));
                    connect(nEC_CableModel10[i].pin_n,melconv_phaseA[i].hPin_L) annotation(Line(points = {{168.14117647058822,129.11764705882354},{170.74117647058821,129.11764705882354},{170.74117647058821,127.11764705882354},{173.3411764705882,127.11764705882354}},color = {117,80,123}));
                    connect(melconv_phaseA[i].pin_p,nEC_CableModelDC4[j].p) annotation(Line(points = {{193.3411764705882,127.11764705882354},{198.3411764705882,127.11764705882354},{198.3411764705882,131.11764705882354},{203.3411764705882,131.11764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC4[j].n,mel_phaseA[j].p) annotation(Line(points = {{223.3411764705882,131.11764705882354},{231.3411764705882,131.11764705882354},{231.3411764705882,123.11764705882354},{239.3411764705882,123.11764705882354}},color = {0,0,255}));
                    connect(mel_phaseA[j].n,ground5.p) annotation(Line(points = {{259.3411764705882,123.11764705882354},{280.1411764705882,123.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseA[i].pin_n,ground5.p) annotation(Line(points = {{193.3411764705882,111.11764705882354},{280.1411764705882,111.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseA[i].hPin_N,ground7.pin) annotation(Line(points = {{173.3411764705882,111.11764705882354},{166,111.11764705882354},{166,34}},color = {117,80,123}));

    
                 end for;
            else
                 for j in (1:stepdown[1]) loop
                    connect(nEC_CableModel13.pin_n,nEC_CableModel10[i].pin_p) annotation(Line(points = {{138.14117647058822,129.11764705882354},{148.14117647058822,129.11764705882354}},color = {117,80,123}));
                    connect(nEC_CableModel10[1].pin_n,melconv_phaseA[1].hPin_L) annotation(Line(points = {{168.14117647058822,129.11764705882354},{170.74117647058821,129.11764705882354},{170.74117647058821,127.11764705882354},{173.3411764705882,127.11764705882354}},color = {117,80,123}));
                    connect(melconv_phaseA[1].pin_p,nEC_CableModelDC4[j].p) annotation(Line(points = {{193.3411764705882,127.11764705882354},{198.3411764705882,127.11764705882354},{198.3411764705882,131.11764705882354},{203.3411764705882,131.11764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC4[j].n,mel_phaseA[j].p) annotation(Line(points = {{223.3411764705882,131.11764705882354},{231.3411764705882,131.11764705882354},{231.3411764705882,123.11764705882354},{239.3411764705882,123.11764705882354}},color = {0,0,255}));
                    connect(mel_phaseA[j].n,ground5.p) annotation(Line(points = {{259.3411764705882,123.11764705882354},{280.1411764705882,123.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseA[1].pin_n,ground5.p) annotation(Line(points = {{193.3411764705882,111.11764705882354},{280.1411764705882,111.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseA[1].hPin_N,ground7.pin) annotation(Line(points = {{173.3411764705882,111.11764705882354},{166,111.11764705882354},{166,34}},color = {117,80,123}));

                 end for;
            end if;
         end for;
        
         for i in 1:modelData.nconverter[2] loop
            stepdown = modelData.stepDown_indices[i];
            if i>1 then
                 for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
                    connect(nEC_CableModel14.pin_n,nEC_CableModel11[i].pin_p) annotation(Line(points = {{136.14117647058822,89.11764705882354},{144.14117647058822,89.11764705882354}},color = {117,80,123}));
                    connect(nEC_CableModel11[i].pin_n,melconv_phaseB[i].hPin_L) annotation(Line(points = {{164.14117647058822,89.11764705882354},{168.14117647058822,89.11764705882354},{168.14117647058822,88.61764705882354},{172.14117647058822,88.61764705882354}},color = {117,80,123}));
                    connect(melconv_phaseB[i].pin_p,nEC_CableModelDC5[j].p) annotation(Line(points = {{192.14117647058822,88.61764705882354},{197.14117647058822,88.61764705882354},{197.14117647058822,92.61764705882354},{202.14117647058822,92.61764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC5[j].n,mel_phaseB[j].p) annotation(Line(points = {{222.14117647058822,92.61764705882354},{230.14117647058822,92.61764705882354},{230.14117647058822,84.61764705882354},{238.14117647058822,84.61764705882354}},color = {0,0,255}));
                    connect(mel_phaseB[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,84.61764705882354},{264.1411764705882,84.61764705882354},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseB[i].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,72.61764705882354},{198.14117647058822,72.61764705882354},{198.14117647058822,68},{280.1411764705882,68},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseB[i].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,72.61764705882354},{166,72.61764705882354},{166,34}},color = {117,80,123}));
    
                 end for;
            else
                 for j in (1:stepdown[1]) loop
                    connect(nEC_CableModel14.pin_n,nEC_CableModel11[1].pin_p) annotation(Line(points = {{136.14117647058822,89.11764705882354},{144.14117647058822,89.11764705882354}},color = {117,80,123}));
                    connect(nEC_CableModel11[1].pin_n,melconv_phaseB[1].hPin_L) annotation(Line(points = {{164.14117647058822,89.11764705882354},{168.14117647058822,89.11764705882354},{168.14117647058822,88.61764705882354},{172.14117647058822,88.61764705882354}},color = {117,80,123}));
                    connect(melconv_phaseB[1].pin_p,nEC_CableModelDC5[j].p) annotation(Line(points = {{192.14117647058822,88.61764705882354},{197.14117647058822,88.61764705882354},{197.14117647058822,92.61764705882354},{202.14117647058822,92.61764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC5[j].n,mel_phaseB[j].p) annotation(Line(points = {{222.14117647058822,92.61764705882354},{230.14117647058822,92.61764705882354},{230.14117647058822,84.61764705882354},{238.14117647058822,84.61764705882354}},color = {0,0,255}));
                    connect(mel_phaseB[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,84.61764705882354},{264.1411764705882,84.61764705882354},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseB[1].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,72.61764705882354},{198.14117647058822,72.61764705882354},{198.14117647058822,68},{280.1411764705882,68},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseB[1].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,72.61764705882354},{166,72.61764705882354},{166,34}},color = {117,80,123}));

                 end for;
            end if;
         end for;

         for i in 1:modelData.nconverter[2] loop
            stepdown = modelData.stepDown_indices[i];
            if i>1 then
                 for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
                    connect(nEC_CableModel15.pin_n,nEC_CableModel12[i].pin_p) annotation(Line(points = {{132.14117647058822,55.117647058823536},{142.14117647058822,55.117647058823536}},color = {117,80,123}));
                    connect(nEC_CableModel12[i].pin_n,melconv_phaseC[i].hPin_L) annotation(Line(points = {{162.14117647058822,55.117647058823536},{167.14117647058822,55.117647058823536},{167.14117647058822,52.61764705882353},{172.14117647058822,52.61764705882353}},color = {117,80,123}));
                    connect(melconv_phaseC[i].pin_p,nEC_CableModelDC6[j].p) annotation(Line(points = {{192.14117647058822,52.61764705882353},{197.14117647058822,52.61764705882353},{197.14117647058822,56.617647058823536},{202.14117647058822,56.617647058823536}},color = {0,0,255}));
                    connect(nEC_CableModelDC6[j].n,mel_phaseC[j].p) annotation(Line(points = {{222.14117647058822,56.617647058823536},{230.14117647058822,56.617647058823536},{230.14117647058822,48.61764705882353},{238.14117647058822,48.61764705882353}},color = {0,0,255}));
                    connect(mel_phaseC[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,48.61764705882353},{264.1411764705882,48.61764705882353},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseC[i].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,36.61764705882353},{192.14117647058822,32},{280.1411764705882,32},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseC[i].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,36.61764705882353},{166.14117647058822,36.61764705882353},{166.14117647058822,40},{166,40},{166,34}},color = {117,80,123}));
    
                 end for;
            else
                 for j in (1:stepdown[1]) loop
                    connect(nEC_CableModel15.pin_n,nEC_CableModel12[1].pin_p) annotation(Line(points = {{132.14117647058822,55.117647058823536},{142.14117647058822,55.117647058823536}},color = {117,80,123}));
                    connect(nEC_CableModel12[1].pin_n,melconv_phaseC[1].hPin_L) annotation(Line(points = {{162.14117647058822,55.117647058823536},{167.14117647058822,55.117647058823536},{167.14117647058822,52.61764705882353},{172.14117647058822,52.61764705882353}},color = {117,80,123}));
                    connect(melconv_phaseC[1].pin_p,nEC_CableModelDC6[j].p) annotation(Line(points = {{192.14117647058822,52.61764705882353},{197.14117647058822,52.61764705882353},{197.14117647058822,56.617647058823536},{202.14117647058822,56.617647058823536}},color = {0,0,255}));
                    connect(nEC_CableModelDC6[j].n,mel_phaseC[j].p) annotation(Line(points = {{222.14117647058822,56.617647058823536},{230.14117647058822,56.617647058823536},{230.14117647058822,48.61764705882353},{238.14117647058822,48.61764705882353}},color = {0,0,255}));
                    connect(mel_phaseC[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,48.61764705882353},{264.1411764705882,48.61764705882353},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseC[1].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,36.61764705882353},{192.14117647058822,32},{280.1411764705882,32},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    connect(melconv_phaseC[1].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,36.61764705882353},{166.14117647058822,36.61764705882353},{166.14117647058822,40},{166,40},{166,34}},color = {117,80,123}));

                 end for;
            end if;
         end for;

    connect(fixedVoltage_VariablePower.p,aCDC_3pInverterSimple.pin_p) annotation(Line(points = {{-68,-66},{-68,-60},{-54,-60},{-54,-66},{-48,-66}},color = {0,0,255}));
    connect(fixedVoltage_VariablePower.n,aCDC_3pInverterSimple.pin_n) annotation(Line(points = {{-68,-86},{-68,-92},{-54,-92},{-54,-82},{-48,-82}},color = {0,0,255}));
    connect(aCDC_3pInverterSimple.pin_n,ground4.p) annotation(Line(points = {{-48,-82},{-54,-82},{-54,-100}},color = {0,0,255}));
    connect(aCDC_3pInverterSimple.hPin_A,nEC_CableModel2.pin_p) annotation(Line(points = {{-28,-66},{-21.042887840438844,-66}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_B,nEC_CableModel3.pin_p) annotation(Line(points = {{-28,-71},{-24.521443920219422,-71},{-24.521443920219422,-72},{-21.042887840438844,-72}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_C,nEC_CableModel4.pin_p) annotation(Line(points = {{-28,-76},{-24.521443920219422,-76},{-24.521443920219422,-78},{-21.042887840438844,-78}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_N,ground3.pin) annotation(Line(points = {{-28,-82},{-22,-82},{-22,-92},{52,-92},{52,-82}},color = {117,80,123}));
    connect(voltageSource.pinN,ground.pin) annotation(Line(points = {{-70,-24.200000000000003},{-70,-33.1},{-50,-33.1},{-50,-42}},color = {117,80,123}));
    connect(combiTimeTable.y[1],fixedVoltage_VariablePower.p_out) annotation(Line(points = {{-85,-76},{-76,-76}},color = {0,0,127}));
    connect(voltageSource.pinP_phA,d1Y.pinPrim_A) annotation(Line(points = {{-60,-6},{-60,6},{-38,6},{-38,0}},color = {92,53,102}));
    connect(voltageSource.pinP_phB,d1Y.pinPrim_B) annotation(Line(points = {{-60,-14},{-49,-14},{-49,-10},{-38,-10}},color = {92,53,102}));
    connect(voltageSource.pinP_phC,d1Y.pinPrim_C) annotation(Line(points = {{-60,-22},{-60,-28},{-38,-28},{-38,-20}},color = {92,53,102}));
    connect(d1Y.pinSec_N,ground.pin) annotation(Line(points = {{-18,-22},{-12,-22},{-12,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(d1Y.pinSec_A,nEC_CableModel7.pin_p) annotation(Line(points = {{-18,2},{-5,2},{-5,26},{8,26}},color = {92,53,102}));
    connect(d1Y.pinSec_B,nEC_CableModel8.pin_p) annotation(Line(points = {{-18,-6},{-6,-6},{-6,-14.75},{6,-14.75}},color = {92,53,102}));
    connect(d1Y.pinSec_C,nEC_CableModel9.pin_p) annotation(Line(points = {{-18,-14},{-8,-14},{-8,-48.75},{2,-48.75}},color = {92,53,102}));
    connect(aCload.hPin_A,d1Y.pinSec_A) annotation(Line(points = {{-13.600000000000003,44.6},{-13.600000000000003,38.6},{-12,38.6},{-12,2},{-18,2}},color = {92,53,102}));
    connect(aCload.hPin_B,d1Y.pinSec_B) annotation(Line(points = {{-11.600000000000003,44.599999999999994},{-11.600000000000003,-6},{-18,-6}},color = {92,53,102}));
    connect(aCload.hPin_C,d1Y.pinSec_C) annotation(Line(points = {{-9.600000000000003,44.6},{-9.600000000000003,-14},{-18,-14}},color = {92,53,102}));
    connect(aCload.hPin_N,d1Y.pinSec_N) annotation(Line(points = {{-7.0000000000000036,44.599999999999994},{-1.0000000000000036,44.599999999999994},{-1.0000000000000036,-22},{-18,-22}},color = {117,80,123}));
    connect(nEC_CableModel2.pin_n,d1Y.pinSec_A) annotation(Line(points = {{-10.957112159561156,-66},{-4.957112159561156,-66},{-4.957112159561156,2},{-18,2}},color = {117,80,123}));
    connect(nEC_CableModel3.pin_n,d1Y.pinSec_B) annotation(Line(points = {{-10.957112159561156,-72},{-4.957112159561156,-72},{-4.957112159561156,-6},{-18,-6}},color = {117,80,123}));
    connect(nEC_CableModel4.pin_n,d1Y.pinSec_N) annotation(Line(points = {{-10.957112159561156,-78},{-4.957112159561156,-78},{-4.957112159561156,-22},{-18,-22}},color = {117,80,123}));
    connect(d1Y2.pinSec_A,nEC_CableModel13.pin_p) annotation(Line(points = {{88,108},{103.07058823529411,108},{103.07058823529411,129.11764705882354},{118.14117647058822,129.11764705882354}},color = {92,53,102}));
    connect(d1Y2.pinSec_B,nEC_CableModel14.pin_p) annotation(Line(points = {{88,100},{102.07058823529411,100},{102.07058823529411,89.11764705882354},{116.14117647058822,89.11764705882354}},color = {92,53,102}));
    connect(d1Y2.pinSec_C,nEC_CableModel15.pin_p) annotation(Line(points = {{88,92},{100.07058823529411,92},{100.07058823529411,55.117647058823536},{112.14117647058822,55.117647058823536}},color = {92,53,102}));
    connect(d1Y2.pinSec_N,ground6.pin) annotation(Line(points = {{88,84},{94,84},{94,56},{90,56},{90,50}},color = {117,80,123}));
    connect(d1Y2.pinPrim_A,d1Y.pinSec_A) annotation(Line(points = {{68,106},{68,112},{-18,112},{-18,2}},color = {92,53,102}));
    connect(d1Y2.pinPrim_B,d1Y.pinSec_B) annotation(Line(points = {{68,96},{-18,96},{-18,-6}},color = {92,53,102}));
    connect(d1Y2.pinPrim_C,d1Y.pinSec_C) annotation(Line(points = {{68,86},{-18,86},{-18,-14}},color = {92,53,102}));
    
    


    

   
end medoff_template_1;
