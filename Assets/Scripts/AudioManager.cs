using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance;
    private AudioSource effect_audiosource;
    public AudioSource music_audiosource;

    //soundtrack variables
    public AudioClip[] soundtrackSongs;
    public int soundtrackSongIndex = 3;
    public TextMeshProUGUI currentSongText;

    public AudioClip textReceivedSound;
    public AudioClip textSentSound;
    public AudioClip unlockSound;
    public AudioClip phoneBuzzingSound;
    public AudioClip clickSound;
    private float beginnerTimer = 0f;
    private bool beginnerTimerDone = false;

    private bool isPaused = false;

    [HideInInspector] public bool menuTriggered = true;
    private void Awake()
    {
        instance = this;
        effect_audiosource = GetComponent<AudioSource>();
        music_audiosource = gameObject.transform.GetChild(0).GetComponent<AudioSource>();

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

    public void playTextingSound(AudioClip audioClip, float volume)
    {
        if (beginnerTimerDone)
        {
            effect_audiosource.clip = audioClip;
            effect_audiosource.volume = volume;
            effect_audiosource.Play();
        }

    }

    public void playBuzzingsound(float volume)
    {
        effect_audiosource.clip = phoneBuzzingSound;
        effect_audiosource.Play();
    }

    public void playNextSong()
    {
        music_audiosource.clip = soundtrackSongs[soundtrackSongIndex];
        currentSongText.text = "Current song:" + "\n" + music_audiosource.clip.name + " (Chad Crouch)";
        music_audiosource.Play();
        soundtrackSongIndex++;
        if (soundtrackSongIndex == soundtrackSongs.Length)
        {
            soundtrackSongIndex = 0;
        }
        StartCoroutine(AudioFadeEffect(music_audiosource, .5f, 1f));
    }

    public void playPreviousSong()
    {
        music_audiosource.clip = soundtrackSongs[soundtrackSongIndex];
        currentSongText.text = "Current song:" + "\n" + music_audiosource.clip.name + " (Chad Crouch)";
        music_audiosource.Play();
        soundtrackSongIndex--;
        if (soundtrackSongIndex < 0)
        {
            soundtrackSongIndex = soundtrackSongs.Length - 1;
        }
        StartCoroutine(AudioFadeEffect(music_audiosource, .5f, 1f));
    }

    public static IEnumerator AudioFadeEffect(AudioSource audioSource, float duration, float targetVolume)
    {
        float currentTime = 0;
        float start = audioSource.volume;

        while (currentTime < duration)
        {
            currentTime += Time.deltaTime;
            audioSource.volume = Mathf.Lerp(start, targetVolume, currentTime / duration);
            yield return null;
        }
        yield break;
    }

    public void PauseButtonClick()
    {
        playTextingSound(clickSound, .4f);
        if (!isPaused)
        {
            music_audiosource.Pause();
            isPaused = true;
        }
        else
        {
            music_audiosource.UnPause();
            isPaused = false;
        }
    }

    public void FastForwardButtonClick()
    {
        float timeAmount = 0;
        if(menuTriggered)
        {
            playTextingSound(clickSound, .4f);
            timeAmount = .5f;
        }
        else
        {
            timeAmount = 3f;
        }
        menuTriggered = true;
        StartCoroutine(AudioFadeEffect(music_audiosource, timeAmount, 0));
        Invoke("playNextSong", timeAmount);
    }

    public void RewindButtonClick()
    {
        playTextingSound(clickSound, .4f);
        StartCoroutine(AudioFadeEffect(music_audiosource, .5f, 0));
        Invoke("playPreviousSong", .5f);
    }

}
