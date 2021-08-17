Rule GetSpiralGrowthRule()
{
  Rule spiralGrowthRule = new Rule(2, 2);
  spiralGrowthRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.NoTurn, 1));
  spiralGrowthRule.SetTriple(0, 1, new Triple(1, DirectionSwitch.Left, 0));
  spiralGrowthRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.Right, 1));
  spiralGrowthRule.SetTriple(1, 1, new Triple(0, DirectionSwitch.NoTurn, 0));
  
  return spiralGrowthRule;
}

Rule GetSnowflakeRule()
{
  Rule snowflakeRule = new Rule(2, 3);
  snowflakeRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Left, 1));
  snowflakeRule.SetTriple(0, 1, new Triple(1, DirectionSwitch.Right, 0));
  snowflakeRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.UTurn, 1));
  snowflakeRule.SetTriple(1, 1, new Triple(1, DirectionSwitch.UTurn, 2));
  snowflakeRule.SetTriple(2, 1, new Triple(0, DirectionSwitch.UTurn, 0));
  
  return snowflakeRule;
}

Rule GetFibonacciSpiralRule()
{
  Rule fibonacciSpiralRule = new Rule(2, 2);
  fibonacciSpiralRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Left, 1));
  fibonacciSpiralRule.SetTriple(0, 1, new Triple(1, DirectionSwitch.Left, 1));
  fibonacciSpiralRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.Right, 1));
  fibonacciSpiralRule.SetTriple(1, 1, new Triple(0, DirectionSwitch.NoTurn, 0));
  
  return fibonacciSpiralRule;
}

Rule GetExpandingFrameRule()
{
  Rule expandingFrameRule = new Rule(2, 2);
  expandingFrameRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Left, 0));
  expandingFrameRule.SetTriple(0, 1, new Triple(1, DirectionSwitch.Right, 1));
  expandingFrameRule.SetTriple(1, 0, new Triple(0, DirectionSwitch.Right, 0));
  expandingFrameRule.SetTriple(1, 1, new Triple(0, DirectionSwitch.Left, 1));
  
  return expandingFrameRule;
}
 //<>//
Rule GetTexturedChaoticGrowthRule()
{
  Rule texturedChaoticGrowthRule = new Rule(2, 2);
  texturedChaoticGrowthRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Right, 1));
  texturedChaoticGrowthRule.SetTriple(0, 1, new Triple(1, DirectionSwitch.Left, 1));
  texturedChaoticGrowthRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.Right, 1));
  texturedChaoticGrowthRule.SetTriple(1, 1, new Triple(0, DirectionSwitch.Right, 0));
  
  return texturedChaoticGrowthRule;
}

Rule GetChaoticGrowthWithHighwayRule()
{
  Rule chaoticGrowthWithHighwayRule = new Rule(2, 2);
  chaoticGrowthWithHighwayRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Right, 1));
  chaoticGrowthWithHighwayRule.SetTriple(0, 1, new Triple(0, DirectionSwitch.Right, 1));
  chaoticGrowthWithHighwayRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.NoTurn, 0));
  chaoticGrowthWithHighwayRule.SetTriple(1, 1, new Triple(1, DirectionSwitch.NoTurn, 1));
  
  return chaoticGrowthWithHighwayRule;
}

Rule GetFilledSpiralRule()
{
  Rule filledSpiralRule = new Rule(2, 2);
  filledSpiralRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Left, 1));
  filledSpiralRule.SetTriple(0, 1, new Triple(0, DirectionSwitch.NoTurn, 0));
  filledSpiralRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.NoTurn, 0));
  filledSpiralRule.SetTriple(1, 1, new Triple(1, DirectionSwitch.Right, 0));
  
  return filledSpiralRule;
}

Rule GetStripedSpiralRule()
{
  Rule stripedSpiralRule = new Rule(2, 2);
  stripedSpiralRule.SetTriple(0, 0, new Triple(0, DirectionSwitch.Right, 1));
  stripedSpiralRule.SetTriple(0, 1, new Triple(0, DirectionSwitch.Left, 0));
  stripedSpiralRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.Left, 1));
  stripedSpiralRule.SetTriple(1, 1, new Triple(0, DirectionSwitch.Right, 0));
  
  return stripedSpiralRule;
}

Rule GetBismuthRule()
{
  Rule bismuthRule = new Rule(2, 2);
  bismuthRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Right, 1));
  bismuthRule.SetTriple(0, 1, new Triple(0, DirectionSwitch.Right, 0));
  bismuthRule.SetTriple(1, 0, new Triple(0, DirectionSwitch.NoTurn, 0));
  bismuthRule.SetTriple(1, 1, new Triple(1, DirectionSwitch.Right, 1));
  
  return bismuthRule;
}

Rule GetNestedCabinetsRule()
{
  Rule nestedCabinetsRule = new Rule(2, 2);
  nestedCabinetsRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Left, 1));
  nestedCabinetsRule.SetTriple(0, 1, new Triple(1, DirectionSwitch.Right, 1));
  nestedCabinetsRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.NoTurn, 0));
  nestedCabinetsRule.SetTriple(1, 1, new Triple(0, DirectionSwitch.NoTurn, 1));
  
  return nestedCabinetsRule;
}

Rule GetDiamondRule()
{
  Rule diamondRule = new Rule(2, 2);
  diamondRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.NoTurn, 1));
  diamondRule.SetTriple(0, 1, new Triple(0, DirectionSwitch.Right, 1));
  diamondRule.SetTriple(1, 0, new Triple(1, DirectionSwitch.Left, 0));
  diamondRule.SetTriple(1, 1, new Triple(1, DirectionSwitch.Right, 0));
  
  return diamondRule;
}

Rule GetTexturedBallRule()
{
  Rule texturedBallRule = new Rule(2, 2);
  texturedBallRule.SetTriple(0, 0, new Triple(1, DirectionSwitch.Left, 1));
  texturedBallRule.SetTriple(0, 1, new Triple(1, DirectionSwitch.Right, 0));
  texturedBallRule.SetTriple(1, 0, new Triple(0, DirectionSwitch.Left, 0));
  texturedBallRule.SetTriple(1, 1, new Triple(0, DirectionSwitch.Left, 0));
  
  return texturedBallRule;
}
