using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using DG.Tweening;

//handles displaying text
public class DisplayManager
{
    public DisplayManager(GameObject conversantPrefab, GameObject rosaPrefab, Transform choiceParent){
        this.conversantPrefab = conversantPrefab;
        this.rosaPrefab = rosaPrefab;
        foreach(Transform character in choiceParent){
            string characterName = character.name;
            List<TextMeshProUGUI> choices = new List<TextMeshProUGUI>();
            foreach(Transform child in character){
                choices.Add(child.GetComponent<TextMeshProUGUI>());
            }
            characterChoices.Add(characterName,choices);
        }
        foreach(string character in characterChoices.Keys){
            foreach(TextMeshProUGUI choice in characterChoices[character]){
                choice.text = "";
            }
        }
    }
    public GameObject rosaPrefab;
    public GameObject conversantPrefab;
    public Dictionary<string, List<TextMeshProUGUI>> characterChoices = new Dictionary<string, List<TextMeshProUGUI>>();

    public List<TextMeshProUGUI> choices{
        get{
            return characterChoices[Services.InkManager.currentConversant];
        }
    }
    // Start is called before the first frame update
    public void WriteText(string text, string characterName, bool isRosa){
        if(text == ""){
            return;
        }
        Character character = Services.CharacterManager.characters[characterName];
        Transform parent = character.transform;
        GameObject textObj;
        if(isRosa){
            textObj = GameObject.Instantiate(rosaPrefab,parent);
        }else{
            textObj = GameObject.Instantiate(conversantPrefab,parent);
            Services.CharacterManager.characters[Services.InkManager.currentConversant].textingInProgressIcon.transform.SetAsLastSibling();
        }
        textObj.transform.localPosition = new Vector2(0,character.height);
        
        TextMeshProUGUI textDisplay = textObj.transform.GetChild(0).GetChild(1).GetComponent<TextMeshProUGUI>();
        textDisplay.text = text;
        character.texts.Add(text);
        character.height -= 0;

        textDisplay.DOFade(1f, 1f);
        textObj.GetComponentInChildren<Image>().DOFade(1f, 1f);
        textObj.transform.DOShakeScale(.5f, .03f, 10, 0f, true);

    }

    public void WriteDate(string characterName)
    {
        Character character = Services.CharacterManager.characters[characterName];
        Transform parent = character.transform;
        GameObject textObj = GameObject.Instantiate(Services.GameController.datePrefab, parent);
        textObj.GetComponent<TextMeshProUGUI>().text = Services.DateManager.DateList[Services.DateManager.dateListIndex];

        Services.DateManager.TimePassing();

    }
}
