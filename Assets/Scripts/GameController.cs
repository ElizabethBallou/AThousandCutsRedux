using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour
{
    public GameObject conversantPrefab;
    public GameObject rosaPrefab;
    public Transform choicesParent;
    public TextAsset inkJsonAsset;
    // Start is called before the first frame update
    void Awake()
    {
        InitializeServices();
    }

    // Update is called once per frame
    void Update()
    {
        Services.InkManager.Update();
    }

    public void InitializeServices(){
        Services.GameController = this;

        Services.CharacterManager = new NewCharacterManager();
        Services.CharacterManager.Initialize();

        Services.InkManager = new InkManager(inkJsonAsset);

        Services.DisplayManager = new DisplayManager(conversantPrefab,rosaPrefab,choicesParent);
    }
     public void SelectChoice(int choice){
        Debug.Log(choice);
        Services.InkManager.SelectChoice(choice);
    }
}
