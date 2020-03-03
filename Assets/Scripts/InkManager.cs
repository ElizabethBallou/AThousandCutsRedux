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
    public InkManager(TextAsset jsonFile){
        inkJSONAsset = jsonFile;
        story = new Story(inkJSONAsset.text);
    }

    public void Update(){
        
        Debug.Log(currentConversant);
        if(story.canContinue){//text is being drawn
            //Debug.Log(GetNextContent());
            string text = GetNextContent();
            latestText = text;
            currentConversant = story.variablesState["conversant_name"] as string;
            isRosaSpeaking = (int)story.variablesState["is_rosa"] == 1 || justDidAChoice;
            Services.DisplayManager.WriteText(text,currentConversant,isRosaSpeaking);
            madeChoices = false;
            justDidAChoice = false;
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
        story.ChooseChoiceIndex(choiceNum);
        justDidAChoice = true;
    }
   
}
