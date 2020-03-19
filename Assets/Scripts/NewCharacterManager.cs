using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public enum CharacterState{
    NoText,
    OnRead,
    TalkingTo
}
public class NewCharacterManager
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
        characters.Add("Duane", new Character("Duane",GameObject.Find("Duane").transform,choicesParent.GetChild(2)));
        characters["Duane"].textNotification = characterDisplayText[2];
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
    public Character(string name, Transform place, Transform choices){
        this.name = name;
        this.transform = place;
        transform.gameObject.SetActive(false);
        this.choices = choices;
        choices.gameObject.SetActive(false);
    }
    
    
}
