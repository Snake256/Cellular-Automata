int timeBetweenAutomatonUpdatesInMs = 100;
boolean shouldRedrawScreen = true; // set to true so an initial draw call is performed
int stepsPerUpdate = 1;

Automaton2D automaton;
ColorPalette colorPalette;
Camera camera;
NavigationSettings navigationSettings;
CameraController cameraController;
AutomatonRenderer renderer;

void setup()
{
  size(1706, 960); // 16:9 screenratio
  
  // uncomment whatever rule you want to be initialized
  
  InitChaoticGrowth();
  //InitExpandingSquare1();
  //InitExpandingSquare2();
  //InitExpandingTriangle();
  //InitCardioid();
  
  
  InitRenderingUtilities();
  UpdateTimeForCurrentFrame(); // start measuring time after everything is set up
}

void InitRenderingUtilities()
{
  InitColorPalette();
  InitCamera();
  InitNavigationSettings();
  InitCameraController();
  InitAutomatonRenderer();
}

void InitColorPalette()
{
  color[] colors =
  {
    color(255, 255, 255),
    color(255, 0, 0),
    color(0, 255, 0),
    color(0, 0, 255),
    color(255, 106, 0),
    color(255, 216, 0),
    color(0, 255, 255),
    color(178, 0, 255),
    color(255, 0, 110),
    color(76, 255, 0),
    color(255, 127, 127),
    color(255, 233, 127)
    
    // ###################
    // add new colors here
    // ###################
    
  };
  
  colorPalette = new ColorPalette(colors);
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
  renderer = new AntRenderer((AntAutomaton) automaton, colorPalette);
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
  automaton.Step(stepsPerUpdate);
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
