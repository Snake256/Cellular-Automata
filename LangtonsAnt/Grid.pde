class Grid
{
  public IntVector2 Dimensions;
  
  private Cell[] data;
  
  public Grid(int rows, int columns)
  {
    this.Dimensions = new IntVector2(rows, columns);
    this.InitializeData();
  }
  
  private void InitializeData()
  {
    this.data = new Cell[this.Dimensions.GetProduct()];
  }
  
  public Cell Get(int x, int y)
  {
    this.ValidateIndexIsWithinBounds(x, y);
    int index1D = this.ConvertIndex(x, y);
    return this.data[index1D];
  }
  
  public void Set(int x, int y, Cell value)
  {
    this.ValidateIndexIsWithinBounds(x, y);
    int index1D = this.ConvertIndex(x, y);
    this.data[index1D] = value;
  }
    
  public boolean IndexIsWithinBounds(int x, int y)
  {
    return (x >= 0 && x < this.Dimensions.X)
      && (y >= 0 && y < this.Dimensions.Y);
  }
  
  private void ValidateIndexIsWithinBounds(int x, int y)
  {
    if(!this.IndexIsWithinBounds(x, y))
    {
      throw new IllegalArgumentException("Index must be within bounds.");
    }
  }
  
  public int ConvertIndex(int x, int y)
  {
    return Convert2DIndexTo1DIndex(x, y, this.Dimensions.X);
  }
}
