### Outline Objects

#### Description

The Outline Objects behavior visually highlights the selected objects until the end of a step.

#### Configuration

- **Color**

Color in which the target object will be highlighted. Colors are defined in the RGBA or HSV color channel. By configuring the alpha (A) value, the outline can be translucent.

- **Objects**

The `Process Scene Objects` which should be highlighted.

#### Outline Renderer Configuration

This behaviors adds a `Outline Renderer` component to the objects to be outlined. It is possible to configure the `Outline Renderer` with further parameters, or set those parameters globally in `Project Settings > VR Builder > Component Settings`, in the `Outlines` section.
Every newly created `Outline Renderer` will be configured as specified here.
The parameters on the `Outline Renderer` are the following.

- **Outline Mode**

These are the different ways an object can be outlined.
    - **Outline All**: the entire object is outlined.
    - **Outline Visible**: only the visible part of the object is outlined.
    - **Outline Hidden**: only the hidden part of the object is outlined.
    - **Outline And Silouhette**: the object is outline, and the hidden part is shown as a colored silouhette.
    - **Silouhette Only**: a colored silouhette is shown on the hidden part of the object.

- **Outline Color**

Specifies the color of the outline. This parameter is not relevant when using outlines with this behavior, as the behavior will override the color of the outline.

- **Outline Width**

The width of the outline. A larger value corresponds to a thicker line.

- **Precompute Outline**

This setting is not present in the global settings as it makes sense on a per-object basis. If selected, the outline is computed at editor time and stored in the object, while in the opposite case it will be generated at runtime. This might be noticeable with larger meshes. Precomputing could result in noticeably larger scene/project size, while not precomputing could cause a pause as the outline is generated on Awake().