using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;


public class CharacterManager : MonoBehaviour
{
    //this is a note!
    public static CharacterManager instance;

    public List<string> Keys = new List<string>();
    public List<int> Values = new List<int>();
    public Dictionary<string, int> conversationData = new Dictionary<string, int>();

    private TextMeshProUGUI[] ConversantNames;
    private Image[] ConversantPictures;

    // Start is called before the first frame update
    void Awake()
    {
        instance = this;

        for (int i = 0; i < Values.Count; i++)
        {
            conversationData.Add(Keys[i], Values[i]);
        }
    }

    // Update is called once per frame
    void Update()
    {

    }
}