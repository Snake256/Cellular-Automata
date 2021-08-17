void mouseWheel(MouseEvent me)
{
  cameraController.OnScroll(me.getCount());
  FlagForRedraw();
}

void mouseDragged()
{
  cameraController.MouseDragged();
  FlagForRedraw();
}

class CameraController
{
  private Camera camera;
  
  private NavigationSettings navSettings;
    
  public CameraController(Camera camera, NavigationSettings navSettings)
  {
    this.camera = camera;
    this.navSettings = navSettings;
  }
  
  public void OnScroll(int scrollCount)
  {
    this.ApplyZoomChange(scrollCount);
    this.ConstrainZoom();
  }
  
  private void ApplyZoomChange(int scrollCount)
  {
    this.camera.Zoom *= pow(this.navSettings.ScrollSensitivity, scrollCount);
  }
  
  private void ConstrainZoom()
  {
    this.camera.Zoom = constrain(this.camera.Zoom, this.navSettings.MinZoom, this.navSettings.MaxZoom);
  }
  
  public void MouseDragged()
  {
    this.camera.FocusedPoint = this.camera.FocusedPoint.add(this.GetCameraChange());
  }
  
  private PVector GetCameraChange()
  {
    return new PVector(-GetMouseXDiff() / this.camera.Zoom, GetMouseYDiff() / this.camera.Zoom);
  }
}
