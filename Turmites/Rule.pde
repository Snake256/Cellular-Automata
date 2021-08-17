class Rule
{
  public int ColorCount;
  
  public int StateCount;
  
  private Triple[] triples;
  
  public Rule(int colorCount, int stateCount)
  {
    this.ColorCount = colorCount;
    this.StateCount = stateCount;
    this.triples = new Triple[this.GetSize()];
  }
  
  public int GetSize()
  {
    return this.ColorCount * this.StateCount;
  }
  
  public void SetTriple(int colorID, int state, Triple triple)
  {
    this.ValidateIndexIsWithinBounds(colorID, state);
    this.triples[this.ConvertIndex(colorID, state)] = triple;
  }
  
  public Triple GetTriple(int colorID, int state)
  {
    this.ValidateIndexIsWithinBounds(colorID, state);
    return this.triples[this.ConvertIndex(colorID, state)];
  }
  
  private void ValidateIndexIsWithinBounds(int colorID, int state)
  {
    if(!this.IndexIsWithinBounds(colorID, state))
    {
      throw new IllegalArgumentException("Index must be within bounds.");
    }
  }
  
  public boolean IndexIsWithinBounds(int colorID, int state)
  {
    return (colorID >= 0 && colorID < this.ColorCount)
      && (state >= 0 && state < this.StateCount);
  }
  
  private int ConvertIndex(int colorID, int state)
  {
    return Convert2DIndexTo1DIndex(colorID, state, this.ColorCount);
  }
}
