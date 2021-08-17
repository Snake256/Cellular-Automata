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

class LifeAutomaton extends Automaton2D
{
  private Grid nextGeneration;
  
  private int currentColumn;
  
  private int currentRow;
  
  private IntVector2 cellPointer;
  
  private Cell pointedCell;
  
  private Cell pointedCellNextGeneration;
  
  private int surroundingAliveCellCount;
  
  public LifeAutomaton(Grid initialState)
  {
    this.Cells = initialState;
    this.Dimensions = this.Cells.Dimensions.Copy();
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
        this.surroundingAliveCellCount = this.GetSurroundingAliveCellCount();
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
  
  private int GetSurroundingAliveCellCount()
  {
    return CountSurroundingAliveCells(this.Cells, this.cellPointer);
  }
  
  private void DetermineNewCellState()
  {
    if(this.IsNewBirth())
    {
      this.pointedCellNextGeneration.Alive = true;
    }
    else if(this.IsLonely())
    {
      this.pointedCellNextGeneration.Alive = false;
    }
    else if(this.IsSurviving())
    {
      this.pointedCellNextGeneration.Alive = true;
    }
    else if(this.IsOverpopulated())
    {
      this.pointedCellNextGeneration.Alive = false;
    }
  }
  
  private boolean IsNewBirth()
  {
    return !this.pointedCell.Alive && this.surroundingAliveCellCount == 3;
  }
  
  private boolean IsLonely()
  {
    return this.pointedCell.Alive && this.surroundingAliveCellCount == 1;
  }
  
  private boolean IsSurviving()
  {
    return this.pointedCell.Alive && (this.surroundingAliveCellCount == 2 || this.surroundingAliveCellCount == 3);
  }
  
  private boolean IsOverpopulated()
  {
    return this.pointedCell.Alive && this.surroundingAliveCellCount > 3;
  }
  
  private void PersistNextGeneration()
  {
    this.Cells = this.nextGeneration;
    this.nextGeneration = null;
  }
}
