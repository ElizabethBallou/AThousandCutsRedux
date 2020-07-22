using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using DG.Tweening;
using UnityEngine.UI;


public class LockScreenController : MonoBehaviour
{
    public Image blackBackdrop;
    private Image unlockScreenGraphic;
    private TextMeshProUGUI dateText;
    private TextMeshProUGUI notificationText;
    private Button unlockButton;
    private Button quitButton;
    public float fadeTime = .5f;
    public float secondaryFadeTime = .2f;
    public float longFade = 3f;
    private bool unlockButtonPressed = false;
    public bool SwitchingEpisodes = false;
    private bool isFadingIn = false;
    private bool isFadingOut = false;
    private float fadeTimer = 0;
    private float switchTimer = 0;
    private Color clearWhite = new Color(255, 255, 255, 0);


    void Start()
    {
        blackBackdrop.gameObject.SetActive(false);
        blackBackdrop.color = Color.clear;
        unlockScreenGraphic = gameObject.transform.GetChild(0).GetComponent<Image>();
        dateText = gameObject.transform.GetChild(1).GetComponent<TextMeshProUGUI>();
        notificationText = gameObject.transform.GetChild(2).GetComponent<TextMeshProUGUI>();
        quitButton = gameObject.transform.GetChild(3).GetComponent<Button>();
        unlockButton = gameObject.transform.GetChild(4).GetComponent<Button>();
        isFadingOut = true;

        //set date text to proper date
        dateText.text = Services.DateManager.DateList[Services.DateManager.dateListIndex];

        //hide quit button
        quitButton.image.color = clearWhite;
        quitButton.gameObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (!unlockButtonPressed && !SwitchingEpisodes)
        {
            if (isFadingOut)
            {
                fadeTimer += Time.deltaTime;
                unlockButton.image.DOFade(.5f, fadeTime);
                if (fadeTimer >= fadeTime)
                {
                    isFadingOut = false;
                    isFadingIn = true;
                    fadeTimer = 0f;
                }
            }
            else if (isFadingIn)
            {
                fadeTimer += Time.deltaTime;
                unlockButton.image.DOFade(1f, fadeTime);
                //Debug.Log("Fading in...");
                if (fadeTimer >= fadeTime)
                {
                    isFadingOut = true;
                    isFadingIn = false;
                    fadeTimer = 0f;
                }
            }
        }

        if (SwitchingEpisodes)
        {
            switchTimer += Time.deltaTime;
            if (switchTimer >= longFade + fadeTime)
            {
                Services.InkManager.FakeChoice();

                Services.GameController.BackToMessageScreen();
                switchTimer = 0;
                isFadingIn = true;
                SwitchingEpisodes = false;

                blackBackdrop.color = Color.clear;
            }
        }
    }

    public void OnUnlockButtonPress()
    {
        AudioManager.instance.playTextingSound(AudioManager.instance.unlockSound);
        unlockButtonPressed = true;
        unlockButton.image.DOFade(0f, secondaryFadeTime);
        dateText.DOFade(0f, secondaryFadeTime).OnComplete(() => dateText.gameObject.SetActive(false));
        notificationText.DOFade(0f, secondaryFadeTime).OnComplete(() => notificationText.gameObject.SetActive(false));
        unlockScreenGraphic.DOFade(0f, secondaryFadeTime).OnComplete(() => unlockScreenGraphic.gameObject.SetActive(false));
        ResetUnlockButton();
    }

    public void ResetUnlockButton()
    {
        unlockButton.image.color = clearWhite;
        unlockButton.gameObject.SetActive(false);
    }

    public void OnQuitButtonPress()
    {
        Application.Quit();
    }
    public void OnLockScreenLock(){
        Debug.Log("unlockButtonPressed is " + unlockButtonPressed);
        if (unlockButtonPressed)
        {
            Services.GameController.characterWithOpenMessages = "";
            unlockButtonPressed = false;
            Debug.Log("Calling OnLockScreenLock");
            SwitchingEpisodes = true;
            unlockButton.image.color = clearWhite;

            //set the proper UI objects active so they can get FADED
            blackBackdrop.gameObject.SetActive(true);
            dateText.gameObject.SetActive(true);
            notificationText.gameObject.SetActive(true);
            unlockScreenGraphic.gameObject.SetActive(true);
            unlockButton.gameObject.SetActive(true);


            //switch the date text so it's accurate
            Debug.Log("dateArrayIndex is " + Services.DateManager.dateListIndex);
            dateText.text = Services.DateManager.DateList[Services.DateManager.dateListIndex - 1];

            //begin by fading in the backdrop
            blackBackdrop.DOFade(1f, longFade);

            //now fade in the lock screen components
           
             dateText.DOFade(1f, fadeTime).SetDelay(longFade);
             unlockScreenGraphic.DOFade(1f, fadeTime).SetDelay(longFade);
             unlockButton.image.DOFade(1f, fadeTime).SetDelay(longFade);
             notificationText.DOFade(1f, fadeTime).SetDelay(longFade)
                .OnComplete(() => blackBackdrop.gameObject.SetActive(false));
            }

            /*if(dateListIndex == currentDateList.Count)
            {
            //switch the date list
                currentDateList.Clear();
                currentDateList = TitleIXDateList;
                dateListIndex = 0;
            }*/

            /*if (dateListIndex == 5)
            {
                quitButton.gameObject.SetActive(true);
                unlockButton.gameObject.SetActive(false);
                notificationText.gameObject.SetActive(false);
                quitButton.gameObject.transform.SetAsLastSibling();
                dateText.DOFade(1f, fadeTime).SetDelay(longFade);
                unlockScreenGraphic.DOFade(1f, fadeTime).SetDelay(longFade);
                quitButton.image.DOFade(1f, fadeTime).SetDelay(longFade);
            }*/

    }
        

}

