abstract class Automaton2D
{
  public IntVector2 Dimensions;
  
  public Grid Cells;
  
  public int StepCount;
  
  private boolean stopped = false;
  
  public void Step(int ammountOfSteps)
  {
    for(int i = 1; i <= ammountOfSteps; i++)
    {
      this.Step();
    }
  }
  
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

class AntAutomaton extends Automaton2D
{
  private Rule rule;
  
  public Ant Ant;
  
  private Cell currentCell;
  
  public AntAutomaton(IntVector2 dimensions, IntVector2 antStartingPosition, Rule rule)
  {
    this.Dimensions = dimensions;
    this.Cells = InitializeEmptyGrid(dimensions.X, dimensions.Y);
    this.rule = rule;
    this.InitAnt(antStartingPosition);
  }
  
  private void InitAnt(IntVector2 antStartingPosition)
  {
    this.Ant = new Ant(antStartingPosition, Direction.North);
  }
  
  @Override
  protected void NextGeneration()
  {
    if(this.AntWithinGrid())
    {
      this.currentCell = this.GetCellFromAntPosition();
      this.SwitchAntDirection();
      this.ChangeCellColor();
      this.MoveAnt();
    }
    else
    {
      this.Stop();
    }
  }
  
  private boolean AntWithinGrid()
  {
    IntVector2 antPos = this.Ant.Position;
    return this.Cells.IndexIsWithinBounds(antPos.X, antPos.Y);
  }
  
  private Cell GetCellFromAntPosition()
  {
    return this.Cells.Get(this.Ant.Position.X, this.Ant.Position.Y);
  }
  
  private void SwitchAntDirection()
  {
    DirectionSwitch dirSw = this.rule.GetDirectionSwitch(this.currentCell.ColorID);
    
    switch(dirSw)
    {
      case Left:
        this.Ant.RotateLeft();
        break;
        
      case Right:
        this.Ant.RotateRight();
        break;
    }
  }
  
  private void ChangeCellColor()
  {
    this.currentCell.ColorID++;
    
    if(this.currentCell.ColorID >= this.GetNumberOfColors())
    {
      this.currentCell.ColorID = 0;
    }
  }
  
  public int GetNumberOfColors()
  {
    return this.rule.GetSize();
  }
  
  private void MoveAnt()
  {
    this.Ant.Move();
  }
}
