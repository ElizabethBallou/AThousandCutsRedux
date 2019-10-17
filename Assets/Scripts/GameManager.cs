using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class GameManager : MonoBehaviour
{
    public GameObject textingScreen;
    public GameObject messagesScreen;

    public PhoneState phoneUseState;

    public TextingManager textingManager;
    // Start is called before the first frame update
    void Start()
    {
        
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
}

public enum PhoneState
{
    TextingState,
    MessageScreenState
};
