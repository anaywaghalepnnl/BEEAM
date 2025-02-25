within HPF.Templates.Examples;
model medoff_template
    inner parameter Real PF = 0.95;
    inner parameter Real PF1 = tan(acos(PF));
    parameter Real Vs = 7200;
    parameter Real kp = 3;
    parameter Real ks = 1;
    parameter Real km = 3;
    parameter Real nconverter[6] = modelData.nconverter;
    
    .HPF.Templates.LoadwStepDown lum_phaseA[modelData.nStepDown_lumA](redeclare replaceable HPF.DC.DC2DC_Converters.StepDown dcdc_Converter, modelData=
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
//     .HPF.Cables.NEC_CableModelDC nEC_CableModelDC[modelData.nStepDown[1]] annotation(Placement(transformation(extent = {{105.55175207170122,17.55175207170121},{118.44824792829878,30.44824792829879}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.DC.FixedVoltage_VariablePower fixedVoltage_VariablePower(v_out = 660) annotation(Placement(transformation(extent = {{-10.0,10.0},{10.0,-10.0}},origin = {-68.0,-76.0},rotation = -90.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true,tableName = "pv_schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/PV_schedule_kW.txt")) annotation(Placement(transformation(extent = {{-106,-86},{-86,-66}},origin = {0,0},rotation = 0)));
    .HPF.PowerConverters.ThreePhase.ACDC_3pInverterSimple aCDC_3pInverterSimple(
        vAngle=0,
        PF=+0.95,
        P_nom=175000,
        P_stby=1,
        VAC_nom=277,
        VDC_nom=660,
        alpha=0.004799349,
        beta=0.010598212,
        gamma=0.016227353,
        Q1(start=0)) annotation(Placement(transformation(extent = {{-28.0,-84.0},{-48.0,-64.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel2(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(transformation(extent = {{-21.042887840438844,-71.04288784043885},{-10.957112159561156,-60.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel3(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(transformation(extent = {{-21.042887840438844,-77.04288784043885},{-10.957112159561156,-66.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel4(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(transformation(extent = {{-21.042887840438844,-83.04288784043885},{-10.957112159561156,-72.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{-58.0,-58.0},{-42.0,-42.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{163.92422722805057,-30.07577277194942},{176.07577277194943,-17.92422722805058}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.ACload aCload(ac_schedule(tableName = "ac_schedule",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://HPF/Data/load_profiles/AC_schedule_kW.txt")),gain(k = 1),aC_LoadIdealWye(P_nom = 100,V_nom = 277)) annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {-12.0,60.0},rotation = 90.0)));
//     .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseB[modelData.nconverter[2]](VDC_nom=modelData.lumconv_phaseB.V_Rect,
//     P_nom=modelData.lumconv_phaseB.nomP,
//     VAC_nom=modelData.lumconv_phaseB.nomV,
//     vAngle=modelData.lumconv_phaseB.vAngle,
//     P_stby=modelData.lumconv_phaseB.P_stby,
//     P_DCmin=modelData.lumconv_phaseB.P_DCmin,
//     alpha = modelData.lumconv_phaseB.alpha,
//     beta = modelData.lumconv_phaseB.beta,
//     gamma = modelData.lumconv_phaseB.gamma) annotation(Placement(transformation(extent = {{62.0,-32.5},{82.0,-12.5}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModelDC nEC_CableModelDC2[modelData.nStepDown[2]] annotation(Placement(transformation(extent = {{104.21443424287189,-13.78556575712811},{119.78556575712811,1.7855657571281096}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Templates.LoadwStepDown lum_phaseB[modelData.nStepDown[2]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
//          modelData.lum_phaseB) annotation(Placement(transformation(extent = {{128.0,-28.5},{148.0,-8.5}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseC[modelData.nconverter[3]](VDC_nom=modelData.lumconv_phaseC.V_Rect,
//     P_nom=modelData.lumconv_phaseC.nomP,
//     VAC_nom=modelData.lumconv_phaseC.nomV,
//     vAngle=modelData.lumconv_phaseC.vAngle,
//     P_stby=modelData.lumconv_phaseC.P_stby,
//     P_DCmin=modelData.lumconv_phaseC.P_DCmin,
//     alpha = modelData.lumconv_phaseC.alpha,
//     beta = modelData.lumconv_phaseC.beta,
//     gamma = modelData.lumconv_phaseC.gamma) annotation(Placement(transformation(extent = {{62.0,-68.0},{82.0,-48.0}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModelDC nEC_CableModelDC3[modelData.nStepDown[3]] annotation(Placement(transformation(extent = {{108.51273323244276,-55.487266767557244},{119.48726676755724,-44.512733232442756}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Templates.LoadwStepDown lum_phaseC[modelData.nStepDown[3]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
//          modelData.lum_phaseC) annotation(Placement(transformation(extent = {{128.0,-64.5},{148.0,-44.5}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground3 annotation(Placement(transformation(extent = {{44.0,-98.0},{60.0,-82.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground4 annotation(Placement(transformation(extent = {{-64,-120},{-44,-100}},origin = {0,0},rotation = 0)));
//     .HPF.Cables.NEC_CableModel nEC_CableModel8(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_14) annotation(Placement(transformation(extent = {{12.0,-24.0},{32.0,-4.0}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModel nEC_CableModel9(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_14) annotation(Placement(transformation(extent = {{20.0,-60.0},{40.0,-40.0}},origin = {0.0,0.0},rotation = 0.0)));
//     inner .HPF.SystemDef systemDef annotation(Placement(transformation(extent = {{-90,44},{-62,68}},origin = {0,0},rotation = 0)));
//     .HPF.Templates.LoadwStepDown mel_phaseA[modelData.nStepDown[4]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
//          modelData.mel_phaseA) annotation(Placement(transformation(extent = {{239.3411764705882,113.11764705882354},{259.3411764705882,133.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseA[modelData.nconverter[4]](VDC_nom=modelData.melconv_phaseA.V_Rect,
//     P_nom=modelData.melconv_phaseA.nomP,
//     VAC_nom=modelData.melconv_phaseA.nomV,
//     vAngle=modelData.melconv_phaseA.vAngle,
//     P_stby=modelData.melconv_phaseA.P_stby,
//     P_DCmin=modelData.melconv_phaseA.P_DCmin,
//     alpha = modelData.melconv_phaseA.alpha,
//     beta = modelData.lumconv_phaseA.beta,
//     gamma = modelData.lumconv_phaseA.gamma) annotation(Placement(transformation(extent = {{173.3411764705882,109.11764705882354},{193.3411764705882,129.11764705882354}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModelDC nEC_CableModelDC4[modelData.nStepDown[4]] annotation(Placement(transformation(extent = {{214.0,122.0},{234.0,142.0}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.DC.Ground ground5 annotation(Placement(transformation(extent = {{274.06540369863876,73.04187428687412},{286.2169492425377,85.19341983077295}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseB[modelData.nconverter[5]](VDC_nom=modelData.melconv_phaseB.V_Rect,
//     P_nom=modelData.melconv_phaseB.nomP,
//     VAC_nom=modelData.melconv_phaseB.nomV,
//     vAngle=modelData.melconv_phaseB.vAngle,
//     P_stby=modelData.melconv_phaseB.P_stby,
//     P_DCmin=modelData.melconv_phaseB.P_DCmin,
//     alpha = modelData.melconv_phaseB.alpha,
//     beta = modelData.lumconv_phaseB.beta,
//     gamma = modelData.lumconv_phaseB.gamma) annotation(Placement(transformation(extent = {{172.14117647058822,70.61764705882354},{192.14117647058822,90.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModelDC nEC_CableModelDC5[modelData.nStepDown[5]] annotation(Placement(transformation(extent = {{216.0,82.0},{236.0,102.0}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Templates.LoadwStepDown mel_phaseB[modelData.nStepDown[5]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
//          modelData.mel_phaseB) annotation(Placement(transformation(extent = {{238.14117647058822,74.61764705882354},{258.1411764705882,94.61764705882354}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple melconv_phaseC[modelData.nconverter[6]](VDC_nom=modelData.melconv_phaseC.V_Rect,
//     P_nom=modelData.melconv_phaseC.nomP,
//     VAC_nom=modelData.melconv_phaseC.nomV,
//     vAngle=modelData.melconv_phaseC.vAngle,
//     P_stby=modelData.melconv_phaseC.P_stby,
//     P_DCmin=modelData.melconv_phaseC.P_DCmin,
//     alpha = modelData.melconv_phaseC.alpha,
//     beta = modelData.lumconv_phaseC.beta,
//     gamma = modelData.lumconv_phaseC.gamma) annotation(Placement(transformation(extent = {{172.14117647058822,34.61764705882353},{192.14117647058822,54.61764705882353}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModelDC nEC_CableModelDC6[modelData.nStepDown[6]] annotation(Placement(transformation(extent = {{216.0,46.0},{236.0,66.0}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Templates.LoadwStepDown mel_phaseC[modelData.nStepDown[6]](redeclare replaceable HPF.DC.DC2DC_Converters.DummyShort dcdc_Converter, modelData=
//          modelData.mel_phaseC) annotation(Placement(transformation(extent = {{238.14117647058822,38.61764705882353},{258.1411764705882,58.61764705882353}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModel nEC_CableModel13(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_14) annotation(Placement(transformation(extent = {{138.0,116.0},{158.0,136.0}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModel nEC_CableModel14(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_14) annotation(Placement(transformation(extent = {{142.0,80.0},{162.0,100.0}},origin = {0.0,0.0},rotation = 0.0)));
//     .HPF.Cables.NEC_CableModel nEC_CableModel15(wireGaugeAC = HPF.Types.WireGaugeAC.gauge_14) annotation(Placement(transformation(extent = {{132.0,46.0},{152.0,66.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground6 annotation(Placement(transformation(extent = {{82.0,34.0},{98.0,50.0}},origin = {0.0,0.0},rotation = 0.0)));
    replaceable parameter .HPF.Templates.Data.Examples.medium_office modelData annotation(Placement(transformation(extent = {{-86.0,74.0},{-66.0,94.0}},origin = {0.0,0.0},rotation = 0.0)));
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
    .HPF.Cables.NEC_CableModel nEC_CableModel7 annotation(Placement(transformation(extent = {{16,18},{36,38}},origin = {0,0},rotation = 0)));
// //     .Modelica.Electrical.Analog.Basic.Resistor resistor[modelData.nStepDown[1]](R = 0) annotation(Placement(transformation(extent = {{91.57609390902562,19.576093909025616},{100.42390609097438,28.423906090974384}},origin = {0.0,0.0},rotation = 0.0)));
//     .Modelica.Electrical.Analog.Basic.Resistor resistor2[modelData.nStepDown[2]](R = 0) annotation(Placement(transformation(extent = {{89.57609390902562,-10.423906090974384},{98.42390609097438,-1.5760939090256159}},origin = {0.0,0.0},rotation = 0.0)));
//     .Modelica.Electrical.Analog.Basic.Resistor resistor3[modelData.nStepDown[3]](R = 0) annotation(Placement(transformation(extent = {{89.57609390902562,-54.423906090974384},{98.42390609097438,-45.576093909025616}},origin = {0.0,0.0},rotation = 0.0)));
//     .Modelica.Electrical.Analog.Basic.Resistor resistor4[modelData.nStepDown[4]](R = 0) annotation(Placement(transformation(extent = {{197.57609390902562,127.57609390902562},{206.42390609097438,136.42390609097438}},origin = {0.0,0.0},rotation = 0.0)));
//     .Modelica.Electrical.Analog.Basic.Resistor resistor5[modelData.nStepDown[5]](R = 0) annotation(Placement(transformation(extent = {{199.57609390902562,87.57609390902562},{208.42390609097438,96.42390609097438}},origin = {0.0,0.0},rotation = 0.0)));
//     .Modelica.Electrical.Analog.Basic.Resistor resistor6[modelData.nStepDown[6]](R = 0) annotation(Placement(transformation(extent = {{199.57609390902562,49.576093909025616},{208.42390609097438,58.423906090974384}},origin = {0.0,0.0},rotation = 0.0)));
equation
        for i in 1:modelData.nconverter_lumA loop
            stepdown = modelData.stepDown_indices_lumA;
            if i>1 then
                 for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
                       connect(lumconv_phaseA[i].pin_p,lum_phaseA[j].p) annotation(Line(points = {{83.19999999999999,24},{91.57609390902562,24}},color = {0,0,255}));   
                       connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{149.2,20},{170,20},{170,-17.92422722805058}},color = {0,0,255}));
//                        connect(resistor[j].n,lum_phaseA[j].p) annotation(Line(points = {{100.42390609097438,24},{105.55175207170122,24}},color = {0,0,255}));
                 end for;
             else
                 for j in (1:stepdown[1]) loop
                       connect(lumconv_phaseA[1].pin_p,lum_phaseA[j].p) annotation(Line(points = {{83.19999999999999,24},{91.57609390902562,24}},color = {0,0,255}));   
                       connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{149.2,20},{170,20},{170,-17.92422722805058}},color = {0,0,255}));
//                        connect(resistor[j].n,lum_phaseA[j].p) annotation(Line(points = {{100.42390609097438,24},{105.55175207170122,24}},color = {0,0,255}));
                 end for;

            end if;
            connect(nEC_CableModel7.pin_n,lumconv_phaseA[i].hPin_L) annotation(Line(points = {{36,28},{49.599999999999994,28},{49.599999999999994,24},{63.19999999999999,24}},color = {117,80,123}));
            connect(lumconv_phaseA[1].pin_n,ground2.p) annotation(Line(points = {{83.19999999999999,8},{170,8},{170,-17.92422722805058}},color = {0,0,255}));
            connect(lumconv_phaseA[1].hPin_N,ground3.pin) annotation(Line(points = {{63.19999999999999,8},{52,8},{52,-82}},color = {117,80,123}));
         end for;

//         for i in 1:modelData.nconverter[2] loop
//             stepdown = modelData.stepDown_indices[i];
//             if i>1 then
//                  for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
//                         connect(lumconv_phaseB[i].pin_p,resistor2[j].p) annotation(Line(points = {{82,-14.5},{85.78804695451281,-14.5},{85.78804695451281,-6},{89.57609390902562,-6}},color = {0,0,255}));
//                         connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{148,-18.5},{154,-18.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
//                  end for;
//             else
//                  for j in (1:stepdown[1]) loop
//                         connect(lumconv_phaseB[1].pin_p,resistor2[j].p) annotation(Line(points = {{82,-14.5},{85.78804695451281,-14.5},{85.78804695451281,-6},{89.57609390902562,-6}},color = {0,0,255}));
//                         connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{148,-18.5},{154,-18.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
//                  end for;
//             end if;
//             connect(nEC_CableModel8.pin_n,lumconv_phaseB[i].hPin_L) annotation(Line(points = {{32,-14},{47,-14},{47,-14.5},{62,-14.5}},color = {117,80,123}));
//             connect(lumconv_phaseB[i].hPin_N,ground3.pin) annotation(Line(points = {{62,-30.5},{52,-30.5},{52,-82}},color = {117,80,123}));
//             connect(lumconv_phaseB[i].pin_n,ground2.p) annotation(Line(points = {{82,-30.5},{88,-30.5},{88,-34},{170,-34},{170,-17.92422722805058}},color = {0,0,255}));
//          end for;

//          for i in 1:modelData.nconverter[3] loop
//             stepdown = modelData.stepDown_indices[i];
//             if i>1 then
//                  for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
//                     connect(lumconv_phaseC[i].pin_p,resistor3[j].p) annotation(Line(points = {{82,-50},{89.57609390902562,-50}},color = {0,0,255}));
//                     connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{148,-54.5},{154,-54.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
//                  end for;
//             else
//                  for j in (1:stepdown[1]) loop
//                     connect(lumconv_phaseC[1].pin_p,resistor3[j].p) annotation(Line(points = {{82,-50},{89.57609390902562,-50}},color = {0,0,255}));
//                     connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{148,-54.5},{154,-54.5},{154,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
//                  end for;
//             end if;
//             connect(nEC_CableModel9.pin_n,lumconv_phaseC[i].hPin_L) annotation(Line(points = {{40,-50},{62,-50}},color = {117,80,123}));
//             connect(lumconv_phaseC[i].hPin_N,ground3.pin) annotation(Line(points = {{62,-66},{52,-66},{52,-82}},color = {117,80,123}));
//             connect(lumconv_phaseC[i].pin_n,ground2.p) annotation(Line(points = {{82,-66},{88,-66},{88,-74},{170,-74},{170,-17.92422722805058}},color = {0,0,255}));
//          end for;

//          for i in 1:modelData.nconverter[4] loop
//             stepdown = modelData.stepDown_indices[i];
//             if i>1 then
//                  for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
//                     connect(melconv_phaseA[i].pin_p,resistor4[j].p) annotation(Line(points = {{193.3411764705882,127.11764705882354},{195.4586351898069,127.11764705882354},{195.4586351898069,132},{197.57609390902562,132}},color = {0,0,255}));
//                     connect(mel_phaseA[j].n,ground5.p) annotation(Line(points = {{259.3411764705882,123.11764705882354},{280.1411764705882,123.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//                  end for;
//             else
//                  for j in (1:stepdown[1]) loop
//                     connect(melconv_phaseA[1].pin_p,resistor4[j].p) annotation(Line(points = {{193.3411764705882,127.11764705882354},{195.4586351898069,127.11764705882354},{195.4586351898069,132},{197.57609390902562,132}},color = {0,0,255}));
//                     connect(mel_phaseA[j].n,ground5.p) annotation(Line(points = {{259.3411764705882,123.11764705882354},{280.1411764705882,123.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//                  end for;
//             end if;
//             connect(nEC_CableModel13.pin_n,melconv_phaseA[i].hPin_L) annotation(Line(points = {{158,126},{165.6705882352941,126},{165.6705882352941,127.11764705882354},{173.3411764705882,127.11764705882354}},color = {117,80,123}));
//             connect(melconv_phaseA[i].pin_n,ground5.p) annotation(Line(points = {{193.3411764705882,111.11764705882354},{280.1411764705882,111.11764705882354},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//             connect(melconv_phaseA[i].hPin_N,ground7.pin) annotation(Line(points = {{173.3411764705882,111.11764705882354},{166,111.11764705882354},{166,34}},color = {117,80,123}));
//          end for;
        
//          for i in 1:modelData.nconverter[5] loop
//             stepdown = modelData.stepDown_indices[i];
//             if i>1 then
//                  for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
//                     connect(melconv_phaseB[i].pin_p,resistor5[j].p) annotation(Line(points = {{192.14117647058822,88.61764705882354},{195.85863518980693,88.61764705882354},{195.85863518980693,92},{199.57609390902562,92}},color = {0,0,255}));
//                     connect(mel_phaseB[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,84.61764705882354},{264.1411764705882,84.61764705882354},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//                  end for;
//             else
//                  for j in (1:stepdown[1]) loop
//                     connect(melconv_phaseB[1].pin_p,resistor5[j].p) annotation(Line(points = {{192.14117647058822,88.61764705882354},{195.85863518980693,88.61764705882354},{195.85863518980693,92},{199.57609390902562,92}},color = {0,0,255}));
//                     connect(mel_phaseB[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,84.61764705882354},{264.1411764705882,84.61764705882354},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//                  end for;
//             end if;
//             connect(nEC_CableModel14.pin_n,melconv_phaseB[i].hPin_L) annotation(Line(points = {{162,90},{167.0705882352941,90},{167.0705882352941,88.61764705882354},{172.14117647058822,88.61764705882354}},color = {117,80,123}));
//             connect(melconv_phaseB[i].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,72.61764705882354},{198.14117647058822,72.61764705882354},{198.14117647058822,68},{280.1411764705882,68},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//             connect(melconv_phaseB[i].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,72.61764705882354},{166,72.61764705882354},{166,34}},color = {117,80,123}));
//          end for;

//          for i in 1:modelData.nconverter[6] loop
//             stepdown = modelData.stepDown_indices[i];
//             if i>1 then
//                  for j in (sum(stepdown[1:(i-1)])+1):(sum(stepdown[1:(i-1)])+stepdown[i]) loop
//                     connect(melconv_phaseC[i].pin_p,resistor6[j].p) annotation(Line(points = {{192.14117647058822,52.61764705882353},{195.85863518980693,52.61764705882353},{195.85863518980693,54},{199.57609390902562,54}},color = {0,0,255}));
//                     connect(mel_phaseC[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,48.61764705882353},{264.1411764705882,48.61764705882353},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//                  end for;
//             else
//                  for j in (1:stepdown[1]) loop
//                     connect(melconv_phaseC[1].pin_p,resistor6[j].p) annotation(Line(points = {{192.14117647058822,52.61764705882353},{195.85863518980693,52.61764705882353},{195.85863518980693,54},{199.57609390902562,54}},color = {0,0,255}));
//                     connect(mel_phaseC[j].n,ground5.p) annotation(Line(points = {{258.1411764705882,48.61764705882353},{264.1411764705882,48.61764705882353},{264.1411764705882,91.19341983077295},{280.1411764705882,91.19341983077295},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//                  end for;
//             end if;
//             connect(nEC_CableModel15.pin_n,melconv_phaseC[i].hPin_L) annotation(Line(points = {{152,56},{162.0705882352941,56},{162.0705882352941,52.61764705882353},{172.14117647058822,52.61764705882353}},color = {117,80,123}));
//             connect(melconv_phaseC[i].hPin_N,ground7.pin) annotation(Line(points = {{172.14117647058822,36.61764705882353},{166.14117647058822,36.61764705882353},{166.14117647058822,40},{166,40},{166,34}},color = {117,80,123}));
//             connect(melconv_phaseC[i].pin_n,ground5.p) annotation(Line(points = {{192.14117647058822,36.61764705882353},{192.14117647058822,30},{280.1411764705882,30},{280.1411764705882,85.19341983077295}},color = {0,0,255}));
//          end for;

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
//     connect(d1Y.pinSec_B,nEC_CableModel8.pin_p) annotation(Line(points = {{-18,-6},{-6,-6},{-6,-14},{12,-14}},color = {92,53,102}));
//     connect(d1Y.pinSec_C,nEC_CableModel9.pin_p) annotation(Line(points = {{-18,-14},{-8,-14},{-8,-50},{20,-50}},color = {92,53,102}));
    connect(aCload.hPin_A,d1Y.pinSec_A) annotation(Line(points = {{-13.600000000000003,44.6},{-13.600000000000003,2},{-18,2}},color = {92,53,102}));
    connect(aCload.hPin_B,d1Y.pinSec_B) annotation(Line(points = {{-11.600000000000003,44.599999999999994},{-11.600000000000003,-6},{-18,-6}},color = {92,53,102}));
    connect(aCload.hPin_C,d1Y.pinSec_C) annotation(Line(points = {{-9.600000000000003,44.6},{-9.600000000000003,-14},{-18,-14}},color = {92,53,102}));
    connect(aCload.hPin_N,d1Y.pinSec_N) annotation(Line(points = {{-7.0000000000000036,44.599999999999994},{-1.0000000000000036,44.599999999999994},{-1.0000000000000036,-22},{-18,-22}},color = {117,80,123}));
    connect(nEC_CableModel2.pin_n,d1Y.pinSec_A) annotation(Line(points = {{-10.957112159561156,-66},{-4.957112159561156,-66},{-4.957112159561156,2},{-18,2}},color = {117,80,123}));
    connect(nEC_CableModel3.pin_n,d1Y.pinSec_B) annotation(Line(points = {{-10.957112159561156,-72},{-4.957112159561156,-72},{-4.957112159561156,-6},{-18,-6}},color = {117,80,123}));
    connect(nEC_CableModel4.pin_n,d1Y.pinSec_N) annotation(Line(points = {{-10.957112159561156,-78},{-4.957112159561156,-78},{-4.957112159561156,-22},{-18,-22}},color = {117,80,123}));
//     connect(d1Y2.pinSec_A,nEC_CableModel13.pin_p) annotation(Line(points = {{88,108},{103.07058823529411,108},{103.07058823529411,126},{138,126}},color = {92,53,102}));
//     connect(d1Y2.pinSec_B,nEC_CableModel14.pin_p) annotation(Line(points = {{88,100},{102.07058823529411,100},{102.07058823529411,90},{142,90}},color = {92,53,102}));
//     connect(d1Y2.pinSec_C,nEC_CableModel15.pin_p) annotation(Line(points = {{88,92},{100.07058823529411,92},{100.07058823529411,56},{132,56}},color = {92,53,102}));
    connect(d1Y2.pinSec_N,ground6.pin) annotation(Line(points = {{88,84},{94,84},{94,56},{90,56},{90,50}},color = {117,80,123}));
    connect(d1Y2.pinPrim_A,d1Y.pinSec_A) annotation(Line(points = {{68,106},{-18,106},{-18,2}},color = {92,53,102}));
    connect(d1Y2.pinPrim_B,d1Y.pinSec_B) annotation(Line(points = {{68,96},{-18,96},{-18,-6}},color = {92,53,102}));
    connect(d1Y2.pinPrim_C,d1Y.pinSec_C) annotation(Line(points = {{68,86},{-18,86},{-18,-14}},color = {92,53,102}));
    connect(d1Y.pinSec_A,nEC_CableModel7.pin_p) annotation(Line(points = {{-18,2},{-1,2},{-1,28},{16,28}},color = {92,53,102}));
   
    
//     connect(nEC_CableModelDC.n,lum_phaseA.p) annotation(Line(points = {{118.44824792829878,24},{125.82412396414938,24},{125.82412396414938,20},{129.2,20}},color = {0,0,255}));
    

//     connect(resistor2.n,nEC_CableModelDC2.p) annotation(Line(points = {{98.42390609097438,-6},{104.21443424287189,-6}},color = {0,0,255}));
//     connect(nEC_CableModelDC2.n,lum_phaseB.p) annotation(Line(points = {{119.78556575712811,-6},{123.89278287856405,-6},{123.89278287856405,-18.5},{128,-18.5}},color = {0,0,255}));
    
    
//     connect(resistor3.n,nEC_CableModelDC3.p) annotation(Line(points = {{98.42390609097438,-50},{108.51273323244276,-50}},color = {0,0,255}));
//     connect(nEC_CableModelDC3.n,lum_phaseC.p) annotation(Line(points = {{119.48726676755724,-50},{123.74363338377862,-50},{123.74363338377862,-54.5},{128,-54.5}},color = {0,0,255}));
    
    
//     connect(resistor4.n,nEC_CableModelDC4.p) annotation(Line(points = {{206.42390609097438,132},{214,132}},color = {0,0,255}));
//     connect(nEC_CableModelDC4.n,mel_phaseA.p) annotation(Line(points = {{234,132},{236.6705882352941,132},{236.6705882352941,123.11764705882354},{239.3411764705882,123.11764705882354}},color = {0,0,255}));
    
    
//     connect(resistor5.n,nEC_CableModelDC5.p) annotation(Line(points = {{208.42390609097438,92},{216,92}},color = {0,0,255}));
//     connect(nEC_CableModelDC5.n,mel_phaseB.p) annotation(Line(points = {{236,92},{237.0705882352941,92},{237.0705882352941,84.61764705882354},{238.14117647058822,84.61764705882354}},color = {0,0,255}));
    
    
//     connect(resistor6.n,nEC_CableModelDC6.p) annotation(Line(points = {{208.42390609097438,54},{212.21195304548718,54},{212.21195304548718,56},{216,56}},color = {0,0,255}));
//     connect(nEC_CableModelDC6.n,mel_phaseC.p) annotation(Line(points = {{236,56},{237.0705882352941,56},{237.0705882352941,48.61764705882353},{238.14117647058822,48.61764705882353}},color = {0,0,255}));

end medoff_template;
