within HPF.Examples.ModelingValidation;
model battery
"Test system with controlled battery"
 HPF.DC.BESS BESS(capacity=250, maxPower=60e3, nominalVoltage=400, initialSOC=1);
 Modelica.Electrical.Analog.Sources.ConstantVoltage source(V=400) "50V DC source";
 Modelica.Electrical.Analog.Basic.Resistor load(R=4.8) "Approx 5kW load at 48V";
    .HPF.DC.Ground ground annotation(Placement(transformation(extent = {{-51.04962251383141,-29.206039778697402},{-31.04962251383141,-9.206039778697402}},origin = {0.0,0.0},rotation = 0.0)));
 // Simple time-based power reference
 //Real P_ref "Power reference signal";
equation
 // Example: Charge for 12h, then discharge for 12h
 BESS.P_ref = -60e3;//if time < 43200 then 5e3 else -5e3; // 5kW charge, then 5kW discharge
 // Connect P_ref to battery
 //BESS.P_ref = P_ref;
 // Electrical connections
 connect(source.p, BESS.p);
 connect(BESS.p, load.p);
 connect(source.n, BESS.n);
 connect(BESS.n, load.n);
 connect(BESS.n,ground.p);
annotation(
 experiment(StopTime=86400, Interval=60),
 Documentation(info="<html><p>Test the battery controller with a 50V source and ~5kW load.</p></html>"));
end battery;