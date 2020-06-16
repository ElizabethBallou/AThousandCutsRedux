using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using DG.Tweening;

public enum NewStoryState{
    EpisodeStart,
    StartNextInteraction,
    WaitForInteraction
}
//this should literally just read the ink and output the text
public class InkManager : MonoBehaviour
{
    public string currentConversant;
    public bool isRosaSpeaking;
    private TextAsset inkJSONAsset;
    private Story story;


    //state stuff
    bool madeChoices = false;
    bool justDidAChoice = false;//if this is true, rosa should always be speaking
    // Start is called before the first frame update

    public enum dotState
    {
        showing,
        holding,
        shrinking,
        off
    }
    public dotState currentDotState;
    public bool dotsShowingAlready = false;
    public bool dotsShrinkingAlready = false;

    public string latestText = "";

    float lastPrint;
    float timeBetweenPrints = 0;
    public bool conversationHappening;
    public InkManager(TextAsset jsonFile){
        inkJSONAsset = jsonFile;
        story = new Story(inkJSONAsset.text);
    }

    public void Update(){
        
        //Debug.Log(currentConversant);

        if(story.canContinue){//text is being drawn
            //Debug.Log("STORY SHOULD CONTINUE");
            if(Time.time >= lastPrint+timeBetweenPrints){
                AudioManager.instance.playTextingSound(AudioManager.instance.textReceivedSound);
                lastPrint = Time.time;
                timeBetweenPrints = Random.Range(0.5f,1.0f)/Services.GameController.textingSpeed;

                string text = GetNextContent();

                float myPauseTag = 0;

                //Elizabeth: this is where I'm trying out evaluating the pause tags
                //take current tags
                List<string> pauseTags = story.currentTags;
                if (pauseTags.Count > 0)
                {
                    string myPauseTagString = pauseTags[0];
                    //tags are initially in string format, so set them as floats

                    if (myPauseTagString.Contains(":"))
                    {
                        myPauseTag = float.Parse(myPauseTagString.Split(':')[1]);
                    }
 
                }

                timeBetweenPrints = myPauseTag;
                if (myPauseTag > 0)
                {
                    currentDotState = dotState.showing;
                }

                latestText = text;

                currentConversant = story.variablesState["conversant_name"] as string;
                isRosaSpeaking = (int)story.variablesState["is_rosa"] == 1 || justDidAChoice;
                if(isRosaSpeaking){
                    AudioManager.instance.playTextingSound(AudioManager.instance.textSentSound);
                }else{
                    Services.CharacterManager.characters[currentConversant].textPreview.text = latestText;
                    AudioManager.instance.playTextingSound(AudioManager.instance.textReceivedSound);
                }
                bool check = (int)story.variablesState["conversation_happening"] == 1;
                if(check == false && conversationHappening == true){
                    conversationHappening = false;
                    Services.GameController.lockScreen.OnLockScreenLock();
                }
                if(check == true && conversationHappening == false){
                    conversationHappening = true;
                }
                Services.DisplayManager.WriteText(text,currentConversant,isRosaSpeaking);
                madeChoices = false;
                justDidAChoice = false;
            }
            
        }else{//choices!!
            currentDotState = dotState.shrinking;
            if(!madeChoices){
                for(int i = 0; i < 4;i++){
                    if(i < story.currentChoices.Count){
                        Services.DisplayManager.choices[i].text = (i+1)+". "+story.currentChoices[i].text;
                    }else{
                        Services.DisplayManager.choices[i].text = "";
                    }
                    
                }
                madeChoices = true;
            }else{

            }
            
        }

        switch(currentDotState)
        {
            case dotState.showing:
                if (!dotsShowingAlready)
                {
                    Debug.Log("Dots are showing");
                    Services.CharacterManager.characters[currentConversant].textingInProgressIcon.SetActive(true);
                    GrowDots();
                    dotsShowingAlready = true;
                }
                break;
            case dotState.holding:
                dotsShowingAlready = false;
                Debug.Log("Dots are holding");
                break;
            case dotState.shrinking:
                if (!dotsShrinkingAlready)
                {
                    Debug.Log("Dots are shrinking");
                    ShrinkDots();
                    dotsShrinkingAlready = true;
                }
                break;
            case dotState.off:
                Debug.Log("Dots are off");
                dotsShrinkingAlready = false;
                Services.CharacterManager.characters[currentConversant].textingInProgressIcon.SetActive(false);
                break;
        }

    }

    // Update is called once per frame
    public string GetNextContent()
    {
        string s = story.Continue();
        if (s.Contains("@"))
        {
            return "";
        }
        return s;
    }
    public void SelectChoice(int choiceNum){
        if(story.canContinue){
            return;
        }
        story.ChooseChoiceIndex(choiceNum);
        for(int i = 0; i < 4;i++){
            Services.DisplayManager.choices[i].text = "";
        }
        justDidAChoice = true;
        AudioManager.instance.playTextingSound(AudioManager.instance.textSentSound);
    }
    public void FakeChoice()
    {
        if (story.canContinue)
        {
            story.Continue();
        }
        if (!story.canContinue)
        {
            story.ChooseChoiceIndex(0);
            story.Continue();
        }
        madeChoices = false;
        Debug.Log("Ï JUST FAKE WENT");
        Debug.Log(story.canContinue);
    }

    public void GrowDots()
    {
        Debug.Log("IM SHOWIN");
        Services.CharacterManager.characters[currentConversant].textingInProgressIcon.transform.DOScale(new Vector3(1.155703f, 1.155703f, 10.40116f), .15f)
                 .OnComplete(() => currentDotState = dotState.holding);
       
    }
    public void ShrinkDots()
    {
        Debug.Log("IM HIDIN");
        Services.CharacterManager.characters[currentConversant].textingInProgressIcon.transform.DOScale(new Vector3(.1f, .1f, .1f), .15f)
            .OnComplete(() => currentDotState = dotState.off);
    }
            
   
}



