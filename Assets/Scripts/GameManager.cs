using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using DG.Tweening;
using UnityEngine.SceneManagement;


public class GameManager : MonoBehaviour
{
    public static GameManager instance;
    
    public GameObject textingScreen;
    public GameObject messagesScreen;
    public Image blackoutBox;

    public PhoneState phoneUseState;
    
    public string currentCharacterName;

    public string currentCharacterConversation;
    
    public Image lockScreen;
    public TextMeshProUGUI lockScreenDateText;
    public float fadeDuration = 1;

    private bool _fadeComplete = false;
    
    // Start is called before the first frame update
    void Awake()
    {
        instance = this;
        
        //make the blackoutBox inactive so that it doesn't block clicking
        blackoutBox.gameObject.SetActive(false);
        
        //the scene must be loaded in Awake so that TextingManager can find it in Start
        currentCharacterName = "Mikaela";
        currentCharacterConversation = currentCharacterName + "Conversations";
        SceneOrderManager.instance.LoadNewScene(currentCharacterConversation);
    }
    
    // Update is called once per frame
    void Update()
    {
        switch (phoneUseState)
        {
            case PhoneState.TextingState:
                SetTextingScreen();
                break;
            case PhoneState.MessageScreenState:
                SetMessageScreen();
                break;
            case PhoneState.BlackoutState:
                if (!_fadeComplete)
                {
                    _fadeComplete = true;
                    SetBlackoutScreen();
                }

                break;
        }
    }

    public void SetTextingScreen()
    {
        messagesScreen.SetActive(false);
        textingScreen.SetActive(true);
        
        //this fades away the lock screen and the lock screen date text
        lockScreen.DOFade(0, fadeDuration).OnComplete(()=>lockScreen.gameObject.SetActive(false));
        lockScreenDateText.DOFade(0, fadeDuration).OnComplete(() => lockScreenDateText.gameObject.SetActive(false));
    }

    public void SetMessageScreen()
    {
        textingScreen.SetActive(false);
        messagesScreen.SetActive(true);
    }

    public void SetBlackoutScreen()
    {
        blackoutBox.gameObject.SetActive(true);
        lockScreen.gameObject.SetActive(true);
        lockScreen.DOFade(255, 2f).OnComplete(() => blackoutBox.DOFade(255, 1f));
        SceneManager.UnloadSceneAsync(currentCharacterConversation);
    }
}

public enum PhoneState
{
    TextingState,
    MessageScreenState,
    BlackoutState,
    BetweenConversations
};
