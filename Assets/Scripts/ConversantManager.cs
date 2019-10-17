using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class ConversantManager : MonoBehaviour
{
    public GameObject[] Conversants;
    private TextMeshProUGUI[] ConversantNames;
    private Image[] ConversantPictures;
    Dictionary <string, TextAsset> characters = new Dictionary<string, TextAsset>();
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
