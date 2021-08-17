void InitChaoticGrowth()
{
  int columns = 80;
  int rows = 50;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = -5;
  int offsetY = 0;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GenerateRuleFromString("LR"));
}

void InitExpandingSquare1()
{
  int columns = 100;
  int rows = 100;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = 5;
  int offsetY = 0;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GenerateRuleFromString("LRRL"));
}

void InitExpandingSquare2()
{
  int columns = 150;
  int rows = 150;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  
  InitAutomaton(dimensions, antStartingPosition, GenerateRuleFromString("LRRRRRLLR"));
}

void InitExpandingTriangle()
{
  int columns = 100;
  int rows = 100;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = 25;
  int offsetY = 20;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GenerateRuleFromString("RRLLLRLLLRRR"));
}

void InitCardioid()
{
  int columns = 100;
  int rows = 100;
  IntVector2 dimensions = new IntVector2(columns, rows);
  IntVector2 antStartingPosition = GetCenterCellPosition(dimensions);
  int offsetX = 10;
  int offsetY = 0;
  IntVector2 offset = new IntVector2(offsetX, offsetY);
  antStartingPosition.Add(offset);
  
  InitAutomaton(dimensions, antStartingPosition, GenerateRuleFromString("LLRR"));
}

void InitAutomaton(IntVector2 dimensions, IntVector2 antStartingPosition, Rule rule)
{
  automaton = new AntAutomaton(dimensions, antStartingPosition, rule);
}
