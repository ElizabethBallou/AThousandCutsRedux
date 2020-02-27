using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class TextingManager : MonoBehaviour
{
	public static TextingManager instance;
	[HideInInspector]
	[SerializeField] private TextAsset inkJSONAsset;
	private Story story;
	public StoryState CurrentStoryState;

	private bool textDone = false;
	private bool isRosaSpeaking = false;

	private int buttonNumber;
	public float TextingSpeed = 1f;

	private bool fadeComplete = false;

	
	// UI stuff
	public GameObject conversationalistPrefab;
	public GameObject RosaPrefab;
	public GameObject textingContentHolder;
	public GameObject responseBox;
	public GameObject texterIdentityUIText;
	private TextMeshProUGUI dialogue;
	private RectTransform dialogueRect;
	private RectTransform dialogueBoxRect;
	private string currentText;
	private string currentSpeaker;
	public Button choicetext1;
	public Button choicetext2;
	public Button choicetext3;
    private TextMeshProUGUI nameText;

    private GameObject secondCanvas;

	

	//numbers that let you control the size/shape of the text bubbles
	public float textBubbleOffsetScale = 2;
	public float textBubbleOffsetSizeX = 1;
	public float textBubbleOffsetSizeY = 1;
	
	private void Awake()
	{
		//create singleton for TextingManager
		instance = this;
		
		//load in ink file and grab the story text
		TextAsset storyFile = Resources.Load<TextAsset>("ATC Master Ink File");
		story = new Story(storyFile.text);    
	}

	public void Start()
	{
		//Set the phone state to texting
		//Find all the UI components
		choicetext1.onClick.AddListener(()=>ChoiceButtonPressed(0));
		choicetext2.onClick.AddListener(()=>ChoiceButtonPressed(1));
		choicetext3.onClick.AddListener(()=>ChoiceButtonPressed(2));
		choicetext1.gameObject.SetActive(false);
		choicetext2.gameObject.SetActive(false);
		choicetext3.gameObject.SetActive(false);

        //Get the texterIdentity text component, then set the texter name via an Ink variable called conversant_name
         nameText = texterIdentityUIText.GetComponentInChildren<TextMeshProUGUI>();

        //make an array of the root objects in the new scene just loaded in
        //find the canvas
        //find the textingcontentholder
        Debug.Log(GameManager.instance.currentCharacterConversation);
		GameObject[] newSceneObjects = SceneManager.GetSceneByName(GameManager.instance.currentCharacterConversation)
			.GetRootGameObjects();
		for (int i = 0; i < newSceneObjects.Length; i++)
		{
			if (newSceneObjects[i].CompareTag("Canvas"))
			{
				secondCanvas = newSceneObjects[i];
			}
		}

		textingContentHolder = secondCanvas.GetComponent<NewSceneCanvasManager>().newSceneTextingContentHolder;

		//StartCoroutine(KnotSelection());
		CurrentStoryState = StoryState.EpisodeStart;
	}

	private void Update()
	{
		//run EvaluateInkBool with an Ink variable that says whether a specific conversation is happening
		if (EvaluateInkBool("conversation_happening") == false && CurrentStoryState == StoryState.TextPrintInIntervals)
		{
			CurrentStoryState = StoryState.EpisodeEnd;
			StopCoroutine(TextAppearStoryUpdate());
		}

		if (fadeComplete) //this is where FadeComplete will go back in
		{
			switch (CurrentStoryState)
			{
				case StoryState.EpisodeStart:
					GameManager.instance.SetTextingScreen();
					EpisodeStart();
					break;
				case StoryState.StartNextInteraction:
					StartCoroutine(TextAppearStoryUpdate());
					break;
				case StoryState.EpisodeEnd:
					GameManager.instance.SetBlackoutScreen();
					//CurrentStoryState = StoryState.Intermission;
					break;
				case StoryState.ChooseNewConversant:
					Debug.Log("help");
					GameManager.instance.SetNewEpisode(GameManager.instance.characterTexterOrder[GameManager.instance.characterTexterOrderIndex]);
					CurrentStoryState = StoryState.EpisodeStart;
					break;
			}
		}
	}

	public IEnumerator KnotSelection()
	{

		//this function picks a knot, then waits until the lock screen has faded away until anything else happens.
		//fadeDuration is a variable from GameManager.
		Debug.Log("KnotSelection is getting called");
        Debug.Log(CharacterManager.instance);
		string knotName = GameManager.instance.currentCharacterName + "_knot_" + CharacterManager.instance.conversationData[GameManager.instance.currentCharacterName];
		CharacterManager.instance.conversationData[GameManager.instance.currentCharacterName]++;
		story.ChoosePathString(knotName);

		yield return new WaitForSeconds(GameManager.instance.fadeDuration);
        fadeComplete = true;
	}
	
	public bool EvaluateInkBool(string inkVariableName)
	{
		int inkNumber = (int) story.variablesState[inkVariableName];
		if (inkNumber == 0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	private void EpisodeStart()
	{
		//begin running the Ink story!
		StartCoroutine(TextAppearStoryUpdate());
	}
	
	
	public IEnumerator TextAppearStoryUpdate()
	{
		CurrentStoryState = StoryState.TextPrintInIntervals;

		while (story.canContinue)
		{
			currentSpeaker = (string) story.variablesState["current_speaker"];

			GameObject talkerText;

			//if the variable that checks for user input (Rosa speech) is false, and the currentName variable from the Ink file is not Rosa...
			if (isRosaSpeaking == false && currentSpeaker != "Rosa")
			{
				//this is when the other person speaks
				talkerText = Instantiate(conversationalistPrefab);
				AudioManager.instance.playTextingSound(AudioManager.instance.textReceivedSound);
			}
			else
			{
				//this is when Rosa (main character) speaks
				talkerText = Instantiate(RosaPrefab);
				AudioManager.instance.playTextingSound(AudioManager.instance.textSentSound);
				isRosaSpeaking = false;
			}

            //get the text component from the prefab that just got instantiated
            //Destina: simplified this and made it more robust to child structure
            dialogue = talkerText.GetComponentInChildren<TextMeshProUGUI>();//talkerText.transform.GetChild(0).GetChild(0).GetComponent<TextMeshProUGUI>();
			//set the text from the story
			dialogue.text = story.Continue();
            //if there is no textingContentHolder - that is, there's a new scene - findd that textingContentHolder)
            if (textingContentHolder == null)
            {
                GameObject[] newSceneObjects = SceneManager.GetSceneByName(GameManager.instance.currentCharacterConversation)
            .GetRootGameObjects();
                for (int i = 0; i < newSceneObjects.Length; i++)
                {
                    if (newSceneObjects[i].CompareTag("Canvas"))
                    {
                        secondCanvas = newSceneObjects[i];
                    }
                }

                textingContentHolder = secondCanvas.GetComponent<NewSceneCanvasManager>().newSceneTextingContentHolder;

                string texterName = (string)story.variablesState["conversant_name"];
                nameText.text = texterName;
            }
			//transform the text-holding object so that it is parented to the canvas
			talkerText.transform.SetParent(textingContentHolder.transform);

            //Destina: scales were going weird in my version so added this
            talkerText.transform.localScale = new Vector3(1f, 1f, 1f);
			
			//resize the dialogue box to be the same size as the dialogue
			dialogueBoxRect = talkerText.transform.GetChild(0).GetComponent<RectTransform>();
			dialogue.GetComponent<TextMeshProUGUI>().ForceMeshUpdate();
			Vector2 offsetSize = dialogue.GetComponent<TextMeshProUGUI>().textBounds.extents*textBubbleOffsetScale;
			offsetSize.x += textBubbleOffsetSizeX;
			offsetSize.y += textBubbleOffsetSizeY;
            //Destina: this was handled by the layout groups, but that was messing up other stuff, so just doing it explicitly here
			dialogueBoxRect.sizeDelta = offsetSize;

            talkerText.GetComponent<RectTransform>().sizeDelta = offsetSize;
			
			
			if (nameText.text == "")
			{
				string texterName = (string) story.variablesState["conversant_name"];
				nameText.text = texterName;
			}
			

			yield return new WaitForSeconds(TextingSpeed);
		}
		PrintStory();

		yield return new WaitForSeconds(TextingSpeed);

	}
	
	//Function to print text letter-by-letter
	private void PrintStory()
	{
		textDone = true;
		ShowChoiceButtons();
	}
	
	public void ShowChoiceButtons()
	{ 
		//Change the Storystate so that the player can choose one of the buttons
		CurrentStoryState = StoryState.WaitForInteraction;
		isRosaSpeaking = true;

	//Do we have a choice? If so, run the following code...
	if (story.currentChoices.Count > 0)
	{
			if (story.currentChoices == null) return;
			
			if (story.currentChoices.Count > 0)
			{
				for (int i = 0; i < story.currentChoices.Count; i++)
				{
					Choice choice = story.currentChoices[i];
					switch (i)
					{
						case 0:
							choicetext1.GetComponent<TextMeshProUGUI>().text = "1. " + 
								choice.text.Trim();
							if (textDone)
							{
								choicetext1.gameObject.SetActive(true);
							}

							break;
						case 1:
							choicetext2.GetComponent<TextMeshProUGUI>().text = "2. " + 
								choice.text.Trim();
							if (textDone)
							{
								choicetext2.gameObject.SetActive(true);
							}
							break;
						case 2:
							choicetext3.GetComponent<TextMeshProUGUI>().text = "3. " + 
								choice.text.Trim();
							if (textDone)
							{
								choicetext3.gameObject.SetActive(true);
							}
							break;
					}
				}
			}
		}
	}

	// When we click the choice button, tell the story to choose that choice!
	public void ChoiceButtonPressed(int buttonNumber)
	{
		story.ChooseChoiceIndex(buttonNumber);
		CurrentStoryState = StoryState.StartNextInteraction;
		
		choicetext1.gameObject.SetActive(false);
		choicetext2.gameObject.SetActive(false);
		choicetext3.gameObject.SetActive(false);
	}

}

	public enum StoryState
	{
		EpisodeStart,
		StartNextInteraction,
		TextPrintInIntervals,
		WaitForInteraction,
		EpisodeEnd,
		Intermission,
		ChooseNewConversant
	}