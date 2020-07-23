using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayButtonScript : MonoBehaviour
{
    
    // Start is called before the first frame update
    void Start()
    {
        
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
}
