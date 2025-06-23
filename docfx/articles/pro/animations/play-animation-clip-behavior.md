### Play Animation Clip

#### Introduction
This behavior plays an animation clip directly on a game object, without needing to set up an animation controller. While this functionality is deprecated by Unity, it can occasionally still be handy for quick and easy object animation.

#### Inspector

**Animation clip**: The animation clip to play. It needs to be located in a path inside a Resources folder, or the inspector will not accept it. The clip needs to be flagged as Legacy to be played without an animation controller. VR Builder will automatically do this when the clip is dragged in the inspector. To manually flag the clip as Legacy or to undo the change it will be necessary to switch the clip's inspector to Debug mode, as the checkbox is not visible in the default inspector. If the clip is not flagged as Legacy, the animation will still work in the Unity editor but will not play in builds.

**Object to animate**: The game object to be animated.
