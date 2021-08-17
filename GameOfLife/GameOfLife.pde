int timeBetweenAutomatonUpdatesInMs = 100;
boolean shouldRedrawScreen = true; // set to true so an initial draw call is performed

Automaton2D automaton;
Camera camera;
NavigationSettings navigationSettings;
CameraController cameraController;
AutomatonRenderer renderer;

void setup()
{
  size(1706, 960); // 16:9 screenratio
  InitAutomaton();
  InitRenderingUtilities();
  
  UpdateTimeForCurrentFrame(); // start measuring time after everything is set up
}

void InitAutomaton()
{
  int columns = 86;
  int rows = 48;
  float ratioInitialAliveCells = 0.25f;
  Grid startingGrid = InitializeRandomGrid(columns, rows, ratioInitialAliveCells);
  automaton = new LifeAutomaton(startingGrid);
}

void InitRenderingUtilities()
{
  InitCamera();
  InitNavigationSettings();
  InitCameraController();
  InitAutomatonRenderer();
}

void InitCamera()
{
  float relativeGridSize = 0.9f;
  camera = CreateGridCentralizedCamera(automaton.Dimensions, relativeGridSize);
}

void InitNavigationSettings()
{
  float scrollSensitivity = 1.1f;
  float minZoom = 5f;
  float maxZoom = 40f;
  navigationSettings = new NavigationSettings(scrollSensitivity, minZoom, maxZoom);
}

void InitCameraController()
{
  cameraController = new CameraController(camera, navigationSettings);
}

void InitAutomatonRenderer()
{
  renderer = new LifeRenderer((LifeAutomaton) automaton);
}

void draw()
{
  UpdateStopWatch();
  CheckForUpdate();
  CheckForRedraw();
}

void UpdateStopWatch()
{
  UpdateTimeForCurrentFrame();
  updateStopWatch.AddElapsedTime(GetDeltaTimeInMs());
}

void CheckForUpdate()
{
  if(HasExceededDelayTime())
  {
    Update();
    ResetUpdateStopWatch();
    FlagForRedraw();
  }
}

void Update()
{
  automaton.Step();
}

void CheckForRedraw()
{
  if(shouldRedrawScreen)
  {
    ClearScreen();
    Draw();
    UnflagForRedraw();
  }
}

void ClearScreen()
{
  background(200);
}

void Draw()
{
  DrawAutomaton();
  DrawStepCount();
}

void DrawAutomaton()
{
  pushMatrix();
  SetOriginToGridCenter();
  ApplyCameraTransformations(camera);
  ApplyStrokeWeight(1f, camera);
  renderer.Draw();
  popMatrix();
}

void DrawStepCount()
{
  pushMatrix();
  textAlign(LEFT, TOP);
  fill(0);
  float textSize = 30f;
  float xOffset = 15f;
  float yOffset = 5f;
  renderer.DrawStepCount(textSize, xOffset, yOffset);
  popMatrix();
}
