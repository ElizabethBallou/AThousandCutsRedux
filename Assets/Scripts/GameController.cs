using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class GameController : MonoBehaviour
{
    public GameObject conversantPrefab;
    public GameObject rosaPrefab;
    public Transform choicesParent;
    public TextAsset inkJsonAsset;
    public List<TextMeshProUGUI> characterNotificationDisplays;
    public TextMeshProUGUI texterName;
    public RectTransform textingScreen;
    public LockButtonController lockScreen;
    public GameObject oliviaBlur;
    public Button oliviaButton;
    public GameObject mikaelaButton;
    public bool isTexting;
    public bool textWaiting;
    public float textingSpeed;
    public string characterWithOpenMessages;
    public GameObject[] textingInProgressIcons;

    // Start is called before the first frame update
    void Awake()
    {

        InitializeServices();
        
        Services.CharacterManager.characters["Olivia"].textingInProgressIcon = textingInProgressIcons[0];
        Services.CharacterManager.characters["Mikaela"].textingInProgressIcon = textingInProgressIcons[1];
        Services.CharacterManager.characters["Duane"].textingInProgressIcon = textingInProgressIcons[2];
        Services.CharacterManager.characters["Rudy"].textingInProgressIcon = textingInProgressIcons[3];
        Services.CharacterManager.characters["Jia"].textingInProgressIcon = textingInProgressIcons[4];
        
        foreach (GameObject textingIcon in textingInProgressIcons)
        {
            textingIcon.SetActive(false);
        }
    }

    // Update is called once per frame
    void Update()
    {
        if(isTexting){
            textingScreen.localPosition += (Vector3.zero - textingScreen.localPosition)*0.1f;
            textWaiting = false;
            if(characterWithOpenMessages == Services.InkManager.currentConversant){
                Services.InkManager.Update();
                texterName.text = Services.InkManager.currentConversant;
            }
            
        }else if (lockScreen.SwitchingEpisodes == false)
        {
            textingScreen.localPosition += ((Vector3.right*1100f) - textingScreen.localPosition) * 0.1f;
            if(textWaiting == false){
                Services.InkManager.Update();
                string talkingTo = Services.InkManager.currentConversant;
                if(talkingTo == "Olivia"){
                    oliviaBlur.SetActive(false);
                    oliviaButton.interactable = true;
                    oliviaButton.gameObject.transform.SetSiblingIndex(0);
                    mikaelaButton.gameObject.transform.SetSiblingIndex(2);
                }
                if (talkingTo == "Mikaela")
                {
                    mikaelaButton.gameObject.transform.SetSiblingIndex(0);
                    oliviaButton.gameObject.transform.SetSiblingIndex(2);
                }
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

        Services.CharacterManager = new CharacterManager();
        Services.CharacterManager.Initialize(characterNotificationDisplays,choicesParent);

        Services.InkManager = new InkManager(inkJsonAsset);

        Services.DisplayManager = new DisplayManager(conversantPrefab,rosaPrefab,choicesParent);
    }
     public void SelectChoice(int choice){
        Services.InkManager.SelectChoice(choice);
    }
    public void SelectCharacter(string character){
        Debug.Log(character);
        Services.CharacterManager.characters[character].transform.gameObject.SetActive(true);
        Services.CharacterManager.characters[character].choices.gameObject.SetActive(true);
        Services.CharacterManager.characters[character].textNotification.text = character;
        isTexting = true;
        characterWithOpenMessages = character;
    }
    public void BackToMessageScreen(){
        isTexting = false;
        characterWithOpenMessages = "";
        foreach(string character in Services.CharacterManager.characters.Keys){
                Services.CharacterManager.characters[character].transform.gameObject.SetActive(false);
                Services.CharacterManager.characters[character].choices.gameObject.SetActive(false);
            }

    }
}
