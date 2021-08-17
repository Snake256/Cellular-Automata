int GetRuleIndex(int leftValue, int middleValue, int rightValue)
{
  int index = 0;
  index |= leftValue << 2;
  index |= middleValue << 1;
  index |= rightValue;
  return index;
}

int CreateSingleBitMask(int index)
{
  return 1 << index;
}

Line InitRandomLine(int cellCount)
{
  Line line = new Line(cellCount);
  
  for(int i = 0; i < line.GetSize(); i++)
  {
    line.SetBit(i, GetRandomByte());
  }
  
  return line;
}

int GetRandomByte()
{
  return random(0, 1) < 0.5f ? 0 : 1;
}

Line InitLineWithCenteredOnBit(int cellCount)
{
  Line line = new Line(cellCount);
  int middleIndex = ceil(cellCount / 2f);
  line.SetBit(middleIndex, 1);
  return line;
}

int GetBitAtIndex(int source, int index)
{
  int sourceMasked = CreateSingleBitMask(index) & source;
  return sourceMasked >> index;
}

int GetNumColumnsOnScreen()
{
  return (int) (width / cellSize);
}

int GetNumRowsOnScreen()
{
  return (int) (height / cellSize);
}
