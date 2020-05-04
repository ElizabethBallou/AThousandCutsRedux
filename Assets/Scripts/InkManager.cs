using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

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
            if(Time.time >= lastPrint+timeBetweenPrints){
                AudioManager.instance.playTextingSound(AudioManager.instance.textReceivedSound);
                lastPrint = Time.time;
                timeBetweenPrints = Random.Range(0.5f,1.0f)/Services.GameController.textingSpeed;

                string text = GetNextContent();
                latestText = text;

                currentConversant = story.variablesState["conversant_name"] as string;
                isRosaSpeaking = (int)story.variablesState["is_rosa"] == 1 || justDidAChoice;
                if(isRosaSpeaking){
                    AudioManager.instance.playTextingSound(AudioManager.instance.textSentSound);
                }else{
                    AudioManager.instance.playTextingSound(AudioManager.instance.textReceivedSound);
                }
                bool check = (int)story.variablesState["conversation_happening"] == 1;
                if(check == false && conversationHappening == true){
                    conversationHappening = false;
                    Services.GameController.lockScreen.OnLockScreenLock();
                    Services.GameController.BackToMessageScreen();
                }
                if(check == true && conversationHappening == false){
                    conversationHappening = true;
                }

                Services.DisplayManager.WriteText(text,currentConversant,isRosaSpeaking);
                madeChoices = false;
                justDidAChoice = false;
            }
            
        }else{//choices!!
            if(!madeChoices){
                for(int i = 0; i < 3;i++){
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
    }

    // Update is called once per frame
    public string GetNextContent()
    {
        return story.Continue();
    }
    public void SelectChoice(int choiceNum){
        if(story.canContinue){
            return;
        }
        story.ChooseChoiceIndex(choiceNum);
        for(int i = 0; i < 3;i++){
            Services.DisplayManager.choices[i].text = "";
        }
        //Debug.Log("A");
        justDidAChoice = true;
        AudioManager.instance.playTextingSound(AudioManager.instance.textSentSound);
    }
   
}
