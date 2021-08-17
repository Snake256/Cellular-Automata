class LineRenderer
{  
  private LineCollection lines;
  
  private int lineIndex;
  
  private Line currentLine;
  
  private int currentCell;
  
  public void Draw(LineCollection lines)
  {
    this.lines = lines;
    rectMode(CORNER);
    noStroke();
    
    for(this.lineIndex = 0; this.lineIndex < this.lines.GetSize(); this.lineIndex++)
    {
      this.currentLine = this.GetCurrentLine();
      this.DrawCurrentLine();      
    }
  }
  
  private Line GetCurrentLine()
  {
    return this.lines.GetLine(this.lineIndex);
  }
  
  private void DrawCurrentLine()
  {
    for(this.currentCell = 0; this.currentCell < this.GetLineSize(); this.currentCell++)
    {
      this.ApplyFill();
      rect(this.currentCell, this.lineIndex, 1, 1);
    }
  }
  
  private int GetLineSize()
  {
    return this.currentLine.GetSize();
  }
  
  private void ApplyFill()
  {
    int cellValue = this.GetCurrentCellValue();
    fill(cellValue == 0 ? 255 : 0);
  }
  
  private int GetCurrentCellValue()
  {
    return this.currentLine.GetBit(this.currentCell);
  }
}
