int timePreviousFrame;
int timeCurrentFrame;

StopWatch updateStopWatch = new StopWatch();

void UpdateTimeForCurrentFrame()
{
  timePreviousFrame = timeCurrentFrame;
  timeCurrentFrame = millis();
}

int GetDeltaTimeInMs()
{
  return timeCurrentFrame - timePreviousFrame;
}

boolean HasExceededDelayTime()
{
  return updateStopWatch.HasExceededTime(timeBetweenAutomatonUpdatesInMs);
}

void ResetUpdateStopWatch()
{
  updateStopWatch.SubtractElapsedTime(timeBetweenAutomatonUpdatesInMs);
}

class StopWatch
{
  public int ElapsedTimeInMs;
  
  public void AddElapsedTime(int elapsedDeltaTimeInMs)
  {
    this.ElapsedTimeInMs += elapsedDeltaTimeInMs;
  }
  
  public void SubtractElapsedTime(int timeToRemoveInMs)
  {
    this.ElapsedTimeInMs -= timeToRemoveInMs;
  }
  
  public boolean HasExceededTime(int time)
  {
    return this.ElapsedTimeInMs > time;
  }
}
