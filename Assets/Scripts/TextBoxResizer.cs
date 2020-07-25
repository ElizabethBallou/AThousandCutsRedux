using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class TextBoxResizer : MonoBehaviour
{
    TextMeshProUGUI text;
    public RectTransform stretcher;
    float defaultHeight = 73;
    // Start is called before the first frame update
    void Awake()
    {
        text = transform.GetChild(0).GetChild(1).GetComponent<TextMeshProUGUI>();
        
        stretcher = transform.GetChild(0).GetComponent<RectTransform>();
        
    }
    // Update is called once per frame
    void Update()
    {
        stretcher.sizeDelta = new Vector2(stretcher.sizeDelta.x,33+text.preferredHeight);
    }
}
