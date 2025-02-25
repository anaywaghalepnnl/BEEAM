within HPF.Templates.Examples;

model medoff_template_2
    inner parameter Real PF = 0.95;
    inner parameter Real PF1 = tan(acos(PF));
    parameter Real Vs = 7200;
    parameter Real kp = 3;
    parameter Real ks = 1;
    parameter Real km = 3;
    parameter Integer nconverter_lumA = modelData.nconverter_lumA;
    parameter Integer nconverter_lumB = modelData.nconverter_lumB;
    parameter Integer nconverter_lumC = modelData.nconverter_lumC;
    
    replaceable parameter .HPF.Templates.Data.Examples.medium_office_SD modelData annotation(Placement(transformation(extent = {{-86.0,74.0},{-66.0,94.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    //Transformer
    .HPF.Transformers.ThreePhase.Symmetric.D1Y d1Y(
        VPrimRated=12470,
        VSecRated=480,
        Rc=110450.1*km,
        Rp=0.43785*kp,
        Rs=0.0006488*ks,
        Xm=10366.7*km,
        Xp=4.4882*kp,
        Xs=0.00665*ks) annotation(Placement(transformation(extent = {{-38.0,-20.0},{-18.0,0.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    //Voltage source
    .HPF.Sources.ThreePhase.VoltageSource voltageSource(
        vArg_phA={0},
        vArg_phB={-2.0944},
        vArg_phC={2.0944},
        vMag_phA={Vs},
        vMag_phB={Vs},
        vMag_phC={Vs}) annotation(Placement(transformation(extent = {{-78.0,-22.0},{-62.0,-6.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    //PV
    .HPF.Sources.DC.FixedVoltage_VariablePower fixedVoltage_VariablePower(v_out = 660) annotation(Placement(transformation(extent = {{-10.0,10.0},{10.0,-10.0}},origin = {-68.0,-76.0},rotation = -90.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true,tableName = "pv_profile",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/pv_san_diego_roof.txt"),timeScale = 1,smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments,extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation(Placement(transformation(extent = {{-106,-86},{-86,-66}},origin = {0,0},rotation = 0)));
    
    //PV inverter
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
    .HPF.Cables.NEC_CableModel nEC_CableModel2(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(transformation(extent = {{-21.042887840438844,-71.04288784043885},{-10.957112159561156,-60.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel3(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(transformation(extent = {{-21.042887840438844,-77.04288784043885},{-10.957112159561156,-66.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel4(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(transformation(extent = {{-21.042887840438844,-83.04288784043885},{-10.957112159561156,-72.95711215956115}},origin = {0.0,0.0},rotation = 0.0)));
    
    //grounds
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{-58.0,-58.0},{-42.0,-42.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{163.92422722805057,-30.07577277194942},{176.07577277194943,-17.92422722805058}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground3 annotation(Placement(transformation(extent = {{44.0,-98.0},{60.0,-82.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground4 annotation(Placement(transformation(extent = {{-64,-120},{-44,-100}},origin = {0,0},rotation = 0)));
    
    //AC load
    .HPF.Templates.ACload aCload(ac_schedule(tableName = "Mechanical",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-Mechanical_LP.txt"),timeScale = 3600),aC_LoadIdealWye(P_nom = 100,V_nom = 277)) annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {-12.0,52.0},rotation = 90.0)));
    
    
    //Lighting load Phase A
    .HPF.Cables.NEC_CableModel accable_phaseA annotation(Placement(transformation(extent = {{1.2125449912996267,-4.78745500870037},{14.787455008700373,8.78745500870037}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel accable_lumA[nconverter_lumA] annotation(Placement(transformation(extent = {{20.0,-8.0},{40.0,12.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseA[nconverter_lumA](VDC_nom=modelData.lumconv_phaseA.V_Rect,
    P_nom=modelData.lumconv_phaseA.nomP,
    VAC_nom=modelData.lumconv_phaseA.nomV,
    vAngle=modelData.lumconv_phaseA.vAngle,
    P_stby=modelData.lumconv_phaseA.P_stby,
    P_DCmin=modelData.lumconv_phaseA.P_DCmin,
    alpha = modelData.lumconv_phaseA.alpha,
    beta = modelData.lumconv_phaseA.beta,
    gamma = modelData.lumconv_phaseA.gamma) annotation(Placement(transformation(extent = {{58,-16},{78,4}},origin = {0,0},rotation = 0)));
    
    .HPF.Cables.NEC_CableModelDC dccable_lumA[modelData.nStepDown_lumA] annotation(Placement(transformation(extent = {{88.0,4.0},{108.0,24.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.Templates.LoadwStepDown lum_phaseA[modelData.nStepDown_lumA](redeclare .HPF.DC.DC2DC_Converters.StepDown dcdc_Converter, modelData = modelData.lum_phaseA) annotation(Placement(transformation(extent = {{126.0,-4.0},{146.0,16.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    //Lighting load Phase B
    .HPF.Cables.NEC_CableModel accable_phaseB annotation(Placement(transformation(extent = {{6.357625860849144,-35.64237413915085},{21.642374139150856,-20.357625860849147}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel accable_lumB[nconverter_lumB] annotation(Placement(transformation(extent = {{32.19999999999999,-38.849999999999994},{52.19999999999999,-18.849999999999998}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseB[nconverter_lumB](gamma = modelData.lumconv_phaseB.gamma,beta = modelData.lumconv_phaseB.beta,alpha = modelData.lumconv_phaseB.alpha,P_DCmin = modelData.lumconv_phaseB.P_DCmin,P_stby = modelData.lumconv_phaseB.P_stby,vAngle = modelData.lumconv_phaseB.vAngle,VAC_nom = modelData.lumconv_phaseB.nomV,P_nom = modelData.lumconv_phaseB.nomP,VDC_nom = modelData.lumconv_phaseB.V_Rect) annotation(Placement(transformation(extent = {{60.19999999999999,-47.349999999999994},{80.19999999999999,-27.349999999999994}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.Cables.NEC_CableModelDC dccable_lumB[modelData.nStepDown_lumB] annotation(Placement(transformation(extent = {{90.19999999999999,-35.349999999999994},{110.19999999999999,-15.349999999999998}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.Templates.LoadwStepDown lum_phaseB[modelData.nStepDown_lumB](modelData = modelData.lum_phaseB,redeclare replaceable .HPF.DC.DC2DC_Converters.StepDown dcdc_Converter) annotation(Placement(transformation(extent = {{126.19999999999999,-43.349999999999994},{146.2,-23.349999999999994}},origin = {0.0,0.0},rotation = 0.0)));
    
    //Lighting load Phase C
    .HPF.Cables.NEC_CableModel accable_phaseC annotation(Placement(transformation(extent = {{1.9015270193247744,-72.09847298067523},{18.098472980675226,-55.901527019324774}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel accable_lumC[nconverter_lumC] annotation(Placement(transformation(extent = {{30.19999999999999,-72.1},{50.19999999999999,-52.099999999999994}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple lumconv_phaseC[nconverter_lumC](gamma = modelData.lumconv_phaseC.gamma,beta = modelData.lumconv_phaseC.beta,alpha = modelData.lumconv_phaseC.alpha,P_DCmin = modelData.lumconv_phaseC.P_DCmin,P_stby = modelData.lumconv_phaseC.P_stby,vAngle = modelData.lumconv_phaseC.vAngle,VAC_nom = modelData.lumconv_phaseC.nomV,P_nom = modelData.lumconv_phaseC.nomP,VDC_nom = modelData.lumconv_phaseC.V_Rect) annotation(Placement(transformation(extent = {{60.19999999999999,-82.1},{80.19999999999999,-62.099999999999994}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.Cables.NEC_CableModelDC dccable_lumC[modelData.nStepDown_lumC] annotation(Placement(transformation(extent = {{90.19999999999999,-70.6},{110.19999999999999,-50.599999999999994}},origin = {0.0,0.0},rotation = 0.0)));
    
    .HPF.Templates.LoadwStepDown lum_phaseC[modelData.nStepDown_lumC](modelData = modelData.lum_phaseC,redeclare replaceable .HPF.DC.DC2DC_Converters.StepDown dcdc_Converter) annotation(Placement(transformation(extent = {{126.19999999999999,-78.6},{146.2,-58.599999999999994}},origin = {0.0,0.0},rotation = 0.0)));
    inner .HPF.SystemDef systemDef annotation(Placement(transformation(extent = {{-102,32},{-74,56}},origin = {0,0},rotation = 0)));
    
    
equation
        for i in 1:nconverter_lumA loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_lumA[1:(i-1)])+1):(sum(modelData.stepDown_indices_lumA[1:(i-1)])+modelData.stepDown_indices_lumA[i]) loop
                       connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{138,-4},{170,-4},{170,-17.92422722805058}},color = {0,0,255}));
                       connect(dccable_lumA[j].n,lum_phaseA[j].p) annotation(Line(points = {{108,14},{113,14},{113,10},{122,10}},color = {0,0,255}));
                       connect(lumconv_phaseA[i].pin_p,dccable_lumA[j].p) annotation(Line(points = {{78,2},{88,2},{88,14}},color = {0,0,255}));
                 end for;
             else
                 for j in (1:modelData.stepDown_indices_lumA[1]) loop
                       connect(lum_phaseA[j].n,ground2.p) annotation(Line(points = {{138,-4},{170,-4},{170,-17.92422722805058}},color = {0,0,255}));
                       connect(dccable_lumA[j].n,lum_phaseA[j].p) annotation(Line(points = {{108,14},{113,14},{113,10},{122,10}},color = {0,0,255}));
                       connect(lumconv_phaseA[1].pin_p,dccable_lumA[j].p) annotation(Line(points = {{78,2},{88,2},{88,14}},color = {0,0,255}));
                 end for;
            end if;
            connect(accable_phaseA.pin_n,accable_lumA[i].pin_p) annotation(Line(points = {{14.787455008700373,2},{20,2}},color = {92,53,102}));
            connect(accable_lumA[i].pin_n,lumconv_phaseA[i].hPin_L) annotation(Line(points = {{34,2},{58,2}},color = {117,80,123}));
            connect(lumconv_phaseA[i].pin_n,ground2.p) annotation(Line(points = {{78,-14},{84,-14},{84,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
            connect(lumconv_phaseA[i].hPin_N,ground3.pin) annotation(Line(points = {{58,-14},{52,-14},{52,-82}},color = {117,80,123}));
         end for;

         for i in 1:nconverter_lumB loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_lumB[1:(i-1)])+1):(sum(modelData.stepDown_indices_lumB[1:(i-1)])+modelData.stepDown_indices_lumB[i]) loop
                       connect(lumconv_phaseB[i].pin_p,dccable_lumB[j].p) annotation(Line(points = {{80.19999999999999,-29.349999999999994},{85.19999999999999,-29.349999999999994},{85.19999999999999,-25.349999999999994},{90.19999999999999,-25.349999999999994}},color = {0,0,255}));
                       connect(dccable_lumB[j].n,lum_phaseB[j].p) annotation(Line(points = {{110.19999999999999,-25.349999999999994},{118.19999999999999,-25.349999999999994},{118.19999999999999,-33.349999999999994},{126.19999999999999,-33.349999999999994}},color = {0,0,255}));
                       connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{146.2,-33.349999999999994},{152.2,-33.349999999999994},{152.2,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                 end for;
             else
                 for j in (1:modelData.stepDown_indices_lumB[1]) loop
                       connect(lumconv_phaseB[1].pin_p,dccable_lumB[j].p) annotation(Line(points = {{80.19999999999999,-29.349999999999994},{85.19999999999999,-29.349999999999994},{85.19999999999999,-25.349999999999994},{90.19999999999999,-25.349999999999994}},color = {0,0,255}));
                       connect(dccable_lumB[j].n,lum_phaseB[j].p) annotation(Line(points = {{110.19999999999999,-25.349999999999994},{118.19999999999999,-25.349999999999994},{118.19999999999999,-33.349999999999994},{126.19999999999999,-33.349999999999994}},color = {0,0,255}));
                       connect(lum_phaseB[j].n,ground2.p) annotation(Line(points = {{146.2,-33.349999999999994},{152.2,-33.349999999999994},{152.2,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                 end for;
            end if;
            connect(accable_phaseB.pin_n,accable_lumB[i].pin_p) annotation(Line(points = {{21.642374139150856,-28},{26.921187069575424,-28},{26.921187069575424,-28.849999999999994},{32.19999999999999,-28.849999999999994}},color = {117,80,123}));
            connect(accable_lumB[i].pin_n,lumconv_phaseB[i].hPin_L) annotation(Line(points = {{52.19999999999999,-28.849999999999994},{56.19999999999999,-28.849999999999994},{56.19999999999999,-29.349999999999994},{60.19999999999999,-29.349999999999994}},color = {117,80,123}));
            connect(lumconv_phaseB[i].pin_n,ground2.p) annotation(Line(points = {{80.19999999999999,-45.349999999999994},{170,-45.349999999999994},{170,-17.92422722805058}},color = {0,0,255}));
            connect(lumconv_phaseB[i].hPin_N,ground3.pin) annotation(Line(points = {{60.19999999999999,-45.349999999999994},{52,-45.349999999999994},{52,-82}},color = {117,80,123}));
         end for;

         for i in 1:nconverter_lumC loop
            if i>1 then
                 for j in (sum(modelData.stepDown_indices_lumC[1:(i-1)])+1):(sum(modelData.stepDown_indices_lumC[1:(i-1)])+modelData.stepDown_indices_lumC[i]) loop
                       connect(lumconv_phaseC[i].pin_p,dccable_lumC[j].p) annotation(Line(points = {{80.19999999999999,-64.1},{85.19999999999999,-64.1},{85.19999999999999,-60.599999999999994},{90.19999999999999,-60.599999999999994}},color = {0,0,255}));
                       connect(dccable_lumC[j].n,lum_phaseC[j].p) annotation(Line(points = {{110.19999999999999,-60.599999999999994},{118.19999999999999,-60.599999999999994},{118.19999999999999,-68.6},{126.19999999999999,-68.6}},color = {0,0,255}));
                       connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{146.2,-68.6},{152.2,-68.6},{152.2,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                 end for;
             else
                 for j in (1:modelData.stepDown_indices_lumC[1]) loop
                       connect(lumconv_phaseC[1].pin_p,dccable_lumC[j].p) annotation(Line(points = {{80.19999999999999,-64.1},{85.19999999999999,-64.1},{85.19999999999999,-60.599999999999994},{90.19999999999999,-60.599999999999994}},color = {0,0,255}));
                       connect(dccable_lumC[j].n,lum_phaseC[j].p) annotation(Line(points = {{110.19999999999999,-60.599999999999994},{118.19999999999999,-60.599999999999994},{118.19999999999999,-68.6},{126.19999999999999,-68.6}},color = {0,0,255}));
                       connect(lum_phaseC[j].n,ground2.p) annotation(Line(points = {{146.2,-68.6},{152.2,-68.6},{152.2,-11.92422722805058},{170,-11.92422722805058},{170,-17.92422722805058}},color = {0,0,255}));
                 end for;

            end if;
            connect(accable_phaseC.pin_n,accable_lumC[i].pin_p) annotation(Line(points = {{18.098472980675226,-64},{24.149236490337607,-64},{24.149236490337607,-62.099999999999994},{30.19999999999999,-62.099999999999994}},color = {117,80,123}));
            connect(accable_lumC[i].pin_n,lumconv_phaseC[i].hPin_L) annotation(Line(points = {{50.19999999999999,-62.099999999999994},{55.19999999999999,-62.099999999999994},{55.19999999999999,-64.1},{60.19999999999999,-64.1}},color = {117,80,123}));
            
            connect(lumconv_phaseC[i].pin_n,ground2.p) annotation(Line(points = {{80.19999999999999,-80.1},{170,-80.1},{170,-17.92422722805058}},color = {0,0,255}));
            connect(lumconv_phaseC[i].hPin_N,ground3.pin) annotation(Line(points = {{60.19999999999999,-80.1},{54.19999999999999,-80.1},{54.19999999999999,-76},{52,-76},{52,-82}},color = {117,80,123}));
         end for;


    connect(voltageSource.pinP_phA,d1Y.pinPrim_A) annotation(Line(points = {{-60,-6},{-60,6},{-38,6},{-38,0}},color = {92,53,102}));
    connect(voltageSource.pinP_phB,d1Y.pinPrim_B) annotation(Line(points = {{-60,-14},{-49,-14},{-49,-10},{-38,-10}},color = {92,53,102}));
    connect(voltageSource.pinP_phC,d1Y.pinPrim_C) annotation(Line(points = {{-60,-22},{-60,-28},{-38,-28},{-38,-20}},color = {92,53,102}));
    connect(voltageSource.pinN,ground.pin) annotation(Line(points = {{-70,-24.200000000000003},{-70,-33.1},{-50,-33.1},{-50,-42}},color = {117,80,123}));
    connect(d1Y.pinSec_N,ground.pin) annotation(Line(points = {{-18,-22},{-12,-22},{-12,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(aCDC_3pInverterSimple.hPin_A,nEC_CableModel2.pin_p) annotation(Line(points = {{-28,-66},{-21.042887840438844,-66}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_B,nEC_CableModel3.pin_p) annotation(Line(points = {{-28,-71},{-24.521443920219422,-71},{-24.521443920219422,-72},{-21.042887840438844,-72}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_C,nEC_CableModel4.pin_p) annotation(Line(points = {{-28,-76},{-24.521443920219422,-76},{-24.521443920219422,-78},{-21.042887840438844,-78}},color = {92,53,102}));
    connect(aCDC_3pInverterSimple.hPin_N,ground.pin) annotation(Line(points = {{-28,-82},{-22,-82},{-22,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(fixedVoltage_VariablePower.p,aCDC_3pInverterSimple.pin_p) annotation(Line(points = {{-68,-66},{-68,-60},{-54,-60},{-54,-66},{-48,-66}},color = {0,0,255}));
    connect(fixedVoltage_VariablePower.n,aCDC_3pInverterSimple.pin_n) annotation(Line(points = {{-68,-86},{-68,-92},{-54,-92},{-54,-82},{-48,-82}},color = {0,0,255}));
    connect(aCDC_3pInverterSimple.pin_n,ground4.p) annotation(Line(points = {{-48,-82},{-54,-82},{-54,-100}},color = {0,0,255}));
    connect(combiTimeTable.y[1],fixedVoltage_VariablePower.p_out) annotation(Line(points = {{-85,-76},{-76,-76}},color = {0,0,127}));
    connect(nEC_CableModel2.pin_n,d1Y.pinSec_A) annotation(Line(points = {{-10.957112159561156,-66},{-4,-66},{-4,2},{-18,2}},color = {117,80,123}));
    connect(nEC_CableModel3.pin_n,d1Y.pinSec_B) annotation(Line(points = {{-10.957112159561156,-72},{-4.957112159561156,-72},{-4.957112159561156,-6},{-18,-6}},color = {117,80,123}));
    connect(nEC_CableModel4.pin_n,d1Y.pinSec_C) annotation(Line(points = {{-10.957112159561156,-78},{-4.957112159561156,-78},{-4.957112159561156,-14},{-18,-14}},color = {117,80,123}));
    connect(aCload.hPin_A,d1Y.pinSec_A) annotation(Line(points = {{-13.600000000000003,36.6},{-13.600000000000003,2},{-18,2}},color = {92,53,102}));
    connect(aCload.hPin_B,d1Y.pinSec_B) annotation(Line(points = {{-11.600000000000003,36.599999999999994},{-11.600000000000003,-6},{-18,-6}},color = {92,53,102}));
    connect(aCload.hPin_C,d1Y.pinSec_C) annotation(Line(points = {{-9.600000000000003,36.6},{-9.600000000000003,-14},{-18,-14}},color = {92,53,102}));
    connect(aCload.hPin_N,d1Y.pinSec_N) annotation(Line(points = {{-7.0000000000000036,36.599999999999994},{-7.0000000000000036,-22},{-18,-22}},color = {117,80,123}));
    connect(d1Y.pinSec_A,accable_phaseA.pin_p) annotation(Line(points = {{-18,2},{1.2125449912996267,2}},color = {92,53,102}));
    connect(d1Y.pinSec_B,accable_phaseB.pin_p) annotation(Line(points = {{-18,-6},{-2,-6},{-2,-28},{6.357625860849144,-28}},color = {92,53,102}));
    connect(d1Y.pinSec_C,accable_phaseC.pin_p) annotation(Line(points = {{-18,-14},{-2,-14},{-2,-64},{1.9015270193247744,-64}},color = {92,53,102}));

end medoff_template_2;
