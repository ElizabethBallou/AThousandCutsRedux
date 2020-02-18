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
    public void Initialize(Transform mainPageParent)
    {
        characters.Add("Olivia",new Character("Olivia",GameObject.Find("Olivia").transform));
        characters["Olivia"].textNotification = mainPageParent.GetChild(0).GetComponent<TextMeshProUGUI>();
        characters.Add("Mikaela",new Character("Mikaela",GameObject.Find("Mikaela").transform));
        characters["Mikaela"].textNotification = mainPageParent.GetChild(1).GetComponent<TextMeshProUGUI>();
        characters.Add("Duane", new Character("Duane",GameObject.Find("Duane").transform));
        characters["Duane"].textNotification = mainPageParent.GetChild(2).GetComponent<TextMeshProUGUI>();
    }
}
public class Character
{
    public string name;
    public CharacterState state = CharacterState.NoText;
    public Transform transform;
    public float height = 0;
    public List<string> texts = new List<string>();
    public TextMeshProUGUI textNotification;
    public Character(string name, Transform place){
        this.name = name;
        this.transform = place;
        transform.gameObject.SetActive(false);
    }
    
    
}
