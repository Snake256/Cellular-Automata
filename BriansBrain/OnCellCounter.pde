class OnCellCounter
{
  private int countedCells;
  
  private Grid grid;
  
  private IntVector2 centerCellPosition;
  
  private int currentColumn;
  
  private int currentRow;
  
  private IntVector2 cellPointer;
  
  public OnCellCounter(Grid grid, IntVector2 centerCellPosition)
  {
    this.grid = grid;
    this.centerCellPosition = centerCellPosition;
  }
  
  public int Evaluate()
  {
    for(this.currentColumn = this.GetLowerBoundX(); this.currentColumn <= this.GetUpperBoundX(); this.currentColumn++)
    {
      for(this.currentRow = this.GetLowerBoundY(); this.currentRow <= this.GetUpperBoundY(); this.currentRow++)
      {
        this.cellPointer = this.GetCellPointer();
        
        if(!this.PointingAtCenterCell())
        {
          this.EvaluateCurrentCell();
        }
      }
    }
    
    return this.countedCells;
  }
  
  private int GetLowerBoundX()
  {
    return this.centerCellPosition.X - 1;
  }
  
  private int GetUpperBoundX()
  {
    return this.centerCellPosition.X + 1;
  }
  
  private int GetLowerBoundY()
  {
    return this.centerCellPosition.Y - 1;
  }
  
  private int GetUpperBoundY()
  {
    return this.centerCellPosition.Y + 1;
  }
  
  private IntVector2 GetCellPointer()
  {
    return new IntVector2(this.currentColumn, this.currentRow);
  }
  
  private boolean PointingAtCenterCell()
  {
    return this.centerCellPosition.equals(this.cellPointer);
  }
  
  private void EvaluateCurrentCell()
  {
    if(this.IsCellPointerWithinBounds())
    {
      Cell pointedCell = this.GetPointedCell();
      
      if(pointedCell.State == CellState.On)
      {
        this.countedCells++;
      }
    }
  }
  
  private boolean IsCellPointerWithinBounds()
  {
    return this.grid.IndexIsWithinBounds(this.cellPointer.X, this.cellPointer.Y);
  }
  
  private Cell GetPointedCell()
  {
    return grid.Get(this.cellPointer.X, this.cellPointer.Y);
  }
}
