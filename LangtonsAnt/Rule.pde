class Rule
{
  private ArrayList<DirectionSwitch> directionSwitches;
  
  public Rule(ArrayList<DirectionSwitch> directionSwitches)
  {
    this.directionSwitches = directionSwitches;
  }
  
  public DirectionSwitch GetDirectionSwitch(int index)
  {
    return this.directionSwitches.get(index);
  }
  
  public int GetSize()
  {
    return this.directionSwitches.size();
  }
}
