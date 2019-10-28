using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

[Serializable]
    public class Conversation
{
    public TextAsset text;
    public int InkKnotIndex;
}

public class CharacterManager : MonoBehaviour
{
    public static CharacterManager instance;

    public List<string> Keys = new List<string>();
    public List<Conversation> Values = new List<Conversation>();
    public Dictionary<string, Conversation> conversationData = new Dictionary<string, Conversation>();

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