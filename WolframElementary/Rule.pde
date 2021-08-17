class Rule
{
  private int byteRepresentation;
  
  public Rule(int byteRepresentation)
  {
    this.byteRepresentation = byteRepresentation;
  }
  
  public int GetBit(int index)
  {
    return GetBitAtIndex(this.byteRepresentation, index);
  }
}
