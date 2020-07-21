using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SettingsMenu : MonoBehaviour
{
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
                settingsMenu.gameObject.SetActive(true);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(true);
                break;

        }
    }

    public void SettingsButtonClick()
    {
        currentMenuState = MenuState.generalSettings;
    }

    public void SoundMenuClick()
    {
        currentMenuState = MenuState.soundMenu;
    }

    public void RestartMenuClick()
    {
        currentMenuState = MenuState.restartMenu;
    }

    public void QuitMenuClick()
    {
        currentMenuState = MenuState.quitMenu;
    }

    public void YesQuit()
    {
        currentMenuState = MenuState.noMenu;
        Application.Quit();
    }

    public void NoQuit()
    {
        currentMenuState = MenuState.generalSettings;
    }

    public void YesReset()
    {
        Services.InkManager.ClearStory();
        currentMenuState = MenuState.noMenu;
        SceneManager.LoadScene("MainScene");
    }

    public void BackButton()
    {
        currentMenuState = MenuState.generalSettings;
    }

    public void ReturnToGameButtonClick()
    {
        currentMenuState = MenuState.noMenu;
    }
}
