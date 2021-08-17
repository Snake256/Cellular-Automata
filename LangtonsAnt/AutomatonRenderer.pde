abstract class AutomatonRenderer
{
  public abstract void Draw();
  
  public abstract void DrawStepCount(float textSize, float xOffset, float yOffset);
}

class AntRenderer extends AutomatonRenderer
{
  private int currentColumn;
  
  private int currentRow;
  
  private Cell currentCell;
  
  private AntAutomaton antAutomaton;
  
  private ColorPalette colorPalette;
  
  public AntRenderer(AntAutomaton antAutomaton, ColorPalette colorPalette)
  {
    this.antAutomaton = antAutomaton;
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
    
    for(this.currentColumn = 0; this.currentColumn < antAutomaton.GetColumns(); this.currentColumn++)
    {
      for(this.currentRow = 0; this.currentRow < antAutomaton.GetRows(); this.currentRow++)
      {
        this.currentCell = this.GetCurrentCell();
        this.DrawCurrentCell();
      }
    }
  }
  
  private Cell GetCurrentCell()
  {
    return antAutomaton.Cells.Get(currentColumn, currentRow);
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
    IntVector2 antPos = antAutomaton.Ant.Position;
    PVector antPosCellCentered = GetCellCenter(antPos);
    return antPosCellCentered;
  }
  
  public void DrawStepCount(float textSize, float xOffset, float yOffset)
  {
    pushMatrix();
    textSize(textSize);
    text("Current Step: " + this.antAutomaton.StepCount, xOffset, yOffset);
    popMatrix();
  }
}
