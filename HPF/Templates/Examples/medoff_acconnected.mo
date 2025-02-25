within HPF.Templates.Examples;

model medoff_acconnected
    inner parameter Real PF = 0.95;
    inner parameter Real PF1 = tan(acos(PF));
    parameter Real Vs = 7200;
    parameter Real kp = 3;
    parameter Real ks = 1;
    parameter Real km = 3;
    
    //Voltage source
    .HPF.Sources.ThreePhase.VoltageSource voltageSource(
        vArg_phA={0},
        vArg_phB={-2.0944},
        vArg_phC={2.0944},
        vMag_phA={Vs},
        vMag_phB={Vs},
        vMag_phC={Vs}) annotation(Placement(transformation(extent = {{-78.0,-22.0},{-62.0,-6.0}},origin = {0.0,0.0},rotation = 0.0)));
    inner .HPF.SystemDef systemDef annotation(Placement(transformation(extent = {{-102,32},{-74,56}},origin = {0,0},rotation = 0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple aCDC_1pRectifierSimple(VDC_nom = 19.5,alpha = 0.007433973,beta = 0.101408771,gamma = 0.050936187,P_nom = 20000 * 0.33,VAC_nom = 277,P_DCmin = 0) annotation(Placement(transformation(extent = {{105.25,-13.142857142857153},{125.25,6.857142857142847}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Variable_DC_Load variable_DC_Load annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {199.25,-1.142857142857153},rotation = -90.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,timeScale = 3600,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-L1_Light_LP.txt"),tableName = "L1-Core-Lights",tableOnFile = true) annotation(Placement(transformation(extent = {{190.0,58.0},{210.0,78.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{139.51542165553212,-98.87743548732503},{146.98457834446788,-91.40827879838928}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain gain4(k = 30299) annotation(Placement(transformation(extent = {{6.665957473396645,-6.665957473396645},{-6.665957473396645,6.665957473396645}},origin = {247.25,36.85714285714283},rotation = 90.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple aCDC_1pRectifierSimple3(P_DCmin = 0,VAC_nom = 277,P_nom = 20000 * 0.33,gamma = 0.050936187,beta = 0.101408771,alpha = 0.007433973,VDC_nom = 19.5) annotation(Placement(transformation(extent = {{103.75,-133.14285714285717},{123.75,-113.14285714285715}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Variable_DC_Load variable_DC_Load3 annotation(Placement(transformation(extent = {{-10.0,-10.000000000000007},{10.0,10.000000000000007}},origin = {197.75,-121.14285714285717},rotation = -90.0)));
    .Modelica.Blocks.Math.Gain gain5(k = 0.33) annotation(Placement(transformation(extent = {{238.41595747339665,-127.8088146162538},{225.08404252660335,-114.47689966946051}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground3 annotation(Placement(transformation(extent = {{138.01542165553212,-218.87743548732504},{145.48457834446788,-211.4082787983893}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.SinglePhase.ACDC_1pRectifierSimple aCDC_1pRectifierSimple5(P_DCmin = 0,VAC_nom = 277,P_nom = 20000 * 0.33,gamma = 0.050936187,beta = 0.101408771,alpha = 0.007433973,VDC_nom = 19.5) annotation(Placement(transformation(extent = {{104.0,-258.0},{124.0,-238.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Variable_DC_Load variable_DC_Load5 annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {197.75,-245.14285714285717},rotation = -90.0)));
    .Modelica.Blocks.Math.Gain gain7(k = 0.33) annotation(Placement(transformation(extent = {{238.41595747339665,-251.8088146162538},{225.08404252660335,-238.47689966946052}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground5 annotation(Placement(transformation(extent = {{86.76542165553214,-343.7345783444679},{94.23457834446786,-336.2654216555321}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain gain9(k = 0.33) annotation(Placement(transformation(extent = {{233.91595747339665,-7.808814616253798},{220.58404252660335,5.523100330539492}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.ACload aCload(aC_LoadIdealWye(P_nom = 100000,V_nom = 277,Q_nom = 25000,vAngle_init = 0.52359877559829833278),ac_schedule(tableName = "Mechanical",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-Mechanical_LP.txt"),timeScale = 3600,smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments,extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint),gain(k = PF1)) annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {2.0,66.0},rotation = 90.0)));
    .HPF.Transformers.ThreePhase.Symmetric.D1Y d1Y(Xs = 0.00665 * ks,Xp = 4.4882 * kp,Xm = 10366.7 * km,Rs = 0.0006488 * ks,Rp = 0.43785 * kp,Rc = 110450.1 * km,VSecRated = 480,VPrimRated = 12470) annotation(Placement(transformation(extent = {{-34.0,-22.0},{-14.0,-2.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{-58,-58},{-42,-42}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Math.Gain gain3(k = 1) annotation(Placement(transformation(extent = {{-88.0,-118.0},{-68.0,-98.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Sources.DC.FixedVoltage_VariablePower DC_Source(v_out(displayUnit = "V") = 660) annotation(Placement(visible = true,transformation(origin = {-44.25,-119.0},extent = {{-10.0,-10.0},{10.0,10.0}},rotation = 90.0)));
    .Modelica.Electrical.Analog.Basic.Ground Ground_DC annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-48.25,-95.0},{-28.25,-75.0}},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_PV_roof(startTime(displayUnit = "h") = 0,offset = {0},timeScale(displayUnit = "h") = 3600,extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/pv_san_diego_roof.txt"),tableName = "pv_profile",tableOnFile = true) annotation(HideResult = true,Placement(transformation(extent = {{-126.0,-120.0},{-106.0,-100.0}},rotation = 0.0,origin = {0.0,0.0})));
    .HPF.Cables.NEC_CableModel Cable_PV_C(length = 1,wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{15.75,-125.0},{35.75,-105.0}},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel Cable_PV_B(length = 1,wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{21.75,-137.0},{41.75,-117.0}},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel Cable_PV_A(length = 1,wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{27.75,-149.0},{47.75,-129.0}},rotation = 0.0)));
    .HPF.PowerConverters.ThreePhase.ACDC_3pInverterSimple PV_Inverter(Q1(start = 0),gamma = 0.016227353,beta = 0.010598212,alpha = 0.004799349,VDC_nom = 660,VAC_nom = 277,P_stby = 1,P_nom = 175000 * gain3.k,PF = +0.95,vAngle = 0) annotation(Placement(visible = true,transformation(origin = {-6.25,-121},extent = {{-10,-10},{10,10}},rotation = 180)));
    
    
equation
    connect(aCDC_1pRectifierSimple.pin_p,variable_DC_Load.p) annotation(Line(points = {{125.25,4.857142857142847},{131.25,4.857142857142847},{131.25,14.857142857142847},{199.25,14.857142857142847},{199.25,8.857142857142847}},color = {0,0,255}));
    connect(aCDC_1pRectifierSimple.pin_n,variable_DC_Load.n) annotation(Line(points = {{125.25,-11.142857142857153},{131.25,-11.142857142857153},{131.25,-17.142857142857153},{199.25,-17.142857142857153},{199.25,-11.142857142857153}},color = {0,0,255}));
    connect(combiTimeTable2.y[1],gain4.u) annotation(Line(points = {{211,68},{247.25,68},{247.25,44.85629182521882}},color = {0,0,127}));
    connect(aCDC_1pRectifierSimple3.pin_p,variable_DC_Load3.p) annotation(Line(points = {{123.75,-115.14285714285715},{129.75,-115.14285714285715},{129.75,-105.14285714285715},{197.75,-105.14285714285715},{197.75,-111.14285714285715}},color = {0,0,255}));
    connect(aCDC_1pRectifierSimple3.pin_n,variable_DC_Load3.n) annotation(Line(points = {{123.75,-131.14285714285717},{129.75,-131.14285714285717},{129.75,-137.14285714285717},{197.75,-137.14285714285717},{197.75,-131.14285714285717}},color = {0,0,255}));
    connect(gain5.y,variable_DC_Load3.u) annotation(Line(points = {{224.41744677926368,-121.14285714285715},{213.58372338963184,-121.14285714285715},{213.58372338963184,-121.34285714285716},{202.75,-121.34285714285716}},color = {0,0,127}));
    connect(aCDC_1pRectifierSimple5.pin_p,variable_DC_Load5.p) annotation(Line(points = {{124,-240},{129.75,-240},{129.75,-229.14285714285717},{197.75,-229.14285714285717},{197.75,-235.14285714285717}},color = {0,0,255}));
    connect(aCDC_1pRectifierSimple5.pin_n,variable_DC_Load5.n) annotation(Line(points = {{124,-256},{129.75,-256},{129.75,-261.14285714285717},{197.75,-261.14285714285717},{197.75,-255.14285714285717}},color = {0,0,255}));
    connect(gain7.y,variable_DC_Load5.u) annotation(Line(points = {{224.41744677926368,-245.14285714285717},{213.58372338963184,-245.14285714285717},{213.58372338963184,-245.34285714285716},{202.75,-245.34285714285716}},color = {0,0,127}));
    connect(variable_DC_Load.u,gain9.y) annotation(Line(points = {{204.25,-1.3428571428571519},{212.08372338963184,-1.3428571428571519},{212.08372338963184,-1.142857142857153},{219.91744677926368,-1.142857142857153}},color = {0,0,127}));
    connect(aCload.hPin_A,d1Y.pinSec_A) annotation(Line(points = {{0.3999999999999966,50.6},{0.3999999999999966,0},{-14,0}},color = {92,53,102}));
    connect(aCload.hPin_B,d1Y.pinSec_B) annotation(Line(points = {{2.399999999999997,50.599999999999994},{2.399999999999997,-8},{-14,-8}},color = {92,53,102}));
    connect(aCload.hPin_C,d1Y.pinSec_C) annotation(Line(points = {{4.399999999999997,50.6},{4.399999999999997,-16},{-14,-16}},color = {92,53,102}));
    connect(aCload.hPin_N,d1Y.pinSec_N) annotation(Line(points = {{6.9999999999999964,50.599999999999994},{6.9999999999999964,-24},{-14,-24}},color = {117,80,123}));
    connect(voltageSource.pinP_phA,d1Y.pinPrim_A) annotation(Line(points = {{-60,-6},{-60,4},{-34,4},{-34,-2}},color = {92,53,102}));
    connect(voltageSource.pinP_phB,d1Y.pinPrim_B) annotation(Line(points = {{-60,-14},{-47,-14},{-47,-12},{-34,-12}},color = {92,53,102}));
    connect(voltageSource.pinP_phC,d1Y.pinPrim_C) annotation(Line(points = {{-60,-22},{-60,-28},{-34,-28},{-34,-22}},color = {92,53,102}));
    connect(voltageSource.pinN,ground.pin) annotation(Line(points = {{-70,-24.200000000000003},{-70,-33.1},{-50,-33.1},{-50,-42}},color = {117,80,123}));
    connect(d1Y.pinSec_N,ground.pin) annotation(Line(points = {{-14,-24},{-8,-24},{-8,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(aCDC_1pRectifierSimple.hPin_N,ground.pin) annotation(Line(points = {{105.25,-11.142857142857153},{-50,-11.142857142857153},{-50,-42}},color = {117,80,123}));
    connect(gain4.y,gain9.u) annotation(Line(points = {{247.25,29.524589636406525},{247.25,-1.142857142857153},{235.24914896807599,-1.142857142857153}},color = {0,0,127}));
    connect(gain4.y,gain5.u) annotation(Line(points = {{247.25,29.524589636406525},{247.25,-121.14285714285715},{239.74914896807599,-121.14285714285715}},color = {0,0,127}));
    connect(gain4.y,gain7.u) annotation(Line(points = {{247.25,29.524589636406525},{247.25,-245.14285714285717},{239.74914896807599,-245.14285714285717}},color = {0,0,127}));
    connect(Ground_DC.p,DC_Source.n) annotation(Line(points = {{-38.25,-75},{-34.25,-75},{-34.25,-109},{-44.25,-109}},color = {0,0,255}));
    connect(combiTimeTable_PV_roof.y[1],gain3.u) annotation(Line(points = {{-105,-110},{-97.5,-110},{-97.5,-108},{-90,-108}},color = {0,0,127}));
    connect(gain3.y,DC_Source.p_out) annotation(Line(points = {{-67,-108},{-59.625,-108},{-59.625,-119},{-52.25,-119}},color = {0,0,127}));
    connect(Cable_PV_C.pin_n,d1Y.pinSec_C) annotation(Line(points = {{35.75,-115},{41.75,-115},{41.75,-16},{-14,-16}},color = {117,80,123}));
    connect(Cable_PV_B.pin_n,d1Y.pinSec_B) annotation(Line(points = {{41.75,-127},{47.75,-127},{47.75,-8},{-14,-8}},color = {117,80,123}));
    connect(Cable_PV_A.pin_n,d1Y.pinSec_A) annotation(Line(points = {{47.75,-139},{53.75,-139},{53.75,0},{-14,0}},color = {117,80,123}));
    connect(d1Y.pinSec_A,aCDC_1pRectifierSimple.hPin_L) annotation(Line(points = {{-14,0},{45.625,0},{45.625,4.857142857142847},{105.25,4.857142857142847}},color = {92,53,102}));
    connect(d1Y.pinSec_B,aCDC_1pRectifierSimple3.hPin_L) annotation(Line(points = {{-14,-8},{44.875,-8},{44.875,-115.14285714285717},{103.75,-115.14285714285717}},color = {92,53,102}));
    connect(d1Y.pinSec_C,aCDC_1pRectifierSimple5.hPin_L) annotation(Line(points = {{-14,-16},{44,-16},{44,-240},{104,-240}},color = {92,53,102}));
    connect(aCDC_1pRectifierSimple3.hPin_N,ground.pin) annotation(Line(points = {{103.75,-131.14285714285717},{97.75,-131.14285714285717},{97.75,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(aCDC_1pRectifierSimple5.hPin_N,ground.pin) annotation(Line(points = {{104,-256},{97.75,-256},{97.75,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(aCDC_1pRectifierSimple.pin_n,ground2.p) annotation(Line(points = {{125.25,-11.142857142857153},{143.25,-11.142857142857153},{143.25,-91.40827879838928}},color = {0,0,255}));
    connect(aCDC_1pRectifierSimple3.pin_n,ground3.p) annotation(Line(points = {{123.75,-131.14285714285717},{141.75,-131.14285714285717},{141.75,-211.4082787983893}},color = {0,0,255}));
    connect(aCDC_1pRectifierSimple5.pin_n,ground5.p) annotation(Line(points = {{124,-256},{129.75,-256},{129.75,-330.2654216555321},{90.5,-330.2654216555321},{90.5,-336.2654216555321}},color = {0,0,255}));
    connect(DC_Source.n,PV_Inverter.pin_n) annotation(Line(points = {{-44.25,-109},{-28.25,-109},{-28.25,-113},{-16.25,-113}},color = {0,0,255}));
    connect(PV_Inverter.hPin_C,Cable_PV_C.pin_p) annotation(Line(points = {{3.75,-119},{7.75,-119},{7.75,-115},{15.75,-115}},color = {92,53,102}));
    connect(PV_Inverter.hPin_B,Cable_PV_B.pin_p) annotation(Line(points = {{3.75,-124},{15.75,-124},{15.75,-127},{21.75,-127}},color = {92,53,102}));
    connect(PV_Inverter.hPin_A,Cable_PV_A.pin_p) annotation(Line(points = {{3.75,-129},{11.75,-129},{11.75,-139},{27.75,-139}},color = {92,53,102}));
    connect(DC_Source.p,PV_Inverter.pin_p) annotation(Line(points = {{-44.25,-129},{-16.25,-129}},color = {0,0,255}));
    connect(PV_Inverter.hPin_N,ground.pin) annotation(Line(points = {{3.7500000000000018,-113},{9.750000000000002,-113},{9.750000000000002,-36},{-50,-36},{-50,-42}},color = {117,80,123}));

end medoff_acconnected;
