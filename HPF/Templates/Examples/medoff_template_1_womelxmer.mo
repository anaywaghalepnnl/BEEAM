within HPF.Templates.Examples;

model medoff_template_1_womelxmer
    inner parameter Real PF = 0.95;
    inner parameter Real PF1 = tan(acos(PF));
    parameter Real Vs = 7200;
    parameter Real kp = 3;
    parameter Real ks = 1;
    parameter Real km = 3;
    parameter Integer nconverter_lumA = modelData.nconverter_lumA;
    parameter Integer nconverter_lumB = modelData.nconverter_lumB;
    parameter Integer nconverter_lumC = modelData.nconverter_lumC;
    parameter Integer nconverter_melA = modelData.nconverter_melA;
    parameter Integer nconverter_melB = modelData.nconverter_melB;
    parameter Integer nconverter_melC = modelData.nconverter_melC;

    replaceable parameter .HPF.Templates.Data.Examples.medium_office_light_mel modelData annotation(Placement(transformation(extent = {{-86.0,74.0},{-66.0,94.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.Templates.LoadwStepDown lum_phaseA[modelData.nStepDown_lumA](redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.lum_phaseA) annotation(Placement(transformation(extent = {{129.2,10.0},{149.2,30.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.Sources.ThreePhase.VoltageSource voltageSource(
        vArg_phA={0},
        vArg_phB={-2.0944},
        vArg_phC={2.0944},
        vMag_phA={Vs},
        vMag_phB={Vs},
        vMag_phC={Vs}) annotation(Placement(transformation(extent = {{-78.0,-22.0},{-62.0,-6.0}},origin = {0.0,0.0},rotation = 0.0)));
   
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseA[modelData.nconverter_lumA](VDC_nom=modelData.lumconv_phaseA.V_Rect,
    P_nom=modelData.lumconv_phaseA.nomP,
    VAC_nom=modelData.lumconv_phaseA.nomV,
    vAngle=modelData.lumconv_phaseA.vAngle,
    P_stby=modelData.lumconv_phaseA.P_stby,
    P_DCmin=modelData.lumconv_phaseA.P_DCmin,
    alpha = modelData.lumconv_phaseA.alpha,
    beta = modelData.lumconv_phaseA.beta,
    gamma = modelData.lumconv_phaseA.gamma) annotation(Placement(transformation(extent = {{63.19999999999999,6.0},{83.19999999999999,26.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC[modelData.nStepDown_lumA] annotation(Placement(transformation(extent = {{93.19999999999999,18.0},{113.19999999999999,38.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{-58.0,-58.0},{-42.0,-42.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{163.92422722805057,-30.07577277194942},{176.07577277194943,-17.92422722805058}},origin = {0.0,0.0},rotation = 0.0)));
    
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseB[modelData.nconverter_lumB](VDC_nom=modelData.lumconv_phaseB.V_Rect,
    P_nom=modelData.lumconv_phaseB.nomP,
    VAC_nom=modelData.lumconv_phaseB.nomV,
    vAngle=modelData.lumconv_phaseB.vAngle,
    P_stby=modelData.lumconv_phaseB.P_stby,
    P_DCmin=modelData.lumconv_phaseB.P_DCmin,
    alpha = modelData.lumconv_phaseB.alpha,
    beta = modelData.lumconv_phaseB.beta,
    gamma = modelData.lumconv_phaseB.gamma) annotation(Placement(transformation(extent = {{62.0,-33.25},{82.0,-13.25}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC2[modelData.nStepDown_lumB] annotation(Placement(transformation(extent = {{92.0,-21.25},{112.0,-1.25}},origin = {0.0,0.0},rotation = 0.0)));
    
    
    .HPF.Templates.LoadwStepDown lum_phaseB[modelData.nStepDown_lumB](redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.lum_phaseB) annotation(Placement(transformation(extent = {{128.0,-29.25},{148.0,-9.25}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel5[modelData.nconverter_lumB](wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{34.0,-24.75},{54.0,-4.75}},origin = {0.0,0.0},rotation = 0.0)));
   
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseC[modelData.nconverter_lumC](VDC_nom=modelData.lumconv_phaseC.V_Rect,
    P_nom=modelData.lumconv_phaseC.nomP,
    VAC_nom=modelData.lumconv_phaseC.nomV,
    vAngle=modelData.lumconv_phaseC.vAngle,
    P_stby=modelData.lumconv_phaseC.P_stby,
    P_DCmin=modelData.lumconv_phaseC.P_DCmin,
    alpha = modelData.lumconv_phaseC.alpha,
    beta = modelData.lumconv_phaseC.beta,
    gamma = modelData.lumconv_phaseC.gamma) annotation(Placement(transformation(extent = {{62.0,-68.0},{82.0,-48.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC3[modelData.nStepDown_lumC] annotation(Placement(transformation(extent = {{92.0,-56.5},{112.0,-36.5}},origin = {0.0,0.0},rotation = 0.0)));
    
    
    .HPF.Templates.LoadwStepDown lum_phaseC[modelData.nStepDown_lumC](redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.lum_phaseC) annotation(Placement(transformation(extent = {{128.0,-64.5},{148.0,-44.5}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel6[modelData.nconverter_lumC](wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{32.0,-58.0},{52.0,-38.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground3 annotation(Placement(transformation(extent = {{44.0,-98.0},{60.0,-82.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel7 annotation(Placement(transformation(extent = {{8.0,20.0},{28.0,40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel8 annotation(Placement(transformation(extent = {{6.0,-24.75},{26.0,-4.75}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel9 annotation(Placement(transformation(extent = {{2.0,-58.75},{22.0,-38.75}},origin = {0.0,0.0},rotation = 0.0)));
    inner .HPF.SystemDef systemDef annotation(Placement(transformation(extent = {{-90,44},{-62,68}},origin = {0,0},rotation = 0)));
   
    
    .HPF.Templates.LoadwStepDown mel_phaseA[modelData.nStepDown_melA](redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.mel_phaseA) annotation(Placement(transformation(extent = {{239.3411764705882,113.11764705882354},{259.3411764705882,133.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
   
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseA[modelData.nconverter_melA](VDC_nom=modelData.melconv_phaseA.V_Rect,
    P_nom=modelData.melconv_phaseA.nomP,
    VAC_nom=modelData.melconv_phaseA.nomV,
    vAngle=modelData.melconv_phaseA.vAngle,
    P_stby=modelData.melconv_phaseA.P_stby,
    P_DCmin=modelData.melconv_phaseA.P_DCmin,
    alpha = modelData.melconv_phaseA.alpha,
    beta = modelData.melconv_phaseA.beta,
    gamma = modelData.melconv_phaseA.gamma) annotation(Placement(transformation(extent = {{173.3411764705882,109.11764705882354},{193.3411764705882,129.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC4[modelData.nStepDown_melA] annotation(Placement(transformation(extent = {{203.3411764705882,121.11764705882354},{223.3411764705882,141.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel10[modelData.nconverter_melA](wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{148.14117647058822,119.11764705882354},{168.14117647058822,139.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground5 annotation(Placement(transformation(extent = {{274.06540369863876,73.04187428687412},{286.2169492425377,85.19341983077295}},origin = {0.0,0.0},rotation = 0.0)));
  
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseB[modelData.nconverter_melB](VDC_nom=modelData.melconv_phaseB.V_Rect,
    P_nom=modelData.melconv_phaseB.nomP,
    VAC_nom=modelData.melconv_phaseB.nomV,
    vAngle=modelData.melconv_phaseB.vAngle,
    P_stby=modelData.melconv_phaseB.P_stby,
    P_DCmin=modelData.melconv_phaseB.P_DCmin,
    alpha = modelData.melconv_phaseB.alpha,
    beta = modelData.melconv_phaseB.beta,
    gamma = modelData.melconv_phaseB.gamma) annotation(Placement(transformation(extent = {{172.14117647058822,70.61764705882354},{192.14117647058822,90.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC5[modelData.nStepDown_melB] annotation(Placement(transformation(extent = {{202.14117647058822,82.61764705882354},{222.14117647058822,102.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    
    
    .HPF.Templates.LoadwStepDown mel_phaseB[modelData.nStepDown_melB](redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.mel_phaseB) annotation(Placement(transformation(extent = {{238.14117647058822,74.61764705882354},{258.1411764705882,94.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel11[modelData.nconverter_melB](wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12)  annotation(Placement(transformation(extent = {{144.14117647058822,79.11764705882354},{164.14117647058822,99.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
   
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseC[modelData.nconverter_melC](VDC_nom=modelData.melconv_phaseC.V_Rect,
    P_nom=modelData.melconv_phaseC.nomP,
    VAC_nom=modelData.melconv_phaseC.nomV,
    vAngle=modelData.melconv_phaseC.vAngle,
    P_stby=modelData.melconv_phaseC.P_stby,
    P_DCmin=modelData.melconv_phaseC.P_DCmin,
    alpha = modelData.melconv_phaseC.alpha,
    beta = modelData.melconv_phaseC.beta,
    gamma = modelData.melconv_phaseC.gamma) annotation(Placement(transformation(extent = {{172.14117647058822,34.61764705882353},{192.14117647058822,54.61764705882353}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModelDC nEC_CableModelDC6[modelData.nStepDown_melC] annotation(Placement(transformation(extent = {{202.14117647058822,46.61764705882353},{222.14117647058822,66.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    
    
    .HPF.Templates.LoadwStepDown mel_phaseC[modelData.nStepDown_melC](redeclare replaceable .HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
         modelData.mel_phaseC) annotation(Placement(transformation(extent = {{238.14117647058822,38.61764705882353},{258.1411764705882,58.61764705882353}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel12[modelData.nconverter_melC](wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{142.14117647058822,45.11764705882353},{162.14117647058822,65.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel13 annotation(Placement(transformation(extent = {{118.14117647058822,119.11764705882354},{138.14117647058822,139.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel14 annotation(Placement(transformation(extent = {{116.14117647058823,79.11764705882354},{136.14117647058822,99.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel15 annotation(Placement(transformation(extent = {{112.14117647058823,45.11764705882353},{132.14117647058822,65.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
    

   
    .HPF.Cables.NEC_CableModel nEC_CableModel[modelData.nconverter_lumA](wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_12) annotation(Placement(transformation(extent = {{38.0,20.0},{58.0,40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground7 annotation(Placement(transformation(extent = {{158.0,18.0},{174.0,34.0}},origin = {0.0,0.0},rotation = 0.0)));
    //parameter Real stepdown[1];
    
    
    .HPF.Transformers.ThreePhase.Symmetric.D1Y d1Y(
        VPrimRated=12470,
        VSecRated=480,
        Rc=110450.1*km,
        Rp=0.43785*kp,
        Rs=0.0006488*ks,
        Xm=10366.7*km,
        Xp=4.4882*kp,
        Xs=0.00665*ks) annotation(Placement(transformation(extent = {{-38.0,-20.0},{-18.0,0.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.ACload aCload(aC_LoadIdealWye(P_nom = 100,V_nom = 277),ac_schedule(tableName = "Mechanical",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/San-Diego-Mechanical_LP.txt"),timeScale = 3600)) annotation(Placement(transformation(extent = {{10,-10},{-10,10}},origin = {-14.571428571428573,59.71428571428572},rotation = 90)));
equation
        for i in 1:nconverter_lumA loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_lumA[1:(i-1)])+1):(sum(modelData.stepDown_indices_lumA[1:(i-1)])+modelData.stepDown_indices_lumA[i]) loop
                          
                          connect(lumconv_phaseA[i].pin_p,nEC_CableModelDC[j].p) annotation(Line(points = {{83.19999999999999,24},{88.19999999999999,24},{88.19999999999999,28},{93.19999999999999,28}},color = {0,0,255}));
                          connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{149.2,20},{170,20},{170,-17.92422722805058}},color = {0,0,255}));
                          connect(nEC_CableModelDC[j].n,lum_phaseA[j].p) annotation(Line(points = {{113.19999999999999,28},{121.19999999999999,28},{121.19999999999999,20},{129.2,20}},color = {0,0,255}));
                 end for;
                 
             else
                 for j in (1:modelData.stepDown_indices_lumA[1]) loop
                          connect(lumconv_phaseA[1].pin_p,nEC_CableModelDC[j].p) annotation(Line(points = {{83.19999999999999,24},{88.19999999999999,24},{88.19999999999999,28},{93.19999999999999,28}},color = {0,0,255}));
                          connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{149.2,20},{170,20},{170,-17.92422722805058}},color = {0,0,255}));
                          connect(nEC_CableModelDC[j].n,lum_phaseA[j].p) annotation(Line(points = {{113.19999999999999,28},{121.19999999999999,28},{121.19999999999999,20},{129.2,20}},color = {0,0,255}));
                 end for;
            end if;
            connect(lumconv_phaseA[i].hPin_N,ground3.pin) annotation(Line(points = {{63.19999999999999,8},{52,8},{52,-82}},color = {117,80,123}));
            connect(lumconv_phaseA[i].pin_n,ground2.p) annotation(Line(points = {{83.19999999999999,8},{170,8},{170,-17.92422722805058}},color = {0,0,255}));
            connect(nEC_CableModel[i].pin_n,lumconv_phaseA[i].hPin_L) annotation(Line(points = {{56,28},{59.599999999999994,28},{59.599999999999994,24},{63.19999999999999,24}},color = {117,80,123}));
            connect(nEC_CableModel7.pin_n,nEC_CableModel[i].pin_p) annotation(Line(points = {{28,26},{36,26},{36,28}},color = {117,80,123}));
            
         end for;
 

        for i in 1:nconverter_lumB loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_lumB[1:(i-1)])+1):(sum(modelData.stepDown_indices_lumB[1:(i-1)])+modelData.stepDown_indices_lumB[i]) loop

                    connect(lumconv_phaseB[i].pin_p,nEC_CableModelDC2[j].p) annotation(Line(points = {{82,-14.5},{87,-14.5},{87,-10.5},{92,-10.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC2[j].n,lum_phaseB[j].p) annotation(Line(points = {{112,-10.5},{120,-10.5},{120,-18.5},{128,-18.5}},color = {0,0,255}));
                    connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{148,-18.5},{154,-18.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                    
                 end for;
            else
                 for j in (1:modelData.stepDown_indices_lumB[1]) loop
                    connect(lumconv_phaseB[1].pin_p,nEC_CableModelDC2[j].p) annotation(Line(points = {{82,-14.5},{87,-14.5},{87,-10.5},{92,-10.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC2[j].n,lum_phaseB[j].p) annotation(Line(points = {{112,-10.5},{120,-10.5},{120,-18.5},{128,-18.5}},color = {0,0,255}));
                    connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{148,-18.5},{154,-18.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                 end for;
            end if;
            connect(nEC_CableModel8.pin_n,nEC_CableModel5[i].pin_p) annotation(Line(points = {{26,-14},{34,-14}},color = {117,80,123}));
            connect(lumconv_phaseB[i].hPin_L,nEC_CableModel5[i].pin_n) annotation(Line(points = {{62,-14.5},{58,-14.5},{58,-14},{54,-14}},color = {92,53,102}));
            connect(lumconv_phaseB[i].pin_n,ground2.p) annotation(Line(points = {{82,-30.5},{88,-30.5},{88,-34},{170,-34},{170,-17.92422722805058}},color = {0,0,255}));
            connect(lumconv_phaseB[i].hPin_N,ground3.pin) annotation(Line(points = {{62,-30.5},{52,-30.5},{52,-82}},color = {117,80,123}));
         end for;


         for i in 1:nconverter_lumC loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_lumC[1:(i-1)])+1):(sum(modelData.stepDown_indices_lumC[1:(i-1)])+modelData.stepDown_indices_lumC[i]) loop
                    
                    connect(lumconv_phaseC[i].pin_p,nEC_CableModelDC3[j].p) annotation(Line(points = {{82,-50},{87,-50},{87,-46.5},{92,-46.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC3[j].n,lum_phaseC[j].p) annotation(Line(points = {{112,-46.5},{120,-46.5},{120,-54.5},{128,-54.5}},color = {0,0,255}));
                    connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{148,-54.5},{154,-54.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                 end for;
            else
                 for j in (1:modelData.stepDown_indices_lumC[1]) loop
                   
                    connect(lumconv_phaseC[1].pin_p,nEC_CableModelDC3[j].p) annotation(Line(points = {{82,-50},{87,-50},{87,-46.5},{92,-46.5}},color = {0,0,255}));
                    connect(nEC_CableModelDC3[j].n,lum_phaseC[j].p) annotation(Line(points = {{112,-46.5},{120,-46.5},{120,-54.5},{128,-54.5}},color = {0,0,255}));
                    connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{148,-54.5},{154,-54.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                 end for;
            end if;
            connect(nEC_CableModel9.pin_n,nEC_CableModel6[i].pin_p) annotation(Line(points = {{22,-48},{32,-48}},color = {117,80,123}));
            connect(nEC_CableModel6[i].pin_n,lumconv_phaseC[i].hPin_L) annotation(Line(points = {{52,-48},{57,-48},{57,-50},{62,-50}},color = {117,80,123}));
            connect(lumconv_phaseC[i].pin_n,ground2.p) annotation(Line(points = {{82,-66},{88,-66},{88,-74},{170,-74},{170,-17.92422722805058}},color = {0,0,255}));
            connect(lumconv_phaseC[i].hPin_N,ground3.pin) annotation(Line(points = {{62,-66},{52,-66},{52,-82}},color = {117,80,123}));
         end for;


         for i in 1:nconverter_melA loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_melA[1:(i-1)])+1):(sum(modelData.stepDown_indices_melA[1:(i-1)])+modelData.stepDown_indices_melA[i]) loop
                    
                    connect(melconv_phaseA[i].pin_p,nEC_CableModelDC4[j].p) annotation(Line(points = {{193.3411764705882,127.11764705882354},{198.3411764705882,127.11764705882354},{198.3411764705882,131.11764705882354},{203.3411764705882,131.11764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC4[j].n,mel_phaseA[j].p) annotation(Line(points = {{223.3411764705882,131.11764705882354},{231.3411764705882,131.11764705882354},{231.3411764705882,123.11764705882354},{239.3411764705882,123.11764705882354}},color = {0,0,255}));
                    connect(mel_phaseA[j].n,ground5.p) annotation(Line(points = {{259.3411764705882,123.11764705882354},{280.1411764705882,123.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                   
    
                 end for;
            else
                 for j in (1:modelData.stepDown_indices_melA[1]) loop
                    connect(melconv_phaseA[1].pin_p,nEC_CableModelDC4[j].p) annotation(Line(points = {{193.3411764705882,127.11764705882354},{198.3411764705882,127.11764705882354},{198.3411764705882,131.11764705882354},{203.3411764705882,131.11764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC4[j].n,mel_phaseA[j].p) annotation(Line(points = {{223.3411764705882,131.11764705882354},{231.3411764705882,131.11764705882354},{231.3411764705882,123.11764705882354},{239.3411764705882,123.11764705882354}},color = {0,0,255}));
                    connect(mel_phaseA[j].n,ground5.p) annotation(Line(points = {{259.3411764705882,123.11764705882354},{280.1411764705882,123.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));

                 end for;
            end if;
            connect(nEC_CableModel13.pin_n,nEC_CableModel10[i].pin_p) annotation(Line(points = {{138.14117647058822,129.11764705882354},{148.14117647058822,129.11764705882354}},color = {117,80,123}));
            connect(nEC_CableModel10[i].pin_n,melconv_phaseA[i].hPin_L) annotation(Line(points = {{168.14117647058822,129.11764705882354},{170.74117647058821,129.11764705882354},{170.74117647058821,127.11764705882354},{173.3411764705882,127.11764705882354}},color = {117,80,123}));
            connect(melconv_phaseA[i].pin_n,ground5.p) annotation(Line(points = {{193.3411764705882,111.11764705882354},{280.1411764705882,111.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
            connect(melconv_phaseA[i].hPin_N,ground7.pin) annotation(Line(points = {{173.3411764705882,111.11764705882354},{166,111.11764705882354},{166,34}},color = {117,80,123}));
         end for;
        
         for i in 1:nconverter_melB loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_melB[1:(i-1)])+1):(sum(modelData.stepDown_indices_melB[1:(i-1)])+modelData.stepDown_indices_melB[i]) loop
                    
                    connect(melconv_phaseB[i].pin_p,nEC_CableModelDC5[j].p) annotation(Line(points = {{192.14117647058822,88.61764705882354},{197.14117647058822,88.61764705882354},{197.14117647058822,92.61764705882354},{202.14117647058822,92.61764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC5[j].n,mel_phaseB[j].p) annotation(Line(points = {{222.14117647058822,92.61764705882354},{230.14117647058822,92.61764705882354},{230.14117647058822,84.61764705882354},{238.14117647058822,84.61764705882354}},color = {0,0,255}));
                    connect(mel_phaseB[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,84.61764705882354},{264.1411764705882,84.61764705882354},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    
    
                 end for;
            else
                 for j in (1:modelData.stepDown_indices_melB[1]) loop
                    connect(melconv_phaseB[1].pin_p,nEC_CableModelDC5[j].p) annotation(Line(points = {{192.14117647058822,88.61764705882354},{197.14117647058822,88.61764705882354},{197.14117647058822,92.61764705882354},{202.14117647058822,92.61764705882354}},color = {0,0,255}));
                    connect(nEC_CableModelDC5[j].n,mel_phaseB[j].p) annotation(Line(points = {{222.14117647058822,92.61764705882354},{230.14117647058822,92.61764705882354},{230.14117647058822,84.61764705882354},{238.14117647058822,84.61764705882354}},color = {0,0,255}));
                    connect(mel_phaseB[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,84.61764705882354},{264.1411764705882,84.61764705882354},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                 end for;
            end if;
            connect(nEC_CableModel14.pin_n,nEC_CableModel11[i].pin_p) annotation(Line(points = {{136.14117647058822,89.11764705882354},{144.14117647058822,89.11764705882354}},color = {117,80,123}));
            connect(nEC_CableModel11[i].pin_n,melconv_phaseB[i].hPin_L) annotation(Line(points = {{164.14117647058822,89.11764705882354},{168.14117647058822,89.11764705882354},{168.14117647058822,88.61764705882354},{172.14117647058822,88.61764705882354}},color = {117,80,123}));
            connect(melconv_phaseB[i].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,72.61764705882354},{198.14117647058822,72.61764705882354},{198.14117647058822,68},{280.1411764705882,68},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
            connect(melconv_phaseB[i].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,72.61764705882354},{166,72.61764705882354},{166,34}},color = {117,80,123}));
         end for;

         for i in 1:modelData.nconverter_melC loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_melC[1:(i-1)])+1):(sum(modelData.stepDown_indices_melC[1:(i-1)])+modelData.stepDown_indices_melC[i]) loop
                    
                    connect(melconv_phaseC[i].pin_p,nEC_CableModelDC6[j].p) annotation(Line(points = {{192.14117647058822,52.61764705882353},{197.14117647058822,52.61764705882353},{197.14117647058822,56.617647058823536},{202.14117647058822,56.617647058823536}},color = {0,0,255}));
                    connect(nEC_CableModelDC6[j].n,mel_phaseC[j].p) annotation(Line(points = {{222.14117647058822,56.617647058823536},{230.14117647058822,56.617647058823536},{230.14117647058822,48.61764705882353},{238.14117647058822,48.61764705882353}},color = {0,0,255}));
                    connect(mel_phaseC[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,48.61764705882353},{264.1411764705882,48.61764705882353},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
                    
    
                 end for;
            else
                 for j in (1:modelData.stepDown_indices_melC[1]) loop
                    connect(melconv_phaseC[1].pin_p,nEC_CableModelDC6[j].p) annotation(Line(points = {{192.14117647058822,52.61764705882353},{197.14117647058822,52.61764705882353},{197.14117647058822,56.617647058823536},{202.14117647058822,56.617647058823536}},color = {0,0,255}));
                    connect(nEC_CableModelDC6[j].n,mel_phaseC[j].p) annotation(Line(points = {{222.14117647058822,56.617647058823536},{230.14117647058822,56.617647058823536},{230.14117647058822,48.61764705882353},{238.14117647058822,48.61764705882353}},color = {0,0,255}));
                    connect(mel_phaseC[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,48.61764705882353},{264.1411764705882,48.61764705882353},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));

                 end for;
            end if;
            connect(nEC_CableModel15.pin_n,nEC_CableModel12[i].pin_p) annotation(Line(points = {{132.14117647058822,55.117647058823536},{142.14117647058822,55.117647058823536}},color = {117,80,123}));
            connect(nEC_CableModel12[i].pin_n,melconv_phaseC[i].hPin_L) annotation(Line(points = {{162.14117647058822,55.117647058823536},{167.14117647058822,55.117647058823536},{167.14117647058822,52.61764705882353},{172.14117647058822,52.61764705882353}},color = {117,80,123}));
            connect(melconv_phaseC[i].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,36.61764705882353},{192.14117647058822,32},{280.1411764705882,32},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
            connect(melconv_phaseC[i].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,36.61764705882353},{166.14117647058822,36.61764705882353},{166.14117647058822,40},{166,40},{166,34}},color = {117,80,123}));
         end for;
    connect(voltageSource.pinN,ground.pin) annotation(Line(points = {{-70,-24.200000000000003},{-70,-33.1},{-50,-33.1},{-50,-42}},color = {117,80,123}));
    connect(voltageSource.pinP_phA,d1Y.pinPrim_A) annotation(Line(points = {{-60,-6},{-60,6},{-38,6},{-38,0}},color = {92,53,102}));
    connect(voltageSource.pinP_phB,d1Y.pinPrim_B) annotation(Line(points = {{-60,-14},{-49,-14},{-49,-10},{-38,-10}},color = {92,53,102}));
    connect(voltageSource.pinP_phC,d1Y.pinPrim_C) annotation(Line(points = {{-60,-22},{-60,-28},{-38,-28},{-38,-20}},color = {92,53,102}));
    connect(d1Y.pinSec_N,ground.pin) annotation(Line(points = {{-18,-22},{-12,-22},{-12,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(d1Y.pinSec_A,nEC_CableModel7.pin_p) annotation(Line(points = {{-18,2},{-5,2},{-5,30},{8,30}},color = {92,53,102}));
    connect(d1Y.pinSec_B,nEC_CableModel8.pin_p) annotation(Line(points = {{-18,-6},{-6,-6},{-6,-14.75},{6,-14.75}},color = {92,53,102}));
    connect(d1Y.pinSec_C,nEC_CableModel9.pin_p) annotation(Line(points = {{-18,-14},{-8,-14},{-8,-48.75},{2,-48.75}},color = {92,53,102}));
    connect(aCload.hPin_N,d1Y.pinSec_N) annotation(Line(points = {{-9.571428571428577,44.31428571428572},{-9.571428571428577,-22},{-18,-22}},color = {117,80,123}));
    connect(aCload.hPin_C,d1Y.pinSec_C) annotation(Line(points = {{-12.171428571428576,44.314285714285724},{-12.171428571428576,38.314285714285724},{-12,38.314285714285724},{-12,-14},{-18,-14}},color = {92,53,102}));
    connect(aCload.hPin_B,d1Y.pinSec_B) annotation(Line(points = {{-14.171428571428576,44.31428571428572},{-14.171428571428576,38.31428571428572},{-12,38.31428571428572},{-12,-6},{-18,-6}},color = {92,53,102}));
    connect(aCload.hPin_A,d1Y.pinSec_A) annotation(Line(points = {{-16.171428571428578,44.314285714285724},{-16.171428571428578,38.314285714285724},{-12,38.314285714285724},{-12,2},{-18,2}},color = {92,53,102}));
    connect(nEC_CableModel13.pin_p,d1Y.pinSec_A) annotation(Line(points = {{118.14117647058822,129.11764705882354},{50.07058823529411,129.11764705882354},{50.07058823529411,2},{-18,2}},color = {92,53,102}));
    connect(nEC_CableModel14.pin_p,d1Y.pinSec_B) annotation(Line(points = {{116.14117647058822,89.11764705882354},{49.07058823529411,89.11764705882354},{49.07058823529411,-6},{-18,-6}},color = {92,53,102}));
    connect(nEC_CableModel15.pin_p,d1Y.pinSec_C) annotation(Line(points = {{112.14117647058822,55.117647058823536},{47.07058823529411,55.117647058823536},{47.07058823529411,-14},{-18,-14}},color = {92,53,102}));
    
  
   
end medoff_template_1_womelxmer;
