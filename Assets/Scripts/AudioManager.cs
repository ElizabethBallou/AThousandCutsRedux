using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance;
    public AudioSource _audioSource;
    public AudioClip textReceivedSound;
    public AudioClip textSentSound;
    public AudioClip unlockSound;
    private float beginnerTimer = 0f;
    private bool beginnerTimerDone = false;
    private void Awake()
    {
        instance = this;
        _audioSource = GetComponent<AudioSource>();
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (!beginnerTimerDone)
        {
            beginnerTimer += Time.deltaTime;
            if (beginnerTimer >= .5f)
            {
                beginnerTimerDone = true;
            }
        }
    }

    public void playTextingSound(AudioClip audioClip)
    {
        if (beginnerTimerDone)
        {
            _audioSource.clip = audioClip;
            _audioSource.Play();
        }

    }
}
