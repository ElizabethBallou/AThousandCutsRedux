using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using DG.Tweening;
using UnityEngine.UI;

public class LockButtonController : MonoBehaviour
{
    private Image unlockScreenGraphic;
    private TextMeshProUGUI dateText;
    private TextMeshProUGUI notificationText;
    private Button unlockButton;
    public float fadeTime = .5f;
    public float secondaryFadeTime = .2f;
    private bool unlockButtonPressed = false;
    private bool isFadingIn = false;
    private bool isFadingOut = false;
    private float fadeTimer = 0;
    // Start is called before the first frame update
    void Start()
    {
        unlockScreenGraphic = gameObject.GetComponent<Image>();
        dateText = gameObject.transform.GetChild(0).GetComponent<TextMeshProUGUI>();
        notificationText = gameObject.transform.GetChild(1).GetComponent<TextMeshProUGUI>();
        unlockButton = gameObject.GetComponentInChildren<Button>();
        isFadingOut = true;
    }

    // Update is called once per frame
    void Update()
    {
        if (!unlockButtonPressed)
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
                if (fadeTimer >= fadeTime)
                {
                    isFadingOut = true;
                    isFadingIn = false;
                    fadeTimer = 0f;
                }
            }
        }
    }

    public void OnUnlockButtonPress()
    {
        unlockButtonPressed = true;
        unlockButton.image.DOFade(0f, secondaryFadeTime);
        dateText.DOFade(0f, secondaryFadeTime);
        notificationText.DOFade(0f, secondaryFadeTime);
        unlockScreenGraphic.DOFade(0f, secondaryFadeTime).OnComplete(() => unlockScreenGraphic.gameObject.SetActive(false));
    }
    public void OnLockScreenLock(){
        if(unlockButtonPressed){
            unlockButtonPressed = false;
            Debug.Log("I SHOULD FADE IN");
            //put code in here to make it fade in
            
        }
        
    }
  
}
