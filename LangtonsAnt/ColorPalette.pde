class ColorPalette
{
  private color[] colors;
  
  public ColorPalette(color[] colors)
  {
    this.colors = colors;
  }
  
  public color GetColor(int index)
  {
    return this.colors[index];
  }
  
  public int GetSize()
  {
    return this.colors.length;
  }
}
