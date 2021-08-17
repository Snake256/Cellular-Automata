abstract class AutomatonRenderer
{
  public abstract void Draw();
  
  public abstract void DrawStepCount(float textSize, float xOffset, float yOffset);
}

class TurmiteRenderer extends AutomatonRenderer
{
  private int currentColumn;
  
  private int currentRow;
  
  private Cell currentCell;
  
  private TurmiteAutomaton turmiteAutomaton;
  
  private ColorPalette colorPalette;
  
  public TurmiteRenderer(TurmiteAutomaton turmiteAutomaton, ColorPalette colorPalette)
  {
    this.turmiteAutomaton = turmiteAutomaton;
    this.colorPalette = colorPalette;
  }
  
  public void Draw()
  {
    this.DrawCells();
    this.DrawAnt();
  }
  
  private void DrawCells()
  {
    rectMode(CORNER);
    
    for(this.currentColumn = 0; this.currentColumn < turmiteAutomaton.GetColumns(); this.currentColumn++)
    {
      for(this.currentRow = 0; this.currentRow < turmiteAutomaton.GetRows(); this.currentRow++)
      {
        this.currentCell = this.GetCurrentCell();
        this.DrawCurrentCell();
      }
    }
  }
  
  private Cell GetCurrentCell()
  {
    return turmiteAutomaton.Cells.Get(currentColumn, currentRow);
  }
  
  private void DrawCurrentCell()
  {
    this.ApplyFillForCurrentCell();
    rect
    (
      currentColumn,
      - (currentRow + 1), // - to flip the y axis, +1 is added to currentRow because rectangles are drawn from the top left corner
      1,
      1
    );
  }
  
  private void ApplyFillForCurrentCell()
  {
    fill(this.GetCurrentCellColor());
  }
  
  private color GetCurrentCellColor()
  {
    return this.colorPalette.GetColor(currentCell.ColorID);
  }
  
  private void DrawAnt()
  {
    ellipseMode(CENTER);
    fill(255, 0, 0);
    PVector antPosCellCentered = this.GetAntPosCellCentered();
    ellipse(antPosCellCentered.x, -antPosCellCentered.y, 0.5f, 0.5f);
  }
  
  private PVector GetAntPosCellCentered()
  {
    IntVector2 antPos = turmiteAutomaton.Ant.Position;
    PVector antPosCellCentered = GetCellCenter(antPos);
    return antPosCellCentered;
  }
  
  public void DrawStepCount(float textSize, float xOffset, float yOffset)
  {
    pushMatrix();
    textSize(textSize);
    text("Current Step: " + this.turmiteAutomaton.StepCount, xOffset, yOffset);
    popMatrix();
  }
}
