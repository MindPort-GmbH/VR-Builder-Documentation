### Play Video

#### Description

The Play Video behavior plays a video and waits until playback is finished before the behavior ends.
It can be used for guided instructions, demonstrations, or embedded media moments inside a process step.

#### Configuration

- **Video clip**

    Selects the video source.
    You can either use a clip from your project `Resources` folders or provide a URL.
    If you use a project clip, enter the path relative to `Resources` and without file extension.

- **Video player**

    The `Process Scene Object` that should play the selected video.
    It needs a `Video Player Property`, which controls the underlying Unity `VideoPlayer` component.

- **Execution stages**

    By default, steps execute behaviors in the beginning, in their activation stage. This can be changed with the `Execution stages` dropdown menu:

    - `Before Step Execution`: The step invokes the behavior during its activation.
    - `After Step Execution`: Once a transition to another step has been selected and the current step starts deactivating, the behavior is invoked.
    - `Before and After Step Execution`: Execution at activation and deactivation of a step.

#### Video Player Property Notes

The `Video Player Property` can be configured for standard or 360 videos.
For 360 videos, the property inspector includes a shortcut button that configures the component for equirectangular playback.
