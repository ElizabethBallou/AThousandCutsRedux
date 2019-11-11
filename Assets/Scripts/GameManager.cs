using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using DG.Tweening;


public class GameManager : MonoBehaviour
{
    public static GameManager instance;
    
    public GameObject textingScreen;
    public GameObject messagesScreen;
    public Image blackoutBox;


    public PhoneState phoneUseState;

    public TextingManager textingManager;
    // Start is called before the first frame update
    void Awake()
    {
        instance = this;
        
        //make the blackoutBox inactive so that it doesn't block clicking
        blackoutBox.gameObject.SetActive(false);
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
                SetBlackoutScreen();
                break;
        }
    }

    public void SetTextingScreen()
    {
        messagesScreen.SetActive(false);
        textingScreen.SetActive(true);
    }

    public void SetMessageScreen()
    {
        textingScreen.SetActive(false);
        messagesScreen.SetActive(true);
    }

    public void SetBlackoutScreen()
    {
        blackoutBox.gameObject.SetActive(true);
        TextingManager.instance.lockScreen.DOFade(255, 2f).OnComplete(()=> blackoutBox.DOFade(255, 1f));
    }
}

public enum PhoneState
{
    TextingState,
    MessageScreenState,
    BlackoutState
};
