using System.Collections;
using System.IO;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public static class SaveSystem
{
   public static int versionNumber = 3;
   public static float lastSaveTime;
   public static Save save = new Save();
   public static void SaveGame(){
       save.vN = versionNumber;
       //save.currentKnot = 
        string json = JsonUtility.ToJson(save);
        string path = Application.persistentDataPath+"/save.json";
        save.dateIndex = Services.DateManager.dateListIndex;
        save.episodeEnd = Services.InkManager.conversationHappening;
        if(!File.Exists(path)){
            System.IO.File.WriteAllText(path,json);
        }else{
            StreamWriter writer = new StreamWriter(path, false);
            writer.WriteLine(json);
            writer.Close();
        }
        lastSaveTime = Time.time;
        //Debug.Log(json);
   }
   public static bool LoadGame(){
       string path  =Application.persistentDataPath+"/save.json";
        if(File.Exists(path)){
            StreamReader reader = new StreamReader(path);
            string load = reader.ReadToEnd().Trim();
            reader.Close();
            Save thisSave = JsonUtility.FromJson<Save>(load) as Save;
            if(thisSave.vN != versionNumber){
                return false;
            }
            Services.GameController.loading = true;
            save = thisSave;
            //Debug.Log(load);
            //Debug.Log(save.choices.Count);
            Services.InkManager.inSpeedyMode = true;
            for(var i = 0; i < save.choices.Count;i++){

                while(Services.InkManager.story.canContinue){
                    Services.InkManager.Update();
                }
                //Debug.Log("AT FIRST CHOICE");
                Services.InkManager.SelectChoice(save.choices[i],true);
                //Services.InkManager.Update();
            }
            Services.DateManager.dateListIndex = save.dateIndex;
            if(save.episodeEnd){
                //do something
                Services.InkManager.Update();
                //Services.GameController.lockScreen.OnLockScreenLock();
            }
            Services.InkManager.inSpeedyMode = false;
            //Debug.Log("LOAD SUCCESSFUL");
            //load the save here yo!
            //put all the text in the right place then 
            return true;
        }else{
            return false;
        }
   }
   #if UNITY_EDITOR
    [MenuItem("Save/Clear")]
    public static void ClearSave(){
        string path = Application.persistentDataPath+"/save.json";
        System.IO.File.Delete(path);
    }
    #endif
    public static void SaveChoice(int which){
        save.choices.Add((byte)which);
    }
}
[System.Serializable]
public class Save{
    //header
    public int vN = 0;//versionNumber
    public List<byte> choices = new List<byte>();
    public int dateIndex;
    public bool episodeEnd;//if true, load at the next episode
}
