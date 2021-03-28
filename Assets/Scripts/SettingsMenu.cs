using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
using UnityEngine.UI;

public class SettingsMenu : MonoBehaviour
{
    public static SettingsMenu instance;
    public GameObject settingsMenu;
    public GameObject soundMenu;
    public GameObject restartMenu;
    public GameObject quitMenu;
    public GameObject textSpeedMenu;
    public GameObject blackBackdrop;

    //objects that control the speed indicator button text and circle
    public GameObject speedIndicator;
    [HideInInspector]
    public float textSpeed;
    public RectTransform[] speedIndicatorPositions;
    public TextMeshProUGUI[] speedTextObjects;
    private RectTransform currentSpeedIndicatorPosition;

    //objects that control the sound effect button text and circle
    public GameObject soundEffectIndicator;
    public RectTransform[] soundEffectIndicatorPositions;
    public TextMeshProUGUI[] soundEffectIndicatorTextObjects;
    private RectTransform currentSoundEffectIndicatorPosition;

    public enum MenuState
    {
        noMenu,
        generalSettings,
        soundMenu,
        restartMenu,
        quitMenu,
        textSpeedMenu
    }

    public MenuState currentMenuState;

    public enum textSpeedState
    {
        slow,
        normal,
        fast
    }

    public textSpeedState currentTextSpeedState;

    // Start is called before the first frame update
    void Start()
    {
        instance = this;
        currentMenuState = MenuState.noMenu;
        currentTextSpeedState = textSpeedState.normal;
        currentSpeedIndicatorPosition = speedIndicator.GetComponent<RectTransform>();
        currentSoundEffectIndicatorPosition = soundEffectIndicator.GetComponent<RectTransform>();

        //sound effects are on by default
        soundEffectIndicatorTextObjects[0].fontStyle = FontStyles.Bold;
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
                textSpeedMenu.gameObject.SetActive(false);
                break;
            case MenuState.generalSettings:
                blackBackdrop.gameObject.SetActive(true);
                settingsMenu.gameObject.SetActive(true);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(false);
                textSpeedMenu.gameObject.SetActive(false);
                break;
            case MenuState.soundMenu:
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(true);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(false);
                textSpeedMenu.gameObject.SetActive(false);
                break;
            case MenuState.restartMenu:
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(true);
                quitMenu.gameObject.SetActive(false);
                textSpeedMenu.gameObject.SetActive(false);
                break;
            case MenuState.quitMenu:
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(false);
                textSpeedMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(true);
                break;
            case MenuState.textSpeedMenu:
                settingsMenu.gameObject.SetActive(false);
                soundMenu.gameObject.SetActive(false);
                restartMenu.gameObject.SetActive(false);
                quitMenu.gameObject.SetActive(false);
                textSpeedMenu.gameObject.SetActive(true);
                break;

        }

        switch (currentTextSpeedState)
        {
            case textSpeedState.slow:
                textSpeed = 2f;
                currentSpeedIndicatorPosition.localPosition = speedIndicatorPositions[0].localPosition;
                speedTextObjects[0].fontStyle = FontStyles.Bold;
                speedTextObjects[1].fontStyle = FontStyles.Normal;
                speedTextObjects[2].fontStyle = FontStyles.Normal;
                if (currentMenuState == MenuState.textSpeedMenu)
                {
                    speedTextObjects[0].gameObject.GetComponentInParent<Button>().interactable = false;
                    speedTextObjects[1].gameObject.GetComponentInParent<Button>().interactable = true;
                    speedTextObjects[2].gameObject.GetComponentInParent<Button>().interactable = true;
                }
                break;
            case textSpeedState.normal:
                textSpeed = 1f;
                currentSpeedIndicatorPosition.localPosition = speedIndicatorPositions[1].localPosition;
                speedTextObjects[0].fontStyle = FontStyles.Normal;
                speedTextObjects[1].fontStyle = FontStyles.Bold;
                speedTextObjects[2].fontStyle = FontStyles.Normal;
                if (currentMenuState == MenuState.textSpeedMenu)
                {
                    speedTextObjects[0].gameObject.GetComponentInParent<Button>().interactable = true;
                    speedTextObjects[1].gameObject.GetComponentInParent<Button>().interactable = false;
                    speedTextObjects[2].gameObject.GetComponentInParent<Button>().interactable = true;
                }
                break;
            case textSpeedState.fast:
                textSpeed = .1f;
                currentSpeedIndicatorPosition.localPosition = speedIndicatorPositions[2].localPosition;
                speedTextObjects[0].fontStyle = FontStyles.Normal;
                speedTextObjects[1].fontStyle = FontStyles.Normal;
                speedTextObjects[2].fontStyle = FontStyles.Bold;
                if (currentMenuState == MenuState.textSpeedMenu)
                {
                    speedTextObjects[0].gameObject.GetComponentInParent<Button>().interactable = true;
                    speedTextObjects[1].gameObject.GetComponentInParent<Button>().interactable = true;
                    speedTextObjects[2].gameObject.GetComponentInParent<Button>().interactable = false;
                }               
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

    public void TextSpeedMenuClick()
    {
        currentMenuState = MenuState.textSpeedMenu;
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

    public void PressSlowSpeed()
    {
        currentTextSpeedState = textSpeedState.slow;
        callClickSound();
    }

    public void PressNormalSpeed()
    {
        currentTextSpeedState = textSpeedState.normal;
        callClickSound();
    }

    public void PressFastSpeed()
    {
        currentTextSpeedState = textSpeedState.fast;
        callClickSound();
    }

    public void callClickSound()
    {
        AudioManager.instance.playTextingSound(AudioManager.instance.clickSound, .4f);
    }

    public void PressSoundEffectsOff()
    {
        soundEffectIndicatorTextObjects[0].fontStyle = FontStyles.Normal;
        soundEffectIndicatorTextObjects[1].fontStyle = FontStyles.Bold;
        currentSoundEffectIndicatorPosition.localPosition = soundEffectIndicatorPositions[1].localPosition;
        AudioManager.instance.soundEffectsShouldPlay = false;
    }

    public void PressSoundEffectsOn()
    {
        soundEffectIndicatorTextObjects[0].fontStyle = FontStyles.Bold;
        soundEffectIndicatorTextObjects[1].fontStyle = FontStyles.Normal;
        currentSoundEffectIndicatorPosition.localPosition = soundEffectIndicatorPositions[0].localPosition;
        AudioManager.instance.soundEffectsShouldPlay = true;
    }

}
