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
	//SINGLETON
	public static TextingManager instance;
	
	//INK ASSETS/WRAPPER
	[SerializeField] private TextAsset inkJSONAsset;
	private Story story;
	public StoryState CurrentStoryState;
	
	//STORY FLOW VARIABLES/OBJECTS
	private bool textDone = false;
	private bool isRosaSpeaking = false;
	public float TextingSpeed = 1f;
	private bool fadeComplete = false;
	private string currentText;
	private string currentSpeaker;
	
	//BLACKOUT/LOCK SCREEN OBJECTS/VARIABLES
	public GameObject textingScreen;
	public Image blackoutBox;
	public Image lockScreen;
	public TextMeshProUGUI lockScreenDateText;
	public float lockScreenFadeDuration = 1;
	private bool lockScreenFadeComplete;
	
	//TEXT BOX PREFABS/OBJECTS
	public GameObject texterIdentityUIText;
	private TextMeshProUGUI dialogue;
	private RectTransform dialogueRect;
	private RectTransform dialogueBoxRect;
	
		//numbers that let you control the size/shape of the text bubbles
		public float textBubbleOffsetScale = 2;
		public float textBubbleOffsetSizeX = 1;
		public float textBubbleOffsetSizeY = 1;
	
	// ADDITIVE SCENE LOADING OBJECTS
	public GameObject conversationalistPrefab;
	public GameObject RosaPrefab;
	public GameObject textingContentHolder;
	private GameObject secondCanvas;
	public GameObject responseBox;
	
	//CHOICE UI
	private int buttonNumber;
	public Button choicetext1;
	public Button choicetext2;
	public Button choicetext3;
	
	//EPISODE SWITCHING VARIABLES
	public string currentCharacterName;
	public string currentCharacterConversation;
	public string[] characterTexterOrder;
	public int characterTexterOrderIndex = 0;

	private void Awake()
	{
		//create singleton for TextingManager
		instance = this;
	}

	public void Start()
	{
		
		//set tweens capacity
		DOTween.SetTweensCapacity(2000, 100);
		
		//load in ink file and grab the story text
		TextAsset storyFile = Resources.Load<TextAsset>("ATC Master Ink File");
		story = new Story(storyFile.text);    

		//Add listeners to the buttons, then set them inactive
		choicetext1.onClick.AddListener(()=>ChoiceButtonPressed(0));
		choicetext2.onClick.AddListener(()=>ChoiceButtonPressed(1));
		choicetext3.onClick.AddListener(()=>ChoiceButtonPressed(2));
		choicetext1.gameObject.SetActive(false);
		choicetext2.gameObject.SetActive(false);
		choicetext3.gameObject.SetActive(false);

		SetNewEpisode(characterTexterOrder[characterTexterOrderIndex]);
		
	}

	private void Update()
	{
		//run EvaluateInkBool with an Ink variable that says whether a specific conversation is happening
		if (EvaluateInkBool("conversation_happening") == false && CurrentStoryState == StoryState.TextPrintInIntervals)
		{
			CurrentStoryState = StoryState.EpisodeEnd;
			StopCoroutine(TextAppearStoryUpdate());
		}

		if (fadeComplete)
		{
			switch (CurrentStoryState)
			{
				case StoryState.EpisodeStart:
					SetTextingScreen();
					EpisodeStart();
					break;
				case StoryState.StartNextInteraction:
					StartCoroutine(TextAppearStoryUpdate());
					break;
				case StoryState.EpisodeEnd:
					SetBlackoutScreen();
					CurrentStoryState = StoryState.Intermission;
					break;
				case StoryState.ChooseNewConversant:
					CurrentStoryState = StoryState.EpisodeStart;
					//This gnarly line of code calls SetNewEpisode, which takes a string - in this case, a specific string in an array of 'em
					//that determines the order in which characters speak.
					SetNewEpisode(characterTexterOrder[characterTexterOrderIndex]);
					//Then the state has to get set to EpisodeStart right away, or ChooseNewConversant runs forever
					break;
			}
		}
	}

	#region FunctionsCalledInEpisodeStart

	public void SetTextingScreen()
	{
		textingScreen.SetActive(true);
		blackoutBox.gameObject.SetActive(true);
        
		//this fades away the lock screen and the lock screen date text
		blackoutBox.DOFade(0, .5f).OnComplete(() => blackoutBox.gameObject.SetActive(false));
		lockScreen.DOFade(0, lockScreenFadeDuration).SetDelay(.5f).OnComplete(() => lockScreen.gameObject.SetActive(false));
		lockScreenDateText.DOFade(0, lockScreenFadeDuration).SetDelay(.5f).OnComplete(() => lockScreenDateText.gameObject.SetActive(false));
	}

	private IEnumerator KnotSelection()
	{
		//this function picks a knot, then waits until the lock screen has faded away until anything else happens.
		//fadeDuration is a variable from GameManager.
		string knotName = currentCharacterName + "_knot_" + CharacterManager.instance.conversationData[currentCharacterName];
		CharacterManager.instance.conversationData[currentCharacterName]++;
		story.ChoosePathString(knotName);

		yield return new WaitForSeconds(lockScreenFadeDuration);
		fadeComplete = true;
	}
	
	private void EpisodeStart()
	{
		//begin running the Ink story!
		StartCoroutine(TextAppearStoryUpdate());
	}
	
	#endregion

	#region InkVariableEvaluationFunctions
	
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
	

	#endregion

	#region StoryProcessFunctions
	
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
			dialogue = talkerText.transform.GetChild(0).GetChild(0).GetComponent<TextMeshProUGUI>();
			//set the text from the story
			dialogue.text = story.Continue();
			//transform the text-holding object so that it is parented to the canvas
			talkerText.transform.SetParent(textingContentHolder.transform);
			
			//resize the dialogue box to be the same size as the dialogue
			dialogueBoxRect = talkerText.transform.GetChild(0).GetComponent<RectTransform>();
			dialogue.GetComponent<TextMeshProUGUI>().ForceMeshUpdate();
			Vector2 offsetSize = dialogue.GetComponent<TextMeshProUGUI>().textBounds.extents*textBubbleOffsetScale;
			offsetSize.x += textBubbleOffsetSizeX;
			offsetSize.y += textBubbleOffsetSizeY;
			dialogueBoxRect.sizeDelta = offsetSize;
			
			//Get the texterIdentity text component, then set the texter name via an Ink variable called conversant_name
			TextMeshProUGUI nameText = texterIdentityUIText.GetComponentInChildren<TextMeshProUGUI>();
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
							choicetext1.GetComponent<TextMeshProUGUI>().text =
								choice.text.Trim();
							if (textDone)
							{
								choicetext1.gameObject.SetActive(true);
							}

							break;
						case 1:
							choicetext2.GetComponent<TextMeshProUGUI>().text =
								choice.text.Trim();
							if (textDone)
							{
								choicetext2.gameObject.SetActive(true);
							}
							break;
						case 2:
							choicetext3.GetComponent<TextMeshProUGUI>().text =
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
	
	#endregion

	#region FunctionsCalledInEpisodeEnd

	    public void SetBlackoutScreen()
        {
            blackoutBox.gameObject.SetActive(true);
            lockScreen.gameObject.SetActive(true);
    
            lockScreen.DOFade(1, lockScreenFadeDuration).OnComplete(() => blackoutBox.DOFade(1, 1f).OnComplete(()=> CurrentStoryState = StoryState.ChooseNewConversant));
            SceneManager.UnloadSceneAsync(currentCharacterConversation);
            characterTexterOrderIndex++;
        }

	#endregion

	#region FunctionsCalledInChooseNewConversant

	public void SetNewEpisode(string character)
	{
		currentCharacterName = character;
		currentCharacterConversation = character + "Conversations";
		LoadNewScene(currentCharacterConversation);
	}
	
	public void LoadNewScene(string sceneName)
	{
		SceneManager.LoadScene(sceneName, LoadSceneMode.Additive);

		StartCoroutine(ReparentNewAdditiveScene(.5f));

	}
	
	public IEnumerator ReparentNewAdditiveScene(float time)
	{
		yield return new WaitForSeconds(time);

		//make an array of the root objects in the new scene just loaded in
		//find the canvas
		//find the textingcontentholder
		Debug.Log(currentCharacterConversation);

		GameObject[] newSceneObjects = SceneManager.GetSceneByName(currentCharacterConversation)
			.GetRootGameObjects();
		for (int i = 0; i < newSceneObjects.Length; i++)
		{
			if (newSceneObjects[i].CompareTag("Canvas"))
			{
				secondCanvas = newSceneObjects[i];
			}
		}

		
		textingContentHolder = secondCanvas.GetComponent<NewSceneCanvasManager>().newSceneTextingContentHolder;

		StartCoroutine(KnotSelection());
		CurrentStoryState = StoryState.EpisodeStart;

	}

	#endregion

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