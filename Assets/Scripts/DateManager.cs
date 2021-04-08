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
    
    //this function splits the DateList text file by line break, giving the game a list of dates to display. It is called at the beginning of the game.
    public void HandleDateText(TextAsset thisText)
    {
        DateList = thisText.text.Split('\n').ToList();
    }

    //this function moves to the next date on DateList.
    public void TimePassing()
    {
        dateListIndex++;
    }
}
