using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class NewCharacterManager
{
    public Dictionary<string, Character> characters = new Dictionary<string, Character>();
    private TextMeshProUGUI[] ConversantNames;
    private Image[] ConversantPictures;

    // Start is called before the first frame update
    public void Initialize()
    {
        characters.Add("Olivia",new Character("Olivia",GameObject.Find("Olivia").transform));
        characters.Add("Mikaela",new Character("Mikaela",GameObject.Find("Mikaela").transform));
        characters.Add("Duane", new Character("Duane",GameObject.Find("Duane").transform));
    }

    // Update is called once per frame
    void Update()
    {

    }
}
public class Character
{
    public string name;
    public Transform transform;
    public float height = 0;
    public List<string> texts = new List<string>();
    public Character(string name, Transform place){
        this.name = name;
        this.transform = place;
    }
    
    
}
