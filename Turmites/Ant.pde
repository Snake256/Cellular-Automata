class Ant
{
  public IntVector2 Position;
  
  public Direction Direction;
  
  public int InternalState;
  
  public Ant(IntVector2 position, Direction direction)
  {
    this.Position = position;
    this.Direction = direction;
    this.InternalState = 0;
  }
  
  public void RotateLeft()
  {
    switch(this.Direction)
    {
      case North:
        this.Direction = Direction.West;
        break;
        
      case East:
        this.Direction = Direction.North;
        break;
        
      case South:
        this.Direction = Direction.East;
        break;
        
      case West:
        this.Direction = Direction.South;
        break;
    }
  }
  
  public void RotateRight()
  {
    switch(this.Direction)
    {
      case North:
        this.Direction = Direction.East;
        break;
          
      case East:
        this.Direction = Direction.South;
        break;
        
      case South:
        this.Direction = Direction.West;
        break;
        
      case West:
        this.Direction = Direction.North;
        break;
    }
  }
  
  public void RotateUTurn()
  {
    switch(this.Direction)
    {
      case North:
        this.Direction = Direction.South;
        break;
          
      case East:
        this.Direction = Direction.West;
        break;
        
      case South:
        this.Direction = Direction.North;
        break;
        
      case West:
        this.Direction = Direction.East;
        break;
    }
  }
  
  public void Move()
  {
    switch(this.Direction)
    {
      case North:
        this.Position.Y++;
        break;
        
      case East:
        this.Position.X++;
        break;
        
      case South:
        this.Position.Y--;
        break;
        
      case West:
        this.Position.X--;
        break;
    }
  }
}
