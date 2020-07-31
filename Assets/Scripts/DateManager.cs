using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class DateManager
{

    public List<string> DateList;
    public int dateListIndex = 0;

    private void Awake()
    {
        
    }
    
    public void HandleDateText(TextAsset thisText)
    {
        DateList = thisText.text.Split('\n').ToList();
    }

    public void TimePassing()
    {
        dateListIndex++;
        Debug.Log("Time is passing. Now the dateListIndex is " + dateListIndex);
    }
}
