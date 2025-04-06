within HPF.Data;

model SingleFileMultiTable
  parameter Integer n = 3; // Number of tables and outputs
  parameter String fileName = .ModelicaServices.ExternalReferences.loadResource("modelica://PrototypeBuildingElectricalModels/Data/LoadProfiles/occsim_typi_lighting_LP.txt"); // File containing the tables
  parameter String tableNames[n] = {"Room-101", "Room-201", "Room-301"}; // Table names
  parameter Real timeScales[n] = fill(3600.0, n); // Time scale for each table

  // Define output connectors
    .Modelica.Blocks.Interfaces.RealOutput y[n] annotation(Placement(transformation(extent = {{-34,18},{-14,38}},origin = {0,0},rotation = 0)));
protected  
    .Modelica.Blocks.Sources.CombiTimeTable tables[n](
    fileName=fill(fileName, n),  // All instances use the same file
    tableName=tableNames,        // Unique table name for each instance
    tableOnFile=fill(true, n),
    timeScale=timeScales,
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=fill(Modelica.Blocks.Types.Extrapolation.HoldLastPoint, n),
    verboseRead=fill(false, n)
  ) annotation(Placement(transformation(extent = {{-64,-12},{-44,8}},origin = {0,0},rotation = 0)));

equation
  // Connect each CombiTimeTable's output to a respective connector
  for i in 1:n loop
    connect(y[i], tables[i].y[1]);
  end for;

end SingleFileMultiTable;