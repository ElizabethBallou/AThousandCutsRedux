using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

//handles displaying text
public class DisplayManager
{
    public DisplayManager(GameObject conversantPrefab, GameObject rosaPrefab, Transform choiceParent){
        this.conversantPrefab = conversantPrefab;
        this.rosaPrefab = rosaPrefab;
        foreach(Transform child in choiceParent){
            choices.Add(child.GetComponent<TextMeshProUGUI>());
        }
        foreach(TextMeshProUGUI choice in choices){
            choice.text = "";
        }
    }
    public GameObject rosaPrefab;
    public GameObject conversantPrefab;
    public List<TextMeshProUGUI> choices = new List<TextMeshProUGUI>();
    // Start is called before the first frame update
    public void WriteText(string text, string characterName, bool isRosa){
        Character character = Services.CharacterManager.characters[characterName];
        Transform parent = character.transform;
        GameObject textObj;
        if(isRosa){
            textObj = GameObject.Instantiate(rosaPrefab,parent);
        }else{
            textObj = GameObject.Instantiate(conversantPrefab,parent);
        }
        textObj.transform.localPosition = new Vector2(0,character.height);
        TextMeshProUGUI textDisplay = textObj.transform.GetChild(0).GetChild(0).GetComponent<TextMeshProUGUI>();
        textDisplay.text = text;
        character.texts.Add(text);
        character.height -= 50;
        
    }
}
