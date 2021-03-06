﻿using System.Collections;
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
    public Button outcomeContinueButton;
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

    public string outcomeDate;
    public string endDate;
    public TextAsset victimScoreTextFile;
    private string[] victimScoreArray;
    private string victimScoreString = "";
    private List<string> outcomeList = new List<string>();
    private int outcomeListIndex = 0;
    private bool outcomeShown = false;
    
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

        //hide quit button
        quitButton.image.color = clearWhite;
        quitButton.gameObject.SetActive(false);

        outcomeText.color = clearWhite;
        outcomeContinueButton.gameObject.GetComponentInChildren<TextMeshProUGUI>().color = clearWhite;
        outcomeContinueButton.gameObject.SetActive(false);
        outcomeText.gameObject.SetActive(false);

        endgameText.color = clearWhite;
        endgameText.gameObject.SetActive(false);

        notificationText.color = clearWhite;

        victimScoreArray = victimScoreTextFile.text.Split('\n');

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
                ScreenStateDeterminer();
            }
        }
        else
        {
            Services.GameController.haltNameChange = false;
            //Debug.Log("haltNameChange is being set false");
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
        if (Services.DateManager.DateList[Services.DateManager.dateListIndex-1].Trim() != outcomeDate)
        {
            if(!outcomeShown)
            {
                AudioManager.instance.FastForwardButtonClick();
            }
        }
        Services.GameController.haltNameChange = true;
        if (unlockButtonPressed)
        {
            startEndtimer = true;
        }
    }
            

    public void ScreenStateDeterminer()
    {

        if (Services.DateManager.DateList[Services.DateManager.dateListIndex-1].Trim() == endDate)
        {
            EndGameScreenSetup();
        }
        else if (Services.DateManager.DateList[Services.DateManager.dateListIndex-1].Trim() == outcomeDate)
        {
            //give the player the outcome of all of Rosa's choices
            SetOutcomeText();
            OutcomeScreenSetup();
        }
        else if (Services.DateManager.DateList[Services.DateManager.dateListIndex].Trim() == "nothing")
        {
            dateText.gameObject.SetActive(false);
            unlockButton.gameObject.SetActive(false);
            notificationText.gameObject.SetActive(false);
        }
        else
        {
            RefreshScreenForNewEpisode();
        }  

    }

    public void OutcomeScreenSetup()
    {
        AudioManager.instance.PauseForOutcomeSong();
        blackBackdrop.gameObject.SetActive(true);
        blackBackdrop.DOFade(1f, longFade);
        outcomeContinueButton.gameObject.SetActive(true);
        outcomeText.gameObject.SetActive(true);
        outcomeText.text = "\t" + outcomeList[0];
        outcomeContinueButton.image.DOFade(.6f, longFade + 2f).SetDelay(longFade);
        outcomeContinueButton.gameObject.GetComponentInChildren<TextMeshProUGUI>().DOFade(.6f, longFade + 2f).SetDelay(longFade);
        outcomeText.DOFade(1f, longFade + 1f).SetDelay(longFade);
        outcomeShown = true;
    }
    public void EndGameScreenSetup()
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
    public void RefreshScreenForNewEpisode()
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
        //Debug.Log("I'm inside OnEndTimerEnd. The lock screen text has just been changed to " + Services.DateManager.dateListIndex);

        //begin by fading in the backdrop
        blackBackdrop.DOFade(1f, longFade);

        //now fade in the lock screen components

        dateText.DOFade(1f, fadeTime).SetDelay(longFade);
        unlockScreenGraphic.DOFade(1f, fadeTime).SetDelay(longFade).OnComplete(() => blackBackdrop.gameObject.SetActive(false));
        unlockButton.image.DOFade(1f, fadeTime).SetDelay(longFade);
        notificationText.DOFade(1f, fadeTime).SetDelay(longFade);
        Invoke("PlayBuzzingSound", 3.5f);
    }
    public void PlayBuzzingSound()
    {
        AudioManager.instance.playBuzzingsound(.5f);
    }
        

    public void SetOutcomeText()
    {
        //first, check whether Rosa's going forward with her own case or is just serving as a witness
        string caseChoice = Services.InkManager.story.variablesState["TitleIX_taking_Rosas_case"] as string;
        if (caseChoice == "no")
        {
            //if she doesn't have a Title IX case, add the following text to the list of strings to be printed
            outcomeList.Add("Since the Title IX investigator declined to hear your case, you testify in Olivia's case.");
        }
        if (caseChoice == "yes")
        {
            //if she DOES have a Title IX case, add the following text to the list of strings
            outcomeList.Add("You show up at the Deans' Office at 9:00 A.M. sharp on the day of your hearing.");
        }

        //check to see whether Duane and Rosa will be in the same room when Rosa testifies
        string roomChoice = Services.InkManager.story.variablesState["same_room_as_duane"] as string;

        //if Rosa does not have her own case and she doesn't want to be in the same room as Duane...
        if (roomChoice == "no" && caseChoice == "no")
        {
            outcomeList.Add("You wait in the lobby until it's your turn to testify. Then you're ushered into a small room down the hall. The room holds a table, a single chair, and a TV screen displaying the the main conference room.");
            outcomeList.Add("You see a panel of five people; Olivia and Shay; and - Duane. It's the first time you've seen Duane's face since Halloween.");

        }
        //if Rosa DOES have her own case and she doesn't want to be in the same room as Duane...
        if (roomChoice == "no" && caseChoice == "yes")
        {
            outcomeList.Add("A receptionist ushers you and Pradhya into a small room down the hall. The room holds a table, two chairs, and a TV screen displaying the main conference room.");
            outcomeList.Add("You see a panel of five people - and Duane. It's the first time you've seen Duane's face since Halloween.");
        }
        //if Rosa DOES have her own case and she's okay being in the same room as Duane...
        if (roomChoice == "yes" && caseChoice == "yes")
        {
            outcomeList.Add("A receptionist ushers you and Pradhya into the main conference room. There are five people - the panel - who glance at you uncomfortably.");
            outcomeList.Add("A second later, Duane and his advocate enter. It's the first time you've seen Duane's face since Halloween.");
        }
        //if Rosa does not have her own case and she's okay being in the same room as Duane...
        if (roomChoice == "yes" && caseChoice == "no")
        {
            outcomeList.Add("You wait in the lobby until it's your turn to testify. Then you're ushered into the main conference room. On one side of the table are Olivia and Shay. On another, the five panel members.");
            outcomeList.Add("On the third side are Duane and his advocate. It's the first time you've seen Duane's face since Halloween.");
        }

        outcomeList.Add("You stare at the table until you hear someone say, 'Rosa? Why don't you tell us what you remember?'");
        outcomeList.Add("You take a deep breath and begin to speak.");
        if (caseChoice == "yes")
        {
            outcomeList.Add("You don't remember this part very clearly. Pradhya says you did well. That you seemed composed. You didn't feel composed.");
        }
        if (caseChoice == "no")
        {
            outcomeList.Add("You don't remember this part very clearly. Olivia says you did well. That you seemed calm. You didn't feel calm.");
        }

        //check to see how much Rosa resisted Duane
        int resistanceCount = (int)Services.InkManager.story.variablesState["duane_resistance"];
        Debug.Log("resistanceCount is " + resistanceCount);
        //add a different string depending on the resistanceCount
        switch(resistanceCount)
        {
            case 0:
                outcomeList.Add("The panel asks you why, when Duane touched you, you 'stopped moving and waited it out.' Why didn't you say no or push him away, they want to know? You don't know what to tell them.");
                break;
            case 1:
                outcomeList.Add("When you testify that you told Duane 'no,' most of the panel members nod. One person asks why you didn't push him away. You don't know what to tell them.");
                break;
            case 2:
                outcomeList.Add("When you testify that you pushed Duane away, the panel members nod in approval. Duane stares down at the table.");
                break;
        }

        //check to see how much Rosa drank
        int alcoholCount = (int)Services.InkManager.story.variablesState["alcohol_level"];
        outcomeList.Add("Just as Olivia suspected, the panel asks you how much you were drinking.");
        switch (alcoholCount)
        {
            case 0:
                outcomeList.Add("When you say you don't drink, some of the panel members seem to relax. 'Great, great,' says one of them, jotting notes on a pad of paper.");
                break;
            case 1:
                outcomeList.Add("When you say you were drinking a little, one of the panel members asks, 'Are you sure you remember that entire night?' You tell him you do. He doesn't look convinced.");
                break;
            case 2:
                outcomeList.Add("When you say you were drunk, one of the panel members asks, 'Did you black out?' You admit that a few parts of the night are fuzzy.");
                outcomeList.Add("The panelist frowns. 'How sure are you that the man who touched you is this gentleman?' he says. You tell him you are sure - you remember that part so very clearly - but he looks unconvinced.");
                break;
        }

        //now let's see if Yujin and/or Mikaela are testifying
        string mikaelaTestifying = Services.InkManager.story.variablesState["convinced_mikaela"] as string;
        string yujinTestifying = Services.InkManager.story.variablesState["convinced_yujin"] as string;
        if (caseChoice == "yes")
        {
            if (mikaelaTestifying == "yes" && yujinTestifying == "yes")
            {
                outcomeList.Add("Later, Yujin testifies. She cries when she speaks, and yells. Duane can't look at her.");
                outcomeList.Add("Then it's Mikaela's turn. She confirms that yes, you were at Rudy's party, and yes, you told her what Duane did.");
                outcomeList.Add("Third is Rudy. He says he can place you on the back porch with Duane.");
                outcomeList.Add("Finally, Olivia testifies. She tells the panel everything you already know.");
            }
            if (mikaelaTestifying == "no" && yujinTestifying == "yes")
            {
                outcomeList.Add("Later, Yujin testifies. She cries when she speaks, and yells. Duane can't look at her.");
                outcomeList.Add("Then, Rudy speaks. He says he can place you on the back porch with Duane.");
                outcomeList.Add("Finally, Olivia testifies. She tells the panel everything you already know.");

            }
            if (mikaelaTestifying == "yes" && yujinTestifying == "no")
            {
                outcomeList.Add("Later, Mikaela testifies. She confirms that yes, you were at Rudy's party, and yes, you told her what Duane did.");
                outcomeList.Add("Then, Rudy speaks. He says he can place you on the back porch with Duane.");
                outcomeList.Add("Finally, Olivia testifies. She tells the panel everything you already know.");
            }

            outcomeList.Add("After lunch, Duane testifies. He says you wanted to be kissed, that he thought you liked it.");
            outcomeList.Add("He says you don't understand what this investigation has put him through.");
            outcomeList.Add("It is painful, to hear him say that.");
            outcomeList.Add("At last, it's over. You go home and sleep well into the next day.");
            outcomeList.Add("Olivia's hearing has already started, and at noon you go back to the Deans' Office. It's a different panel this time. You repeat everything you said yesterday.");
            outcomeList.Add("Then you leave. Olivia's hearing continues, but you don't know what to do, so you sit on a bench outside the Deans' Office.");
            outcomeList.Add("Hours pass.");
            outcomeList.Add("Then, after the sun has set, you get a text from Olivia with the combined verdict.");
        }
        if (caseChoice == "no")
        {
            outcomeList.Add("Then you leave. Olivia's hearing continues, but you don't know what to do, so you sit on a bench outside the Deans' Office.");
            outcomeList.Add("Hours pass.");
            outcomeList.Add("Then, after the sun has set, you get a text from Olivia with the verdict.");
        }

        //check the perfect victim score and cast it to an int
        int victimScoreCountFromInk = (int)Services.InkManager.story.variablesState["perfect_victim_score"];
        //using that int, grab the proper string from the victimScoreArray
        victimScoreString = victimScoreArray[victimScoreCountFromInk];
        //add that text to the list of strings
        outcomeList.Add(victimScoreString);
    }

    public void onContinueButtonClick()
    {
        if (outcomeListIndex == outcomeList.Count - 1)
        {
            outcomeContinueButton.image.DOFade(0f, longFade).OnComplete(() => outcomeContinueButton.gameObject.SetActive(false));
            outcomeContinueButton.gameObject.GetComponentInChildren<TextMeshProUGUI>().DOFade(0f, longFade).OnComplete(() => RefreshScreenForNewEpisode());
            outcomeText.DOFade(0f, longFade + 1f).OnComplete(() => outcomeText.gameObject.SetActive(false));
        }
        else
        {
            AudioManager.instance.playTextingSound(AudioManager.instance.clickSound, .4f);
            outcomeListIndex++;
            outcomeText.DOFade(0f, .5f).OnComplete(() => outcomeText.text = "\t" + outcomeList[outcomeListIndex]);
            outcomeText.DOFade(1f, .5f).SetDelay(.5f);
        }
    }
}

