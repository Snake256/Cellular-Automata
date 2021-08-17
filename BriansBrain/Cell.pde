enum CellState
{
  On,
  Dying,
  Off
}

class Cell
{
  public CellState State;
  
  public Cell(CellState state)
  {
    this.State = state;
  }
}
