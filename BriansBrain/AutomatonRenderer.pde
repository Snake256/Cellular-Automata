abstract class AutomatonRenderer
{
  public abstract void Draw();
  
  public abstract void DrawStepCount(float textSize, float xOffset, float yOffset);
}

class BrainRenderer extends AutomatonRenderer
{
  private BrainAutomaton brainAutomaton;
  
  private int currentColumn;
  
  private int currentRow;
  
  private Cell currentCell;
  
  public BrainRenderer(BrainAutomaton brainAutomaton)
  {
    this.brainAutomaton = brainAutomaton;
  }
  
  public void Draw()
  {
    rectMode(CORNER);
    
    for(this.currentColumn = 0; this.currentColumn < brainAutomaton.GetColumns(); this.currentColumn++)
    {
      for(this.currentRow = 0; this.currentRow < brainAutomaton.GetRows(); this.currentRow++)
      {
        this.currentCell = this.GetCurrentCell();
        this.ApplyFill();
        this.DrawCurrentCell();
      }
    }
  }
  
  private Cell GetCurrentCell()
  {
    return this.brainAutomaton.Cells.Get(this.currentColumn, this.currentRow);
  }
  
  private void ApplyFill()
  {
    if(this.currentCell.State == CellState.On)
    {
      fill(0, 0, 255);
    }
    else if(this.currentCell.State == CellState.Dying)
    {
      fill(255);
    }
    else
    {
      fill(0);
    }
  }
  
  private void DrawCurrentCell()
  {
    rect
    (
      this.currentColumn,
      - (this.currentRow + 1), // - to flip the y axis, +1 is added to currentRow because rectangles are drawn from the top left corner
      1,
      1
    );
  }
  
  public void DrawStepCount(float textSize, float xOffset, float yOffset)
  {
    pushMatrix();
    textSize(textSize);
    text("Current Step: " + this.brainAutomaton.StepCount, xOffset, yOffset);
    popMatrix();
  }
}
