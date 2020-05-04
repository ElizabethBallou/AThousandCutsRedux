using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SettingsButtonScript : MonoBehaviour
{
    public GameObject quitMenu;
    private bool isMenuOpen = false;
    // Start is called before the first frame update
    void Start()
    {
        quitMenu.gameObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnSettingsButtonClick()
    {
        if (!isMenuOpen)
        {
            quitMenu.gameObject.SetActive(true);
            isMenuOpen = true;
        }
        else
        {
            quitMenu.gameObject.SetActive(false);
            isMenuOpen = false;
        }
    }

    public void YesButtonClick()
    {
        Application.Quit();
    }

    public void NoButtonClick()
    {
        quitMenu.gameObject.SetActive(false);
        isMenuOpen = false;
    }
}
