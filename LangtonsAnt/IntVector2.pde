class IntVector2
{
  public int X;
  
  public int Y;
  
  public IntVector2(int x, int y)
  {
    this.X = x;
    this.Y = y;
  }
  
  public int GetProduct()
  {
    return this.X * this.Y;
  }
  
  public boolean equals(IntVector2 vecToCompare)
  {
    return this.X == vecToCompare.X && this.Y == vecToCompare.Y;
  }
  
  public IntVector2 Copy()
  {
    return new IntVector2(this.X, this.Y);
  }
  
  public void Add(IntVector2 vectorToAdd)
  {
    this.X += vectorToAdd.X;
    this.Y += vectorToAdd.Y;
  }
}
