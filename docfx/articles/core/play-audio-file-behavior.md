### Play Audio File

#### Description

The Play Audio File behavior plays an audio clip loaded from the `Resources` folder in your project’s asset folder. VR Builder supports all audio file formats supported by Unity, which are:

- aif
- wav
- mp3
- ogg

#### Configuration

- **Resources path/Key**

    Insert the relative file path from the Resources folder. Please note that you have to omit the file extension, as shown in the example. You can find more information about this on https://docs.unity3d.com/ScriptReference/Resources.Load.html.

    If localization is enabled, this should instead be a key in the localization table associated with the process, which contains the localized resources path.

    **Example without localization**    
    File to be played: `Assets/.../Resources/Sounds/click-sound.ogg`  
    Text/Key: `Sounds/click-sound`

    **Example with localization**   
    File to be played: `Assets/.../Resources/Sounds/click-sound.ogg`  
    Text/Key: `click-sound-key`  
    Localization table translation: `Sounds/click-sound`

- **Volume**

    The volume at which the audio should be played.

- **Execution stages**

    By default, steps execute behaviors in the beginning, in their activation stage. This can be changed with the `Execution stages` dropdown menu:

    - `Before Step Execution`: The step invokes the behavior during its activation.
    - `After Step Execution`: Once a transition to another step has been selected and the current step starts deactivating, the behavior is invoked.
    - `Before and After Step Execution`: Execution at activation and deactivation of a step.

- **Wait for completion**

    By default, the step waits for the audio file to finish. If you want the step to interrupt the audio in case the step is completed, uncheck this option. 
    
    Note: this might lead to an audio file not even being started, in case the step ends immediately.