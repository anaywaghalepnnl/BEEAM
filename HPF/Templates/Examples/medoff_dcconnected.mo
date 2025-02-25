within HPF.Templates.Examples;

model medoff_dcconnected
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
    .HPF.DC.DC2DC_Converters.StepDown stepDown(modelData = igor_PoE_Driver) annotation(Placement(transformation(extent = {{152.0,-10.0},{172.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Variable_DC_Load variable_DC_Load annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {199.25,-1.142857142857153},rotation = -90.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,timeScale = 3600,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-L1_Light_LP.txt"),tableName = "L1-Core-Lights",tableOnFile = true) annotation(Placement(transformation(extent = {{190.0,58.0},{210.0,78.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground2 annotation(Placement(transformation(extent = {{138.26542165553212,-31.734578344467877},{145.73457834446788,-24.265421655532123}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain gain4(k = 30299) annotation(Placement(transformation(extent = {{6.665957473396645,-6.665957473396645},{-6.665957473396645,6.665957473396645}},origin = {247.25,36.85714285714283},rotation = 90.0)));
    parameter .HPF.Data.ConverterModels.DC2DC_StepDown.Igor_PoE_Driver_53W igor_PoE_Driver(Pnom=20000) annotation(Placement(transformation(extent = {{97.25,34.85714285714283},{117.25,54.85714285714283}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.DC2DC_Converters.StepDown stepDown2(modelData = igor_PoE_Driver) annotation(Placement(transformation(extent = {{152.0,-132.0},{172.0,-112.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Variable_DC_Load variable_DC_Load3 annotation(Placement(transformation(extent = {{-10.0,-10.000000000000007},{10.0,10.000000000000007}},origin = {197.75,-121.14285714285717},rotation = -90.0)));
    .Modelica.Blocks.Math.Gain gain5(k = 0.33) annotation(Placement(transformation(extent = {{238.41595747339665,-127.8088146162538},{225.08404252660335,-114.47689966946051}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground3 annotation(Placement(transformation(extent = {{138.26542165553212,-153.73457834446788},{145.73457834446788,-146.26542165553212}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.DC2DC_Converters.StepDown stepDown3(modelData = igor_PoE_Driver) annotation(Placement(transformation(extent = {{148.0,-254.0},{168.0,-234.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Variable_DC_Load variable_DC_Load5 annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {197.75,-245.14285714285717},rotation = -90.0)));
    .Modelica.Blocks.Math.Gain gain7(k = 0.33) annotation(Placement(transformation(extent = {{238.41595747339665,-251.8088146162538},{225.08404252660335,-238.47689966946052}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.Ground ground5 annotation(Placement(transformation(extent = {{132.26542165553212,-293.7345783444679},{139.73457834446788,-286.2654216555321}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain gain9(k = 0.33) annotation(Placement(transformation(extent = {{233.91595747339665,-7.808814616253798},{220.58404252660335,5.523100330539492}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Templates.ACload aCload(aC_LoadIdealWye(P_nom = 100000,V_nom = 277,Q_nom = 25000,vAngle_init = 0.52359877559829833278),ac_schedule(tableName = "Mechanical",fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/San-Diego-Mechanical_LP.txt"),timeScale = 3600,smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint),gain(k = PF1)) annotation(Placement(transformation(extent = {{10.0,-10.0},{-10.0,10.0}},origin = {2.0,66.0},rotation = 90.0)));
    .HPF.Transformers.ThreePhase.Symmetric.D1Y d1Y(Xs = 0.00665 * ks,Xp = 4.4882 * kp,Xm = 10366.7 * km,Rs = 0.0006488 * ks,Rp = 0.43785 * kp,Rc = 110450.1 * km,VSecRated = 480,VPrimRated = 12470) annotation(Placement(transformation(extent = {{-34.0,-22.0},{-14.0,-2.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.SinglePhase.Components.Ground ground annotation(Placement(transformation(extent = {{-58,-58},{-42,-42}},origin = {0,0},rotation = 0)));
    .HPF.DC.Ground ground4 annotation(Placement(transformation(extent = {{-92.0,-110.0},{-72.0,-90.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel2(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500,length = 100) annotation(Placement(transformation(extent = {{-21.042887840438844,-71.04288784043885},{-10.957112159561156,-60.95711215956115}},origin = {0,0},rotation = 0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel3(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500,length = 100) annotation(Placement(transformation(extent = {{-21.042887840438844,-77.04288784043885},{-10.957112159561156,-66.95711215956115}},origin = {0,0},rotation = 0)));
    .HPF.Cables.NEC_CableModel nEC_CableModel4(wireGaugeAC = .HPF.Types.WireGaugeAC.gauge_500,length = 100) annotation(Placement(transformation(extent = {{-21.042887840438844,-83.04288784043885},{-10.957112159561156,-72.95711215956115}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_L1_Mechanical(startTime(displayUnit = "h") = 0,offset = {0},timeScale(displayUnit = "h") = 3600,extrapolation = .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/pv_san_diego_roof.txt"),tableName = "pv_profile",tableOnFile = true) annotation(HideResult = true,Placement(transformation(extent = {{-128.0,-152.0},{-108.0,-132.0}},rotation = 0.0,origin = {0.0,0.0})));
    .HPF.DC.DC2DC_Converters.DC_DC_MPPT dC_DC_MPPT2(beta = -0.00332819,P_nom = 175000 * gain3.k,gamma = 0.026130021,alpha = 0.006078996) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {-24.0,-140.0},rotation = -90.0)));
    .Modelica.Blocks.Math.Gain gain3(k = 0.7) annotation(Placement(transformation(extent = {{-94.0,-152.0},{-74.0,-132.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.PowerConverters.ThreePhase.ACDC_3pBidirectionalSimple Simple_Bidirectional_3phase(Q1(start = 0),PF = +0.95,gamma_DCAC = 0.013725159,gamma_ACDC = 0.033250334,beta_DCAC = 0.01136924,beta_ACDC = -0.013106201,alpha_DCAC = 0.005765519,alpha_ACDC = 0.011660807,vAngle = 0,VDC_nom = 380,VAC_nom = 277,P_nom = 100000) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-34.270071059331585,-81.26659899111277},{-53.729928940668415,-62.73340100888723}},rotation = 0.0)));
    .HPF.DC.DC2DC_Converters.StepDown stepDown4(modelData = modelDataDCDC) annotation(Placement(transformation(extent = {{96.0,-8.0},{116.0,12.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.DC2DC_Converters.StepDown stepDown5(modelData = modelDataDCDC)  annotation(Placement(transformation(extent = {{94.0,-132.0},{114.0,-112.0}},origin = {0.0,0.0},rotation = 0.0)));
    .HPF.DC.DC2DC_Converters.StepDown stepDown6(modelData = modelDataDCDC)  annotation(Placement(transformation(extent = {{96.0,-254.0},{116.0,-234.0}},origin = {0.0,0.0},rotation = 0.0)));
    //parameter .HPF.Data.ConverterModels.DC2DC_StepDown.ModelData modelDataDCDC(V = 48, alpha = 4.27984, beta = -0.004643965, gamma = 0.0000985992) annotation(Placement(transformation(extent = {{72,34},{92,54}},origin = {0,0},rotation = 0)));
    parameter .HPF.Data.ConverterModels.DC2DC_StepDown.zero_loss modelDataDCDC;
    
equation
    connect(combiTimeTable2.y[1],gain4.u) annotation(Line(points = {{211,68},{247.25,68},{247.25,44.85629182521882}},color = {0,0,127}));
    connect(gain5.y,variable_DC_Load3.u) annotation(Line(points = {{224.41744677926368,-121.14285714285715},{213.58372338963184,-121.14285714285715},{213.58372338963184,-121.34285714285716},{202.75,-121.34285714285716}},color = {0,0,127}));
    connect(gain7.y,variable_DC_Load5.u) annotation(Line(points = {{224.41744677926368,-245.14285714285717},{213.58372338963184,-245.14285714285717},{213.58372338963184,-245.34285714285716},{202.75,-245.34285714285716}},color = {0,0,127}));
    connect(variable_DC_Load.u,gain9.y) annotation(Line(points = {{204.25,-1.3428571428571519},{212.08372338963184,-1.3428571428571519},{212.08372338963184,-1.142857142857153},{219.91744677926368,-1.142857142857153}},color = {0,0,127}));
    connect(aCload.hPin_A,d1Y.pinSec_A) annotation(Line(points = {{0.3999999999999966,50.6},{0.3999999999999966,0},{-14,0}},color = {92,53,102}));
    connect(aCload.hPin_B,d1Y.pinSec_B) annotation(Line(points = {{2.399999999999997,50.599999999999994},{2.399999999999997,-8},{-14,-8}},color = {92,53,102}));
    connect(aCload.hPin_C,d1Y.pinSec_C) annotation(Line(points = {{4.399999999999997,50.6},{4.399999999999997,-16},{-14,-16}},color = {92,53,102}));
    connect(aCload.hPin_N,d1Y.pinSec_N) annotation(Line(points = {{6.9999999999999964,50.599999999999994},{12.999999999999996,50.599999999999994},{12.999999999999996,-24},{-14,-24}},color = {117,80,123}));
    connect(voltageSource.pinP_phA,d1Y.pinPrim_A) annotation(Line(points = {{-60,-6},{-60,4},{-34,4},{-34,-2}},color = {92,53,102}));
    connect(voltageSource.pinP_phB,d1Y.pinPrim_B) annotation(Line(points = {{-60,-14},{-47,-14},{-47,-12},{-34,-12}},color = {92,53,102}));
    connect(voltageSource.pinP_phC,d1Y.pinPrim_C) annotation(Line(points = {{-60,-22},{-60,-28},{-34,-28},{-34,-22}},color = {92,53,102}));
    connect(nEC_CableModel2.pin_n,d1Y.pinSec_A) annotation(Line(points = {{-10.957112159561156,-66},{-4.957112159561156,-66},{-4.957112159561156,0},{-14,0}},color = {117,80,123}));
    connect(nEC_CableModel3.pin_n,d1Y.pinSec_B) annotation(Line(points = {{-10.957112159561156,-72},{-4.957112159561156,-72},{-4.957112159561156,-8},{-14,-8}},color = {117,80,123}));
    connect(nEC_CableModel4.pin_n,d1Y.pinSec_C) annotation(Line(points = {{-10.957112159561156,-78},{-4.957112159561156,-78},{-4.957112159561156,-16},{-14,-16}},color = {117,80,123}));
    connect(voltageSource.pinN,ground.pin) annotation(Line(points = {{-70,-24.200000000000003},{-70,-33.1},{-50,-33.1},{-50,-42}},color = {117,80,123}));
    connect(d1Y.pinSec_N,ground.pin) annotation(Line(points = {{-14,-24},{-8,-24},{-8,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(combiTimeTable_L1_Mechanical.y[1],gain3.u) annotation(Line(points = {{-107,-142},{-96,-142}},color = {0,0,127}));
    connect(gain3.y,dC_DC_MPPT2.P_pv) annotation(Line(points = {{-73,-142},{-35.5,-142},{-35.5,-132.4},{-32,-132.4}},color = {0,0,127}));
    connect(dC_DC_MPPT2.n,ground4.p) annotation(Line(points = {{-23.999999999999996,-150},{-23.999999999999996,-156},{-53,-156},{-53,-84},{-82,-84},{-82,-90}},color = {0,0,255}));
    connect(Simple_Bidirectional_3phase.hPin_A,nEC_CableModel2.pin_p) annotation(Line(points = {{-34.270071059331585,-64.58672080710978},{-34.270071059331585,-58.586720807109785},{-27.042887840438844,-58.586720807109785},{-27.042887840438844,-66},{-21.042887840438844,-66}},color = {92,53,102}));
    connect(Simple_Bidirectional_3phase.hPin_B,nEC_CableModel3.pin_p) annotation(Line(points = {{-34.270071059331585,-69.22002030266617},{-34.270071059331585,-63.22002030266617},{-27.042887840438844,-63.22002030266617},{-27.042887840438844,-72},{-21.042887840438844,-72}},color = {92,53,102}));
    connect(Simple_Bidirectional_3phase.hPin_C,nEC_CableModel4.pin_p) annotation(Line(points = {{-34.270071059331585,-73.85331979822256},{-27.042887840438844,-73.85331979822256},{-27.042887840438844,-78},{-21.042887840438844,-78}},color = {92,53,102}));
    connect(Simple_Bidirectional_3phase.hPin_N,ground.pin) annotation(Line(points = {{-34.270071059331585,-79.41327919289022},{-34.270071059331585,-87.26659899111277},{-64,-87.26659899111277},{-64,-36},{-50,-36},{-50,-42}},color = {117,80,123}));
    connect(dC_DC_MPPT2.p,Simple_Bidirectional_3phase.pin_p) annotation(Line(points = {{-24.000000000000004,-130},{-24.000000000000004,-58.586720807109785},{-53.729928940668415,-58.586720807109785},{-53.729928940668415,-64.58672080710978}},color = {0,0,255}));
    connect(Simple_Bidirectional_3phase.pin_n,ground4.p) annotation(Line(points = {{-53.729928940668415,-79.41327919289022},{-53.729928940668415,-87.26659899111277},{-67.8649644703342,-87.26659899111277},{-67.8649644703342,-84},{-82,-84},{-82,-90}},color = {0,0,255}));
    connect(stepDown.p2,variable_DC_Load.p) annotation(Line(points = {{172,10},{172,16},{199.25,16},{199.25,8.857142857142847}},color = {0,0,255}));
    connect(stepDown.n2,variable_DC_Load.n) annotation(Line(points = {{172,-10},{172,-17.142857142857153},{199.25,-17.142857142857153},{199.25,-11.142857142857153}},color = {0,0,255}));
    connect(stepDown2.p2,variable_DC_Load3.p) annotation(Line(points = {{172,-112},{172,-105.14285714285717},{197.75,-105.14285714285717},{197.75,-111.14285714285717}},color = {0,0,255}));
    connect(stepDown2.n2,variable_DC_Load3.n) annotation(Line(points = {{172,-132},{172,-138},{197.75,-138},{197.75,-131.14285714285717}},color = {0,0,255}));
    connect(stepDown3.p2,variable_DC_Load5.p) annotation(Line(points = {{168,-234},{168,-228},{197.75,-228},{197.75,-235.14285714285717}},color = {0,0,255}));
    connect(stepDown3.n2,variable_DC_Load5.n) annotation(Line(points = {{168,-254},{168,-261.14285714285717},{197.75,-261.14285714285717},{197.75,-255.14285714285717}},color = {0,0,255}));
    connect(stepDown4.p2,stepDown.p1) annotation(Line(points = {{116,12},{116,18},{152,18},{152,10}},color = {0,0,255}));
    connect(stepDown4.n2,stepDown.n1) annotation(Line(points = {{116,-8},{116,-16},{152,-16},{152,-10}},color = {0,0,255}));
    connect(stepDown5.p2,stepDown2.p1) annotation(Line(points = {{114,-112},{114,-106},{152,-106},{152,-112}},color = {0,0,255}));
    connect(stepDown5.n2,stepDown2.n1) annotation(Line(points = {{114,-132},{114,-138},{152,-138},{152,-132}},color = {0,0,255}));
    connect(stepDown6.p2,stepDown3.p1) annotation(Line(points = {{116,-234},{116,-228},{148,-228},{148,-234}},color = {0,0,255}));
    connect(stepDown6.n2,stepDown3.n1) annotation(Line(points = {{116,-254},{116,-260},{148,-260},{148,-254}},color = {0,0,255}));
    connect(Simple_Bidirectional_3phase.pin_p,stepDown4.p1) annotation(Line(points = {{-53.729928940668415,-64.58672080710978},{-59.729928940668415,-64.58672080710978},{-59.729928940668415,18},{96,18},{96,12}},color = {0,0,255}));
    connect(stepDown4.n1,ground2.p) annotation(Line(points = {{96,-8},{96,-16.13271082776606},{142,-16.13271082776606},{142,-24.265421655532123}},color = {0,0,255}));
    connect(stepDown4.n2,ground2.p) annotation(Line(points = {{116,-8},{116,-16.13271082776606},{142,-16.13271082776606},{142,-24.265421655532123}},color = {0,0,255}));
    connect(stepDown.n2,ground2.p) annotation(Line(points = {{172,-10},{172,-17.13271082776606},{142,-17.13271082776606},{142,-24.265421655532123}},color = {0,0,255}));
    connect(Simple_Bidirectional_3phase.pin_p,stepDown5.p1) annotation(Line(points = {{-53.729928940668415,-64.58672080710978},{-59.729928940668415,-64.58672080710978},{-59.729928940668415,-106},{94,-106},{94,-112}},color = {0,0,255}));
    connect(stepDown5.n1,ground3.p) annotation(Line(points = {{94,-132},{94,-139.13271082776606},{142,-139.13271082776606},{142,-146.26542165553212}},color = {0,0,255}));
    connect(stepDown5.n2,ground3.p) annotation(Line(points = {{114,-132},{114,-139.13271082776606},{142,-139.13271082776606},{142,-146.26542165553212}},color = {0,0,255}));
    connect(stepDown2.n2,ground3.p) annotation(Line(points = {{172,-132},{172,-139.13271082776606},{142,-139.13271082776606},{142,-146.26542165553212}},color = {0,0,255}));
    connect(Simple_Bidirectional_3phase.pin_p,stepDown6.p1) annotation(Line(points = {{-53.729928940668415,-64.58672080710978},{-59.729928940668415,-64.58672080710978},{-59.729928940668415,-228},{96,-228},{96,-234}},color = {0,0,255}));
    connect(stepDown6.n1,ground5.p) annotation(Line(points = {{96,-254},{96,-270.13271082776606},{136,-270.13271082776606},{136,-286.2654216555321}},color = {0,0,255}));
    connect(stepDown6.n2,ground5.p) annotation(Line(points = {{116,-254},{116,-270.13271082776606},{136,-270.13271082776606},{136,-286.2654216555321}},color = {0,0,255}));
    connect(stepDown3.n2,ground5.p) annotation(Line(points = {{168,-254},{168,-270.13271082776606},{136,-270.13271082776606},{136,-286.2654216555321}},color = {0,0,255}));
    connect(gain4.y,gain9.u) annotation(Line(points = {{247.25,29.524589636406525},{247.25,-1.142857142857153},{235.24914896807599,-1.142857142857153}},color = {0,0,127}));
    connect(gain4.y,gain5.u) annotation(Line(points = {{247.25,29.524589636406525},{247.25,-121.14285714285715},{239.74914896807599,-121.14285714285715}},color = {0,0,127}));
    connect(gain4.y,gain7.u) annotation(Line(points = {{247.25,29.524589636406525},{247.25,-245.14285714285717},{239.74914896807599,-245.14285714285717}},color = {0,0,127}));

end medoff_dcconnected;
