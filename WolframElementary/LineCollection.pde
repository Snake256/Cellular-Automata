class LineCollection
{
  public final int Limit;
  
  private LimitedList<Line> savedLines;
  
  public LineCollection(int limit)
  {
    this.Limit = limit;
    this.savedLines = new LimitedList<Line>(this.Limit);
  }
  
  public void AddLine(Line line)
  {
    this.savedLines.Add(line);
  }
  
  public Line GetLine(int index)
  {
    return this.savedLines.Get(index);
  }
  
  public Line GetLastLine()
  {
    return this.savedLines.GetLastElement();
  }
  
  public int GetSize()
  {
    return this.savedLines.GetSize();
  }
}
