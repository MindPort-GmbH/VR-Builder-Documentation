### Highlight Object

#### Description

The Highlight Object behavior visually highlights the selected object until the end of a step.

For additional highting features you can replace the *Default Highlighter* with a *Interactable Highlighter Script*. Select the highlighted `Object` in the Unity Hierarchy. In the Unity Inspector replace the *DefaultHighlighter* with a *Interactable Highlighter Script*.

[![Interactable Highlighter Script](images/interactable-highlighter-script.png)](images/interactable-highlighter-script.png)

You can define the Color and Material for *On Touch Highlight*, *On Grab Highlight*, and *On Use Highlight*. The object will show the highlight color configured in the Highlight behavior by default. As soon as the object is touched it will change to the color configured in *On Touch Highlight*. The same happens when the object is grabbed or used. It will display the configured color in ‘On Grab Highlight’ or ‘On Use Highlight’. 

#### Configuration

- **Color**

    Color in which the target object will be highlighted. Colors are defined in the RGBA or HSV color channel. By configuring the alpha (A) value, highlights can be translucent.

- **Object**

    The `Process Scene Object` which should be highlighted.
