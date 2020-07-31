using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using DG.Tweening;
using UnityEngine.UI;


public class LockScreenController : MonoBehaviour
{
    public static LockScreenController instance;
    public Image blackBackdrop;
    private Image unlockScreenGraphic;
    private TextMeshProUGUI dateText;
    public TextMeshProUGUI notificationText;
    public TextMeshProUGUI endgameText;
    public TextMeshProUGUI outcomeText;
    public Button unlockButton;
    public Button quitButton;
    public Button outcomeButton;
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

    private float endEpisodeTimer = 0;
    private bool startEndtimer = false;

    public TextAsset victimScoreTextFile;
    private string[] victimScoreArray;
    private int victimScoreCountFromInk = 5;
    private string victimScoreString = "";
    private List<string> outcomeList = new List<string>();
    private int outcomeListIndex = 0;
    
    private void Awake()
    {
        instance = this;
    }
    void Start()
    {
        AudioManager.instance.playNextSong();

        blackBackdrop.gameObject.SetActive(false);
        blackBackdrop.color = Color.clear;
        unlockScreenGraphic = gameObject.transform.GetChild(0).GetComponent<Image>();
        dateText = gameObject.transform.GetChild(1).GetComponent<TextMeshProUGUI>();
        notificationText = gameObject.transform.GetChild(2).GetComponent<TextMeshProUGUI>();
        isFadingOut = true;

        //set date text to proper date
        dateText.text = Services.DateManager.DateList[Services.DateManager.dateListIndex];
        Debug.Log("We begin. dateListIndex is " + Services.DateManager.dateListIndex);

        //hide quit button
        quitButton.image.color = clearWhite;
        quitButton.gameObject.SetActive(false);

        outcomeButton.gameObject.SetActive(false);
        outcomeText.gameObject.SetActive(false);

        endgameText.color = clearWhite;
        endgameText.gameObject.SetActive(false);

        notificationText.color = clearWhite;

        victimScoreArray = victimScoreTextFile.text.Split('\n');
        Debug.Log(victimScoreArray[0]);

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

        if (startEndtimer)
        {
            endEpisodeTimer += Time.deltaTime;
            if (endEpisodeTimer > 2f)
            {
                startEndtimer = false;
                endEpisodeTimer = 0;
                onEndtimerEnd();
            }
        }
    }

    public void OnUnlockButtonPress()
    {
        AudioManager.instance.menuTriggered = false;
        AudioManager.instance.playTextingSound(AudioManager.instance.unlockSound, 1f);
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
    public void OnLockScreenLock() {
        AudioManager.instance.FastForwardButtonClick();
        if (unlockButtonPressed)
        {
            startEndtimer = true;
        }
    }

            

    public void onEndtimerEnd()
    {

        if (Services.DateManager.DateList[Services.DateManager.dateListIndex].Trim() == "April 23" || Services.DateManager.DateList[Services.DateManager.dateListIndex].Trim() == "April 24")
        {
            //go into End Mode
            unlockButton.gameObject.SetActive(false);
            blackBackdrop.gameObject.SetActive(true);
            blackBackdrop.DOFade(1f, longFade).OnComplete(() => blackBackdrop.DOFade(0f, longFade)).OnComplete(() => blackBackdrop.gameObject.SetActive(false));

            quitButton.gameObject.SetActive(true);
            quitButton.gameObject.transform.SetAsLastSibling();
            quitButton.image.DOFade(.6f, fadeTime).SetDelay(longFade);

            unlockScreenGraphic.gameObject.SetActive(true);
            unlockScreenGraphic.DOFade(1f, fadeTime).SetDelay(1f);

            endgameText.gameObject.SetActive(true);
            endgameText.DOFade(1f, fadeTime).SetDelay(longFade);
        }
        if (Services.DateManager.DateList[Services.DateManager.dateListIndex].Trim() == "February 3")
        {
            SetWitnessOwnCaseStatus();
            PickVictimScoreText();
            blackBackdrop.gameObject.SetActive(true);
            blackBackdrop.DOFade(1f, longFade).SetDelay(longFade);
            outcomeButton.gameObject.SetActive(true);
            outcomeText.gameObject.SetActive(true);
            outcomeText.text = outcomeList[0];
            outcomeButton.image.DOFade(.6f, longFade + 2f).SetDelay(longFade);
            outcomeText.DOFade(1f, longFade + 1f).SetDelay(longFade);
        }
        else
        {
            //continue the transition
            Services.GameController.characterWithOpenMessages = "";
            unlockButtonPressed = false;
            SwitchingEpisodes = true;
            unlockButton.image.color = clearWhite;

            //set the proper UI objects active so they can get FADED
            blackBackdrop.gameObject.SetActive(true);
            dateText.gameObject.SetActive(true);
            notificationText.gameObject.SetActive(true);
            unlockScreenGraphic.gameObject.SetActive(true);
            unlockButton.gameObject.SetActive(true);

            //switch the date text so it's accurate
            dateText.text = Services.DateManager.DateList[Services.DateManager.dateListIndex];
            Debug.Log("I'm inside OnEndTimerEnd. The lock screen text has just been changed to " + Services.DateManager.dateListIndex);

            //begin by fading in the backdrop
            blackBackdrop.DOFade(1f, longFade);

            //now fade in the lock screen components

            dateText.DOFade(1f, fadeTime).SetDelay(longFade);
            unlockScreenGraphic.DOFade(1f, fadeTime).SetDelay(longFade);
            unlockButton.image.DOFade(1f, fadeTime).SetDelay(longFade);
            notificationText.DOFade(1f, fadeTime).SetDelay(longFade + 1f)
               .OnComplete(() => blackBackdrop.gameObject.SetActive(false));
            Invoke("PlayBuzzingSound", 3.5f);
        }  

    }








    public void PlayBuzzingSound()
    {
        AudioManager.instance.playBuzzingsound(.5f);
    }
        
    public void PickVictimScoreText()
    {
        victimScoreCountFromInk = (int) Services.InkManager.story.variablesState["perfect_victim_score"];
        victimScoreString = victimScoreArray[victimScoreCountFromInk];
        outcomeList.Add(victimScoreString);
    }

    public void SetWitnessOwnCaseStatus()
    {
        string caseChoice = Services.InkManager.story.variablesState["TitleIX_taking_Rosas_case"] as string;
        Debug.Log("caseChoice is " + caseChoice);
        if (caseChoice == "no")
        {
            outcomeList.Insert(0, "Since the Title IX investigator declined to hear your case, you testified in Olivia's case.");
        }
        if (caseChoice == "yes")
        {
            outcomeList.Insert(0, "You showed up at the Deans' Office at 9:00 A.M. sharp on the day of your hearing.");
        }
    }

    public void onContinueButtonClick()
    {
        outcomeListIndex++;
        outcomeText.DOFade(0f, .5f).OnComplete(() => outcomeText.text = outcomeList[outcomeListIndex]);
        outcomeText.DOFade(1f, .5f).SetDelay(.5f);
    }
}

