class Line
{
  private int[] bits;
  
  public Line(int size)
  {
    this.bits = new int[size];
  }
  
  public int GetBit(int index)
  {
    return this.bits[index];      
  }
  
  public void SetBit(int index, int value)
  {
    this.bits[index] = value;
  }
  
  private int GetBitToTheLeft(int index)
  {
    if(this.IsLeftmostIndex(index))
    {
      return 0;
    }
    else
    {
      return this.GetBit(index - 1);
    }
  }
  
  public boolean IsLeftmostIndex(int index)
  {
    return index == 0;
  }
  
  private int GetBitToTheRight(int index)
  {
    if(this.IsRightmostIndex(index))
    {
      return 0;
    }
    else
    {
      return this.GetBit(index + 1);
    }
  }
  
  private boolean IsRightmostIndex(int index)
  {
    return index == (this.GetSize() - 1);
  }
  
  public int GetSize()
  {
    return this.bits.length;
  }
}
