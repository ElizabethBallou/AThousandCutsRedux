﻿using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SettingsMenu : MonoBehaviour
{
    public static SettingsMenu instance;
    public GameObject settingsMenu;
    public GameObject soundMenu;
    public GameObject restartMenu;
    public GameObject quitMenu;
    public GameObject blackBackdrop;

    public enum MenuState
    {
        noMenu,
        generalSettings,
        soundMenu,
        restartMenu,
        quitMenu
    }

    public MenuState currentMenuState;
    // Start is called before the first frame update
    void Start()
    {
        instance = this;
        currentMenuState = MenuState.noMenu;
    }

    // Update is called once per frame
    void Update()
    {
        switch (currentMenuState)
        {
            case MenuState.noMenu:
                blackBackdrop.gameObject.SetActive(false);
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(false);
                break;
            case MenuState.generalSettings:
                blackBackdrop.gameObject.SetActive(true);
                settingsMenu.gameObject.SetActive(true);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(false);
                break;
            case MenuState.soundMenu:
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(true);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(false);
                break;
            case MenuState.restartMenu:
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(true);
                quitMenu.gameObject.SetActive(false);
                break;
            case MenuState.quitMenu:
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(true);
                break;

        }
    }

    public void SettingsButtonClick()
    {
        currentMenuState = MenuState.generalSettings;
        callClickSound();
    }

    public void SoundMenuClick()
    {
        currentMenuState = MenuState.soundMenu;
        callClickSound();
    }

    public void RestartMenuClick()
    {
        currentMenuState = MenuState.restartMenu;
        callClickSound();
    }

    public void QuitMenuClick()
    {
        currentMenuState = MenuState.quitMenu;
        callClickSound();
    }

    public void YesQuit()
    {
        callClickSound();
        currentMenuState = MenuState.noMenu;
        Application.Quit();
    }

    public void NoQuit()
    {
        currentMenuState = MenuState.generalSettings;
        callClickSound();
    }

    public void YesReset()
    {
        callClickSound();
        Services.InkManager.ClearStory();
        currentMenuState = MenuState.noMenu;
        SceneManager.LoadScene("MainScene");
    }

    public void BackButton()
    {
        currentMenuState = MenuState.generalSettings;
        callClickSound();
    }

    public void ReturnToGameButtonClick()
    {
        currentMenuState = MenuState.noMenu;
        callClickSound();
    }

    public void callClickSound()
    {
        AudioManager.instance.playTextingSound(AudioManager.instance.clickSound, .4f);
    }

}
