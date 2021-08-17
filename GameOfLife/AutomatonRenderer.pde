abstract class AutomatonRenderer
{
  public abstract void Draw();
  
  public abstract void DrawStepCount(float textSize, float xOffset, float yOffset);
}

class LifeRenderer extends AutomatonRenderer
{
  private int currentColumn;
  
  private int currentRow;
  
  private Cell currentCell;
  
  private LifeAutomaton lifeAutomaton;
  
  public LifeRenderer(LifeAutomaton lifeAutomaton)
  {
    this.lifeAutomaton = lifeAutomaton;
  }
  
  public void Draw()
  {
    this.DrawCells();
  }
  
  private void DrawCells()
  {
    rectMode(CORNER);
    
    for(this.currentColumn = 0; this.currentColumn < lifeAutomaton.GetColumns(); this.currentColumn++)
    {
      for(this.currentRow = 0; this.currentRow < lifeAutomaton.GetRows(); this.currentRow++)
      {
        this.currentCell = this.GetCurrentCell();
        this.DrawCurrentCell();
      }
    }
  }
  
  private Cell GetCurrentCell()
  {
    return this.lifeAutomaton.Cells.Get(this.currentColumn, this.currentRow);
  }
  
  private void DrawCurrentCell()
  {
    this.ApplyFillForCurrentCell();
    rect
    (
      this.currentColumn,
      - (this.currentRow + 1), // - to flip the y axis, +1 is added to currentRow because rectangles are drawn from the top left corner
      1,
      1
    );
  }
  
  private void ApplyFillForCurrentCell()
  {
    fill(this.currentCell.Alive ? color(0, 255, 0) : color(255));
  }
  
  public void DrawStepCount(float textSize, float xOffset, float yOffset)
  {
    pushMatrix();
    textSize(textSize);
    text("Current Step: " + this.lifeAutomaton.StepCount, xOffset, yOffset);
    popMatrix();
  }
}
