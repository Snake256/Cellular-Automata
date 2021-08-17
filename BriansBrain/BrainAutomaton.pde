abstract class Automaton2D
{
  public IntVector2 Dimensions;
  
  public Grid Cells;
  
  public int StepCount;
  
  private boolean stopped = false;
  
  public void Step()
  {
    if(!stopped)
    {
      this.NextGeneration();
      this.IncrementStepCount();
    }
  }
  
  protected abstract void NextGeneration();
  
  private void IncrementStepCount()
  {
    this.StepCount++;
  }
  
  public void Stop()
  {
    this.stopped = true;
  }
  
  public int GetRows()
  {
    return this.Dimensions.Y;
  }
  
  public int GetColumns()
  {
    return this.Dimensions.X;
  }
}

class BrainAutomaton extends Automaton2D
{
  private Grid nextGeneration;
  
  private int currentColumn;
  
  private int currentRow;
  
  private IntVector2 cellPointer;
  
  private Cell pointedCell;
  
  private Cell pointedCellNextGeneration;
  
  private int surroundingOnCellCount;
  
  public BrainAutomaton(Grid initialState)
  {
    this.Cells = initialState;
    this.Dimensions = initialState.Dimensions.Copy();
  }
  
  @Override
  protected void NextGeneration()
  {
    this.InitNextGeneration();
    this.EvaluateNextGeneration();
    this.PersistNextGeneration();
  }
  
  private void InitNextGeneration()
  {
    this.nextGeneration = InitializeEmptyGrid(this.GetColumns(), this.GetRows());
  }
  
  private void EvaluateNextGeneration()
  {
    for(this.currentColumn = 0; this.currentColumn < this.GetColumns(); this.currentColumn++)
    {
      for(this.currentRow = 0; this.currentRow < this.GetRows(); this.currentRow++)
      {
        this.cellPointer = this.GetCellPointer();
        this.SetPointedCells();
        this.EvaluateSurroundingOnCellCount();
        this.DetermineNewCellState();
      }
    }
  }
  
  private IntVector2 GetCellPointer()
  {
    return new IntVector2(this.currentColumn, this.currentRow);
  }
  
  private void SetPointedCells()
  {
    this.pointedCell = this.GetPointedCell();
    this.pointedCellNextGeneration = this.GetPointedCellNextGeneration();
  }
  
  private Cell GetPointedCell()
  {
    return this.Cells.Get(this.currentColumn, this.currentRow);
  }
  
  private Cell GetPointedCellNextGeneration()
  {
    return this.nextGeneration.Get(this.currentColumn, this.currentRow);
  }
  
  private void EvaluateSurroundingOnCellCount()
  {
    this.surroundingOnCellCount = this.GetSurroundingOnCellCount();
  }
  
  private int GetSurroundingOnCellCount()
  {
    return CountSurroundingOnCells(this.Cells, this.cellPointer);
  }
  
  private void DetermineNewCellState()
  {
    this.EvaluateSurroundingOnCellCount();
    
    if(this.IsNewBirth())
    {
      this.pointedCellNextGeneration.State = CellState.On;
    }
    else if(this.IsTransitioningToDying())
    {
      this.pointedCellNextGeneration.State = CellState.Dying;
    }
    else if(this.IsShuttingOff())
    {
      this.pointedCellNextGeneration.State = CellState.Off;
    }
  }
  
  private boolean IsNewBirth()
  {
    return this.pointedCell.State == CellState.Off && this.surroundingOnCellCount == 2;
  }
  
  private boolean IsTransitioningToDying()
  {
    return this.pointedCell.State == CellState.On;
  }
  
  private boolean IsShuttingOff()
  {
    return this.pointedCell.State == CellState.Dying;
  }
  
  private void PersistNextGeneration()
  {
    this.Cells = this.nextGeneration;
    this.nextGeneration = null;
  }
}
