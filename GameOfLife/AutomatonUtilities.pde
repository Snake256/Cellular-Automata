int Convert2DIndexTo1DIndex(int x, int y, int columnCount)
{
  return x + y * columnCount;
}

int CountSurroundingAliveCells(Grid grid, IntVector2 centerCellPosition)
{
  return new AliveCellCounter(grid, centerCellPosition).Evaluate();
}

Grid InitializeRandomGrid(int columns, int rows, float ratioInitialAliveCells)
{
  Grid randomGrid = new Grid(columns, rows);
  
  for(int i = 0; i < columns; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      randomGrid.Set(i, j, GetRandomCell(ratioInitialAliveCells));
    }
  }
  
  return randomGrid;
}

Cell GetRandomCell(float ratioInitialAliveCells)
{
  return new Cell(random(1) <= ratioInitialAliveCells);
}

Grid InitializeEmptyGrid(int columns, int rows)
{
  Grid emptyGrid = new Grid(columns, rows);
  
  for(int i = 0; i < columns; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      emptyGrid.Set(i, j, GetDeadCell());
    }
  }
  
  return emptyGrid;
}

Cell GetDeadCell()
{
  return new Cell(false);
}

PVector GetGridCenter(IntVector2 dimensions)
{
  return new PVector
  (
    dimensions.X / 2f,
    dimensions.Y / 2f
  );
}
