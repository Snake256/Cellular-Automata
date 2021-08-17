int timeBetweenAutomatonUpdatesInMs = 100;
ElementaryAutomaton automaton;
LineCollection savedLines;
LineRenderer renderer = new LineRenderer();
float cellSize = 5;

void setup()
{
  size(1280, 720); // 16:9
  InitAutomaton();
  InitLineCollection();
}

void InitAutomaton()
{
  // ######################################
  // # Modify what rule you want here     #
  // # Rule can be a number from 0 to 255 #
  // ######################################
  
  int ruleByteRepresentation = 90;
  Rule rule = new Rule(ruleByteRepresentation);
  automaton = new ElementaryAutomaton(rule);
}

void InitLineCollection()
{
  int columns = GetNumColumnsOnScreen();
  int rows = GetNumRowsOnScreen();
  
  // ##########################################
  // # Modify what initial line you want here #
  // ##########################################
  
  Line initialLine = InitRandomLine(columns);
  //Line initialLine = InitLineWithCenteredOnBit(columns);
  savedLines = new LineCollection(rows);
  AddLine(initialLine);
}

void draw()
{
  Draw();
  Update();
  delay(timeBetweenAutomatonUpdatesInMs);
}

void Draw()
{
  ClearScreen();
  DrawLines();
}

void ClearScreen()
{
  background(200);
}

void DrawLines()
{
  pushMatrix();
  scale(cellSize);
  renderer.Draw(savedLines);
  popMatrix();
}

void Update()
{
  NextLine();
}

void NextLine()
{
  Line lastLine = GetLastLine();
  Line nextGeneration = GenerateNextGeneration(lastLine);
  AddLine(nextGeneration);
}

Line GetLastLine()
{
  return savedLines.GetLastLine();
}

Line GenerateNextGeneration(Line lastLine)
{
  return automaton.GenerateNextGeneration(lastLine);
}

void AddLine(Line line)
{
  savedLines.AddLine(line);
}
