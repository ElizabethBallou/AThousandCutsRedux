using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class GameController : MonoBehaviour
{
    public GameObject conversantPrefab;
    public GameObject rosaPrefab;
    public Transform choicesParent;
    public TextAsset inkJsonAsset;
    public List<TextMeshProUGUI> characterNotificationDisplays;
    public RectTransform textingScreen;
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
            textingScreen.localPosition += (Vector3.zero - textingScreen.localPosition)*0.1f;
            textWaiting = false;
            Services.InkManager.Update();
        }else{
            textingScreen.localPosition += ((Vector3.right*1100f) - textingScreen.localPosition) * 0.1f;
            if(textWaiting == false){
                Services.InkManager.Update();
                string talkingTo = Services.InkManager.currentConversant;
                Services.CharacterManager.characters[talkingTo].textNotification.text = talkingTo+"(1)";
                Services.CharacterManager.characters[talkingTo].textPreview.text = Services.InkManager.latestText;
                textWaiting = true;
            }
        }
        if(Input.GetKeyDown(KeyCode.Backspace)){
            BackToMessageScreen();
        }
    }

    public void InitializeServices(){
        Services.GameController = this;

        Services.CharacterManager = new NewCharacterManager();
        Services.CharacterManager.Initialize(characterNotificationDisplays);

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
    public void BackToMessageScreen(){
        isTexting = false;
        foreach(string character in Services.CharacterManager.characters.Keys){
                Services.CharacterManager.characters[character].transform.gameObject.SetActive(false);
            }

    }
}
