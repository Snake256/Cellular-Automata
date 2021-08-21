Camera CreateGridCentralizedCamera(IntVector2 dimensions, float relativeGridSize)
{
  return new Camera
  (
    GetGridCenter(dimensions),
    FindZoomWithRelativeGridSize(relativeGridSize, dimensions)
  );
}

void ApplyCameraTransformations(Camera camera)
{
  scale(camera.Zoom);
  translate(-camera.FocusedPoint.x, camera.FocusedPoint.y);
}

void ApplyStrokeWeight(float strokeWeight, Camera camera)
{
  // strokeWeight is scaled as well with a call to scale() so this strokeWeight needs to be scaled down
  strokeWeight(strokeWeight / camera.Zoom);
}

void SetOriginToGridCenter()
{
  translate(width / 2f, height / 2f);
}

int GetMouseXDiff()
{
  return mouseX - pmouseX;
}

int GetMouseYDiff()
{
  return mouseY - pmouseY;
}

float FindZoomWithRelativeGridSize(float relativeGridSize, IntVector2 gridDimensions)
{
  ValidateRelativeGridSize(relativeGridSize);  
  float verticalZoom = FindVerticalZoomWithRelativeGridSize(relativeGridSize, gridDimensions);
  float horizontalZoom = FindHorizontalZoomWithRelativeGridSize(relativeGridSize, gridDimensions);
  
  return verticalZoom > horizontalZoom ? horizontalZoom : verticalZoom;
}

void ValidateRelativeGridSize(float relativeGridSize)
{
  if(!IsRelativeGridSizeWithinBounds(relativeGridSize))
  {
    throw new IllegalArgumentException("RelativeGridSize needs to be greater than 0 and less than or equal to 1.");
  }
}

boolean IsRelativeGridSizeWithinBounds(float relativeGridSize)
{
  return relativeGridSize > 0f && relativeGridSize <= 1f;
}

float FindVerticalZoomWithRelativeGridSize(float relativeGridSize, IntVector2 gridDimensions)
{
  float verticalGridSizePX = height * relativeGridSize;
  return verticalGridSizePX / (float) gridDimensions.Y; 
}

float FindHorizontalZoomWithRelativeGridSize(float relativeGridSize, IntVector2 gridDimensions)
{
  float horizontalGridSizePX = width * relativeGridSize;
  return horizontalGridSizePX / (float) gridDimensions.X; 
}

void FlagForRedraw()
{
  shouldRedrawScreen = true;
}

void UnflagForRedraw()
{
  shouldRedrawScreen = false;
}
