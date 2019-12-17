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
    public Image blackoutBox;
    
    public string currentCharacterName;

    public string currentCharacterConversation;
    
    public Image lockScreen;
    public TextMeshProUGUI lockScreenDateText;
    public float fadeDuration = 1;

    private bool _fadeComplete;

    public string[] characterTexterOrder;
    public int characterTexterOrderIndex = 0;

    // Start is called before the first frame update

    private void OnDisable()
    {
        Debug.Log("DisNABLED");
    }
    void Awake()
    {
        instance = this;

        Debug.Log("AWAKE RUNNING");
        //make the blackoutBox inactive so that it doesn't block clicking
        blackoutBox.gameObject.SetActive(false);
        
        //the scene must be loaded in Awake so that TextingManager can find it in Start
        SetNewEpisode(characterTexterOrder[characterTexterOrderIndex]);
        Debug.Log("The new episode is " + characterTexterOrder + characterTexterOrderIndex);

    }
    
    // Update is called once per frame
    void Update()
    {
        
    }
    public void LoadNewScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName, LoadSceneMode.Additive);
        Debug.Log("sceneName is " + sceneName);
        Debug.Log("LoadNewScene is getting called");
    }
    public void SetTextingScreen()
    {
        Debug.Log("SetTextingScreen is getting called");
        textingScreen.SetActive(true);
        blackoutBox.gameObject.SetActive(true);
        
        //this fades away the lock screen and the lock screen date text
        blackoutBox.DOFade(0, .5f);
        lockScreen.DOFade(0, fadeDuration).SetDelay(.5f);
        lockScreenDateText.DOFade(0, fadeDuration).SetDelay(.5f);
        lockScreenDateText.gameObject.SetActive(false);
        lockScreen.gameObject.SetActive(false);
        blackoutBox.gameObject.SetActive(false);
    }

    public void SetNewEpisode(string character)
    {
        
        Debug.Log("SetNewEpisode is getting called");
        currentCharacterName = character;
        currentCharacterConversation = character + "Conversations";
        StartCoroutine(TextingManager.instance.KnotSelection());

        LoadNewScene(currentCharacterConversation);
    }
    public void SetBlackoutScreen()
    {
        Debug.Log("SetBlackoutScreen is getting called");
        blackoutBox.gameObject.SetActive(true);
        lockScreen.gameObject.SetActive(true);

        lockScreen.DOFade(1, fadeDuration).OnComplete(() => blackoutBox.DOFade(1, 1f).OnComplete(()=> TextingManager.instance.CurrentStoryState = StoryState.EpisodeStart));
        SceneManager.UnloadSceneAsync(currentCharacterConversation);
        characterTexterOrderIndex++;
        TextingManager.instance.CurrentStoryState = StoryState.ChooseNewConversant;
        Debug.Log("The current storystate is " + TextingManager.instance.CurrentStoryState);
    }
}


