import java.util.List;

class LimitedList<T>
{
  private List<T> data;
  
  public final int MaxElements;
  
  public LimitedList(int maxElements)
  {
    this.MaxElements = maxElements;
    this.data = new ArrayList<T>(this.MaxElements);
  }
  
  public void Add(T element)
  {
    if(this.IsFull())
    {
      this.RemoveFirstElement();
    }
    
    this.data.add(element);
  }
  
  public boolean IsFull()
  {
    return this.GetSize() >= this.MaxElements;
  }
  
  private void RemoveFirstElement()
  {
    int indexFirstElement = 0;
    this.data.remove(indexFirstElement);
  }
  
  public T Get(int index)
  {
    return this.data.get(index);
  }
  
  public T GetLastElement()
  {
    if(!this.IsEmpty())
    {
      int indexLastElement = this.GetSize() - 1;
      return this.Get(indexLastElement);
    }
    else
    {
      return null;
    }
  }
  
  public boolean IsEmpty()
  {
    return this.GetSize() == 0;
  }
  
  public int GetSize()
  {
    return this.data.size();
  }
}
