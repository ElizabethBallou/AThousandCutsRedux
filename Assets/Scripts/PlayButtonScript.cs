using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayButtonScript : MonoBehaviour
{
    public GameObject aboutScreen;
    public GameObject blackBackdrop;
    
    // Start is called before the first frame update
    void Start()
    {
        aboutScreen.SetActive(false);
        blackBackdrop.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnPlayButtonClick()
    {
        LockScreenController.instance.notificationText.DOFade(1f, 1f);
        AudioManager.instance.playBuzzingsound(.5f);
        gameObject.SetActive(false);

    }

    public void OnAboutClick()
    {
        aboutScreen.SetActive(true);
        blackBackdrop.SetActive(true);
    }

    public void ReturnClick()
    {
        aboutScreen.SetActive(false);
        blackBackdrop.SetActive(false);
    }
}
