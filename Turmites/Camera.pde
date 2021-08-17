class Camera
{
  public PVector FocusedPoint;
  
  public float Zoom;
  
  public Camera(PVector focusedPoint, float zoom)
  {
    this.FocusedPoint = focusedPoint;
    this.Zoom = zoom;
  }
}
