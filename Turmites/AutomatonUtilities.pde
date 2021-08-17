int Convert2DIndexTo1DIndex(int x, int y, int columnCount)
{
  return x + y * columnCount;
}

Grid InitializeEmptyGrid(int columns, int rows)
{
  Grid emptyGrid = new Grid(columns, rows);
  
  for(int i = 0; i < columns; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      emptyGrid.Set(i, j, GetDefaultCell());
    }
  }
  
  return emptyGrid;
}

Cell GetDefaultCell()
{
  int defaultColorID = 0;
  Cell defaultCell = new Cell(defaultColorID);
  return defaultCell;
}

PVector GetGridCenter(IntVector2 dimensions)
{
  return new PVector
  (
    dimensions.X / 2f,
    dimensions.Y / 2f
  );
}

PVector GetCellCenter(IntVector2 cellPos)
{
  return new PVector(cellPos.X + 0.5f, cellPos.Y + 0.5f);
}

IntVector2 GetCenterCellPosition(IntVector2 dimensions) //<>//
{
  return new IntVector2
  (
    dimensions.X / 2,
    dimensions.Y / 2
  );
}
