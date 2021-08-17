void InitSpiralGrowth()
{
  int columns = 100;
  int rows = 100;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = 0;
  int offsetY = 2;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GetSpiralGrowthRule());
}

void InitSnowflake()
{
  int columns = 150;
  int rows = 150;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GetSnowflakeRule());
}

void InitFibonacciSprial()
{
  int columns = 160;
  int rows = 150;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = 20;
  int offsetY = 20;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GetFibonacciSpiralRule());
}

void InitExpandingFrame()
{
  int columns = 100;
  int rows = 100;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GetExpandingFrameRule());
}

void InitTexturedChaoticGrowth()
{
  int columns = 130;
  int rows = 130;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = 3;
  int offsetY = -18;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GetTexturedChaoticGrowthRule());
}

void InitChaoticGrowthWithHighway()
{
  int columns = 110;
  int rows = 110;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = 5;
  int offsetY = -2;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GetChaoticGrowthWithHighwayRule());
}

void InitFilledSpiral()
{
  int columns = 70;
  int rows = 70;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GetFilledSpiralRule());
}

void InitStripedSpiral()
{
  int columns = 170;
  int rows = 170;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = -14;
  int offsetY = 0;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GetStripedSpiralRule());
}

void InitBismuth()
{
  int columns = 120;
  int rows = 120;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GetBismuthRule());
}

void InitNestedCabinets()
{
  int columns = 150;
  int rows = 150;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GetNestedCabinetsRule());
}

void InitDiamond()
{
  int columns = 100;
  int rows = 100;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GetDiamondRule());
}

void InitTexturedBall()
{
  int columns = 110;
  int rows = 110;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GetTexturedBallRule());
}

void InitAutomaton(IntVector2 dimensions, IntVector2 antStartingPosition, Rule rule)
{
  automaton = new TurmiteAutomaton(dimensions, antStartingPosition, rule);
}
