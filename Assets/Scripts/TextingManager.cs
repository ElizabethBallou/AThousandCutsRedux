using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using DG.Tweening;

public class TextingManager : MonoBehaviour
{
	public GameManager _gameManager;
	public static TextingManager instance;
	[SerializeField] private TextAsset inkJSONAsset;
	private Story story;
	public StoryState CurrentStoryState;

	private bool textDone = false;
	private bool isRosaSpeaking = false;

	private int buttonNumber;
	public float TextingSpeed = 1f;

	
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
	private string currentName;
	public Button choicetext1;
	public Button choicetext2;
	public Button choicetext3;

	public Image lockScreen;
	public TextMeshProUGUI lockScreenDateText;

	//numbers that let you control the size/shape of the text bubbles
	public float textBubbleOffsetScale = 2;
	public float textBubbleOffsetSizeX = 1;
	public float textBubbleOffsetSizeY = 1;

	private void Awake()
	{
		//create singleton for TextingManager
		instance = this;
		
		//set tweens capacity
		DOTween.SetTweensCapacity(2000, 100);
		
		//load in ink file and grab the story text
		TextAsset storyFile = Resources.Load<TextAsset>("ATC Master Ink File");
		story = new Story(storyFile.text);    
	}

	public void Start()
	{
		//Set the phone state to texting
		_gameManager.phoneUseState = PhoneState.TextingState;
		//Find all the UI components
		choicetext1.onClick.AddListener(()=>ChoiceButtonPressed(0));
		choicetext2.onClick.AddListener(()=>ChoiceButtonPressed(1));
		choicetext3.onClick.AddListener(()=>ChoiceButtonPressed(2));
		choicetext1.gameObject.SetActive(false);
		choicetext2.gameObject.SetActive(false);
		choicetext3.gameObject.SetActive(false);
		
	
		
		KnotSelection("Mikaela");
		CurrentStoryState = StoryState.EpisodeStart;
	}

	private void Update()
	{

		if (!story.canContinue && story.currentChoices.Count == 0)
		{
			CurrentStoryState = StoryState.EpisodeEnd;
		}

		switch (CurrentStoryState)
		{
			case StoryState.EpisodeStart:
				EpisodeStart();
				break;
			case StoryState.StartNextInteraction:
				StartCoroutine(TextAppearStoryUpdate());
				break;
			case StoryState.EpisodeEnd:
				GameManager.instance.phoneUseState = PhoneState.BlackoutState;
				break;
		}
	}

	private void KnotSelection(string characterName)
	{
		string knotName = characterName + "_knot_" + CharacterManager.instance.conversationData[characterName];
		CharacterManager.instance.conversationData[characterName]++;
		story.ChoosePathString(knotName);
		
		
		//work on timing so that texts don't display while lock screen is fading away
		lockScreen.DOFade(0, 3f).OnComplete(()=>lockScreen.gameObject.SetActive(false));
		lockScreenDateText.DOFade(0, 3f).OnComplete(() => lockScreenDateText.gameObject.SetActive(false));
	}
	
	private void EpisodeStart()
	{
		//begin running the Ink story!
		StartCoroutine(TextAppearStoryUpdate());
	}
	
	
	public IEnumerator TextAppearStoryUpdate()
	{
		CurrentStoryState = StoryState.TextPrintInIntervals;
		//print("Is Rosa Speaking?" + isRosaSpeaking);

		while (story.canContinue)
		{
			currentName = (string) story.variablesState["current_name"];

			GameObject talkerText;
			//if the variable that checks for user input (Rosa speech) is false, and the currentName variable from the Ink file is not Rosa...
			if (isRosaSpeaking == false && currentName != "Rosa")
			{
				talkerText = Instantiate(conversationalistPrefab);

			}
			else
			{
				talkerText = Instantiate(RosaPrefab);
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

			//dialogueRect = dialogue.GetComponent<RectTransform>();
			
			//Get the texterIdentity text component, then set the texter name via an Ink variable called conversant_name
			TextMeshProUGUI nameText = texterIdentityUIText.GetComponentInChildren<TextMeshProUGUI>();
			Debug.Log("nameText.text is " + nameText.text);
			if (nameText.text == "")
			{
				string texterName = (string) story.variablesState["conversant_name"];
				Debug.Log("The name of the conversant is " + story.variablesState["conversant_name"]);
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
	
}

	public enum StoryState
	{
		EpisodeStart,
		StartNextInteraction,
		TextPrintInIntervals,
		WaitForInteraction,
		EpisodeEnd
	}