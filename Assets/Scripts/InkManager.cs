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

    float elapsedTime = 0;

    //dot stuff
    private float showTimer = 0;
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
        

        if(story.canContinue){//text is being drawn
            elapsedTime += Time.deltaTime;
            if (elapsedTime >= lastPrint+timeBetweenPrints){
                AudioManager.instance.playTextingSound(AudioManager.instance.textReceivedSound);
                lastPrint = elapsedTime;
                timeBetweenPrints = Random.Range(0.5f,1.0f)/Services.GameController.textingSpeed;

                string text = GetNextContent();
                //Debug.Log("just read this text: "+text);
                
                float myPauseTag = 0;

                //Elizabeth: this is where I'm trying out evaluating the pause tags
                //take current tags
                List<string> pauseTags = story.currentTags;
                foreach(string tag in story.currentTags){
                    if(tag.Contains(":")){
                        //tags are initially in string format, so set them as floats
                        float temp = float.Parse(tag.Split(':')[1]);
                        if(temp > myPauseTag){
                            myPauseTag = temp;
                            //Debug.Log("Has a tag of "+myPauseTag);
                        }
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
            if(currentDotState == dotState.showing || currentDotState == dotState.holding){
                currentDotState = dotState.shrinking;
            }
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
                    showTimer += Time.deltaTime;
                    if (showTimer >= .75f)
                    {
                        //Debug.Log("Dots are showing");
                        Services.CharacterManager.characters[currentConversant].textingInProgressIcon.SetActive(true);
                        GrowDots();
                        dotsShowingAlready = true;
                        showTimer = 0;
                    }
                    
                }
                break;
            case dotState.holding:
                dotsShowingAlready = false;
                //Debug.Log("Dots are holding");
                break;
            case dotState.shrinking:
                if (!dotsShrinkingAlready)
                {
                    //Debug.Log("Dots are shrinking");
                    ShrinkDots();
                    dotsShrinkingAlready = true;
                }
                break;
            case dotState.off:
                //Debug.Log("Dots are off");
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
        //Debug.Log("you have this many tags: "+story.currentTags.Count);
        if(story.currentTags.Count > 0){
            //Debug.Log("current tag: "+story.currentTags[0]);
        }
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
        Services.CharacterManager.characters[currentConversant].textingInProgressIcon.transform.SetAsLastSibling();
        Services.CharacterManager.characters[currentConversant].textingInProgressIcon.transform.DOScale(new Vector3(1.155703f, 1.155703f, 10.40116f), .35f)
                 .OnComplete(() => currentDotState = dotState.holding);
       
    }
    public void ShrinkDots()
    {
        Services.CharacterManager.characters[currentConversant].textingInProgressIcon.transform.SetAsLastSibling();
        Services.CharacterManager.characters[currentConversant].textingInProgressIcon.transform.DOScale(new Vector3(.1f, .1f, .1f), .35f)
            .OnComplete(() => currentDotState = dotState.off);
    }
            
   
}



