using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
public class TextingManager : MonoBehaviour
{
	public GameManager _gameManager;
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
	private string currentText;
	private string currentName;
	public Button choicetext1;
	public Button choicetext2;
	public Button choicetext3;
	
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
		
		CurrentStoryState = StoryState.EpisodeStart;
	}

	private void Update()
	{
		switch (CurrentStoryState)
		{
			case StoryState.EpisodeStart:
				EpisodeStart();
				break;
			case StoryState.StartNextInteraction:
				StartCoroutine(TextAppearStoryUpdate());
				break;
			case StoryState.EpisodeEnd:
				break;
		}
	}

	private void EpisodeStart()
	{
		//load the story file
		TextAsset storyFile = Resources.Load<TextAsset>("Olivia conversations");
		Debug.Log("Story file loaded");
		
		//Get the texterIdentity text component, then set the texter name via an Ink variable called conversant_name
		TextMeshProUGUI nameText = texterIdentityUIText.GetComponentInChildren<TextMeshProUGUI>();
		story = new Story(storyFile.text);
		string texterName = (string) story.variablesState["conversant_name"];
		nameText.text = texterName;
		
		//begin running the Ink story!
		StartCoroutine(TextAppearStoryUpdate());
	}
	public IEnumerator TextAppearStoryUpdate()
	{
		CurrentStoryState = StoryState.TextPrintInIntervals;
		print("Is Rosa Speaking?" + isRosaSpeaking);

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
			dialogue = talkerText.GetComponent<TextMeshProUGUI>();
			dialogue.text = story.Continue();
			dialogue.transform.SetParent(textingContentHolder.transform);
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