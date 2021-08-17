class Triple
{
  public int ColorIDToWrite;
  
  public DirectionSwitch DirectionSwitch;
  
  public int NewInternalState;
  
  public Triple(int colorIDToWrite, DirectionSwitch directionSwitch, int newInternalState)
  {
    this.ColorIDToWrite = colorIDToWrite;
    this.DirectionSwitch = directionSwitch;
    this.NewInternalState = newInternalState;
  }
}
