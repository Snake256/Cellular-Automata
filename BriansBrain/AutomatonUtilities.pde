int Convert2DIndexTo1DIndex(int x, int y, int columnCount)
{
  return x + y * columnCount;
}

int CountSurroundingOnCells(Grid grid, IntVector2 centerCellPosition)
{
  return new OnCellCounter(grid, centerCellPosition).Evaluate();
}

Grid InitializeRandomGrid(int columns, int rows, float ratioOnCells)
{
  Grid randomGrid = new Grid(columns, rows);
  
  for(int i = 0; i < columns; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      randomGrid.Set(i, j, RandomCell(ratioOnCells));
    }
  }
  
  return randomGrid;
}

Cell RandomCell(float ratioOnCells)
{
  return new Cell(random(1) <= ratioOnCells ? CellState.On : CellState.Off);
}

Grid InitializeEmptyGrid(int columns, int rows)
{
  Grid emptyGrid = new Grid(columns, rows);
  
  for(int i = 0; i < columns; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      emptyGrid.Set(i, j, GetOffCell());
    }
  }
  
  return emptyGrid;
}

Cell GetOffCell()
{
  return new Cell(CellState.Off);
}

PVector GetGridCenter(IntVector2 dimensions)
{
  return new PVector
  (
    dimensions.X / 2f,
    dimensions.Y / 2f
  );
}
