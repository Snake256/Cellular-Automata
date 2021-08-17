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

class TurmiteAutomaton extends Automaton2D
{
  private Rule rule;
  
  public Ant Ant;
  
  private Cell currentCell;
  
  private Triple currentTriple;
  
  public TurmiteAutomaton(IntVector2 dimensions, IntVector2 startingPosition, Rule rule)
  {
    this.Dimensions = dimensions;
    this.Cells = InitializeEmptyGrid(dimensions.X, dimensions.Y);
    this.rule = rule;
    this.InitAnt(startingPosition);
  }
  
  private void InitAnt(IntVector2 startingPosition)
  {
    this.Ant = new Ant(startingPosition, Direction.North);
  }
  
  @Override
  public void NextGeneration()
  {    
    if(this.AntWithinGrid())
    {
      this.currentCell = this.GetCellFromAntPosition();
      this.currentTriple = this.GetCurrentTriple();
      this.SwitchAntDirection();
      this.ChangeCellColor();
      this.ChangeInternalState();
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
  
  private Triple GetCurrentTriple()
  {
    return this.rule.GetTriple(this.Ant.InternalState, this.currentCell.ColorID);
  }
  
  private void SwitchAntDirection()
  {
    DirectionSwitch dirSw = this.currentTriple.DirectionSwitch;
    
    switch(dirSw)
    {
      case Left:
        this.Ant.RotateLeft();
        break;
        
      case Right:
        this.Ant.RotateRight();
        break;
        
      case UTurn:
        this.Ant.RotateUTurn();
        break;
        
      case NoTurn:
        break;
    }
  }
  
  private void ChangeCellColor()
  {
    this.currentCell.ColorID = this.currentTriple.ColorIDToWrite;
  }
  
  private void MoveAnt()
  {
    this.Ant.Move();
  }
  
  private void ChangeInternalState()
  {
    this.Ant.InternalState = this.currentTriple.NewInternalState;
  }
}
