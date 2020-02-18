using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour
{
    public GameObject conversantPrefab;
    public GameObject rosaPrefab;
    public Transform choicesParent;
    public TextAsset inkJsonAsset;
    public GameObject mainPageParent;
    public bool isTexting;
    public bool textWaiting;
    // Start is called before the first frame update
    void Awake()
    {
        InitializeServices();
    }

    // Update is called once per frame
    void Update()
    {
        if(isTexting){
            textWaiting = false;
            Services.InkManager.Update();
        }else{
            if(textWaiting == false){
                Services.InkManager.Update();
                string talkingTo = Services.InkManager.currentConversant;
                Services.CharacterManager.characters[talkingTo].textNotification.text = talkingTo+"(1)";
                textWaiting = true;
            }
        }
        if(Input.GetKeyDown(KeyCode.Backspace)){
            foreach(string character in Services.CharacterManager.characters.Keys){
                Services.CharacterManager.characters[character].transform.gameObject.SetActive(false);
            }
        }
    }

    public void InitializeServices(){
        Services.GameController = this;

        Services.CharacterManager = new NewCharacterManager();
        Services.CharacterManager.Initialize(mainPageParent.transform);

        Services.InkManager = new InkManager(inkJsonAsset);

        Services.DisplayManager = new DisplayManager(conversantPrefab,rosaPrefab,choicesParent);
    }
     public void SelectChoice(int choice){
        Debug.Log(choice);
        Services.InkManager.SelectChoice(choice);
    }
    public void SelectCharacter(string character){
        Debug.Log(character);
        Services.CharacterManager.characters[character].transform.gameObject.SetActive(true);
        Services.CharacterManager.characters[character].textNotification.text = character;
        isTexting = true;
    }
}
