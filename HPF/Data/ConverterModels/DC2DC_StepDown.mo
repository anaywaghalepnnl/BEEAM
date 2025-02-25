within HPF.Data.ConverterModels;
package DC2DC_StepDown "DC to DC step down converter model data record"
  extends Modelica.Icons.RecordsPackage;
  record ModelData
    extends Modelica.Icons.Record;

    /*(create dialog sections using annotation)
      Converter characteristics
        - output voltage
    */
    parameter Modelica.Units.SI.Voltage V=45
      annotation (Dialog(group="Converter characteristics"));
    /*
      Converter model stuff    
    */
    parameter Real alpha = 0.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real beta = 0.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real gamma = 0.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real Pnom = 1.0 annotation (Dialog(group = "PLoss calculations"));
    annotation(defaultComponentPrefixes = "parameter");
  end ModelData;

  record Laptop_18V_90W_LapChrg4
    extends HPF.Data.ConverterModels.DC2DC_StepDown.ModelData(final V = 18.5, final alpha = 1.2488, final beta = 5.7882e-4, final gamma = 0.001);
    annotation (defaultComponentPrefixes = "parameter",
      defaultComponentName = "laptop_18V_90W_LapChrg4",
      Documentation(info="<html>
<p>BiXPower DD90X DC/DC laptop charger.&nbsp;</p>
<p><br>Experimental setup converter alias: DC/DC converters Laptop Charger 4</p>
</html>"));

  end Laptop_18V_90W_LapChrg4;

  record Laptop_18V_90W_LapChrg5
    extends HPF.Data.ConverterModels.DC2DC_StepDown.ModelData(final V = 18.5, final Pnom=90, final alpha = 1.2611, final beta = -0.001, final gamma = 0.0011);
    annotation (defaultComponentPrefixes = "parameter",
      defaultComponentName = "laptop_18V_90W_LapChrg5",
      Documentation(info="<html>
<p>BiXPower DD90X DC/DC laptop charger.&nbsp;</p>
<p><br><br>Experimental setup converter alias: DC/DC converters Laptop Charger 5</p>
</html>"));

  end Laptop_18V_90W_LapChrg5;

  record Laptop_18V_90W_LapChrg6
    extends HPF.Data.ConverterModels.DC2DC_StepDown.ModelData(final V = 18.5, final alpha = 1.1997, final beta = 0.0104, final gamma = 8.2816e-4);
    annotation (defaultComponentPrefixes = "parameter",
     defaultComponentName = "laptop_18V_90W_LapChrg6",
      Documentation(info="<html>
<p>BiXPower DD90X DC/DC laptop charger.&nbsp;</p>
<p><br><br>Experimental setup converter alias: DC/DC converters Laptop Charger 6</p>
</html>"));

  end Laptop_18V_90W_LapChrg6;

  record Igor_PoE_Driver_53W
    extends HPF.Data.ConverterModels.DC2DC_StepDown.ModelData(final V = 30, final Pnom = 53, final alpha = 0.022093, final beta = 0.012605, final gamma = 0.043602);
    annotation (defaultComponentPrefixes = "parameter",
     defaultComponentName= "igor_PoE_Driver",
      Documentation(info="<html>
  <p>BiXPower DD90X DC/DC laptop charger.&nbsp;</p>
  <p><br><br>Experimental setup converter alias: DC/DC converters Laptop Charger 6</p>
  </html>"));

  end Igor_PoE_Driver_53W;

  record zero_loss
    extends .Modelica.Icons.Record;

    /*(create dialog sections using annotation)
      Converter characteristics
        - output voltage
    */
    parameter .Modelica.Units.SI.Voltage V=30
      annotation (Dialog(group="Converter characteristics"));
    /*
      Converter model stuff    
    */
    parameter Real alpha = 0.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real beta = 0.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real gamma = 0.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real Pnom = 1.0 annotation (Dialog(group = "PLoss calculations"));
    annotation(defaultComponentPrefixes = "parameter");
  end zero_loss;

  record mppt
    extends .Modelica.Icons.Record;

    /*(create dialog sections using annotation)
      Converter characteristics
        - output voltage
    */
    parameter .Modelica.Units.SI.Voltage V=380
      annotation (Dialog(group="Converter characteristics"));
    /*
      Converter model stuff    
    */
    parameter Real alpha = 0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real beta = 0.01546067 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real gamma = 0.00659505 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real Pnom = 600 annotation (Dialog(group = "PLoss calculations"));
    annotation(defaultComponentPrefixes = "parameter");
  end mppt;
end DC2DC_StepDown;
