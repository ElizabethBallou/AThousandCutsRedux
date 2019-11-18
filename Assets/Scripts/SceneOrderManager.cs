using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneOrderManager : MonoBehaviour
{
    
    public static SceneOrderManager instance;
    private void Awake()
    {
        instance = this;
    }
    

    public void LoadNewScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName, LoadSceneMode.Additive);
    }
    
}
