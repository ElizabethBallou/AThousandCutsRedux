﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public enum CharacterState{
    NoText,
    OnRead,
    TalkingTo
}
public class CharacterManager
{
    public Dictionary<string, Character> characters = new Dictionary<string, Character>();
    private TextMeshProUGUI[] ConversantNames;
    private Image[] ConversantPictures;

    // Start is called before the first frame update
    public void Initialize(List<TextMeshProUGUI> characterDisplayText, Transform choicesParent)
    {
        characters.Add("Olivia",new Character("Olivia",GameObject.Find("Olivia").transform,choicesParent.GetChild(0)));
        characters["Olivia"].textNotification = characterDisplayText[0];
        characters["Olivia"].textPreview = characterDisplayText[0].transform.parent.GetChild(1).GetComponent<TextMeshProUGUI>();
        characters.Add("Mikaela",new Character("Mikaela",GameObject.Find("Mikaela").transform,choicesParent.GetChild(1)));
        characters["Mikaela"].textNotification = characterDisplayText[1];
        characters["Mikaela"].textPreview = characterDisplayText[1].transform.parent.GetChild(1).GetComponent<TextMeshProUGUI>();
        characters.Add("Unknown", new Character("Unknown",GameObject.Find("Unknown").transform,choicesParent.GetChild(2)));
        characters["Unknown"].textNotification = characterDisplayText[2];
        characters["Unknown"].textPreview = characterDisplayText[2].transform.parent.GetChild(1).GetComponent<TextMeshProUGUI>();
        characters.Add("Rudy", new Character("Rudy", GameObject.Find("Rudy").transform, choicesParent.GetChild(3)));
        characters["Rudy"].textNotification = characterDisplayText[3];
        characters["Rudy"].textPreview = characterDisplayText[3].transform.parent.GetChild(1).GetComponent<TextMeshProUGUI>();
        characters.Add("Yujin", new Character("Yujin", GameObject.Find("Yujin").transform, choicesParent.GetChild(4)));
        characters["Yujin"].textNotification = characterDisplayText[4];
        characters["Yujin"].textPreview = characterDisplayText[4].transform.parent.GetChild(1).GetComponent<TextMeshProUGUI>();
        characters.Add("Pradhya", new Character("Pradhya", GameObject.Find("Pradhya").transform, choicesParent.GetChild(5)));
        characters["Pradhya"].textNotification = characterDisplayText[5];
        characters["Pradhya"].textPreview = characterDisplayText[5].transform.parent.GetChild(1).GetComponent<TextMeshProUGUI>();
    }
}
public class Character
{
    public string name;
    public CharacterState state = CharacterState.NoText;
    public Transform transform;
    public Transform choices;
    public float height = 0;
    public List<string> texts = new List<string>();
    public TextMeshProUGUI textNotification;
    public TextMeshProUGUI textPreview;
    public GameObject textingInProgressIcon;
    public GameObject blurLayer;
    public Character(string name, Transform place, Transform choices){
        this.name = name;
        this.transform = place;
        transform.gameObject.SetActive(false);
        this.choices = choices;
        choices.gameObject.SetActive(false);
        
    }
    
    
}
