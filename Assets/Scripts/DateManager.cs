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
        Debug.Log("The length of dateList is " + DateList.Count);
    }

    public void TimePassing()
    {
        dateListIndex++;
    }
}
