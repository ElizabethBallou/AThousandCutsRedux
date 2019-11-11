using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class EventManager : MonoBehaviour
{
    public Dictionary<string, int> eventOrder = new Dictionary<string, int>();

    public void Awake()
    {
        eventOrder.Add("Mikaela", 1);
        eventOrder.Add("Olivia", 1);
        eventOrder.Add("Olivia", 2);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
