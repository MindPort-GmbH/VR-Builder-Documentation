### Outline Objects

#### Description

The Outline Objects behavior visually highlights the selected object until the end of a step by displaying its outline. In addition to specifying the outline color in the behavior, it is possible to further configure the outline renderer to achieve different results.

#### Configuration

- **Color**

    Color in which the target object will be outlined. Colors are defined in the RGBA or HSV color channel.

- **Object**

    The `Process Scene Object` or objects which should be highlighted.

#### Outline Renderer Configuration

The `Outline Property` will automatically add a `Outline Renderer` component to the `Process Scene Object`. It is possible to further configure the `Outline Renderer` as follows.

**Outline Mode**

    Lets you choose whether to outline the entire object, only the visible or hidden parts of it, also provides the option to display the silouhette of the hidden part of the object in the highlight color.

**Outline Color**

    This parameter is overridden by the behavior so it won't have any effect.

**Outline Width**

    Specifies the width of the displayed outline.

**Precompute Outline**

    If checked, the outline calculations will be performed in editor and serialized with the object, else the computation will be performed at runtime in the `Awake()` function.
