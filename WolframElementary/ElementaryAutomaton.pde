class ElementaryAutomaton
{
  private Rule rule;
  
  private Line currentGeneration;
  
  private Line nextGeneration;
  
  private int currentCellIndex;
  
  public ElementaryAutomaton(Rule rule)
  {
    this.rule = rule;
  }
  
  private Line GenerateNextGeneration(Line currentGeneration)
  {
    this.currentGeneration = currentGeneration;
    this.InitNextGeneration();
    this.EvaluateCellsNewGeneration();    
    return this.nextGeneration;
  }
  
  private void InitNextGeneration()
  {
    int size = this.currentGeneration.GetSize();
    this.nextGeneration = new Line(size);
  }
  
  private void EvaluateCellsNewGeneration()
  {
    for(this.currentCellIndex = 0; this.currentCellIndex < this.currentGeneration.GetSize(); this.currentCellIndex++)
    {
      this.EvaluateCellStateNewGeneration();
    }
  }
  
  private void EvaluateCellStateNewGeneration()
  {    
    int ruleIndex = this.GetRuleIndexForCurrentCell();
    int bitToWrite = this.GetBitToWrite(ruleIndex);
    this.PersistBit(bitToWrite);
  }
  
  private int GetRuleIndexForCurrentCell()
  {
    int leftValue = this.currentGeneration.GetBitToTheLeft(this.currentCellIndex);
    int middleValue = this.currentGeneration.GetBit(this.currentCellIndex);
    int rightValue = this.currentGeneration.GetBitToTheRight(this.currentCellIndex);
    return GetRuleIndex(leftValue, middleValue, rightValue);
  }
  
  private int GetBitToWrite(int ruleIndex)
  {
    return this.rule.GetBit(ruleIndex);
  }
  
  private void PersistBit(int bitToWrite)
  {
    this.nextGeneration.SetBit(this.currentCellIndex, bitToWrite);
  }
}
