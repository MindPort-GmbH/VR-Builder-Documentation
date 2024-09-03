### Behavior Sequence

#### Description

The Behavior Sequence contains a list of child behaviors which will be activated one after another. A child behavior in the list will not be activated until the previous child behavior has finished its life cycle.

#### Configuration

- **Repeat**

    If checked, the behavior sequence restarts from the top of the child behavior list as soon as the life cycle of the last child behavior in the list has finished.

- **Child behaviors**

    List of all queued behaviors. Add behaviors to the list using the *"Add Behavior"* button.

- **Wait for completion**

    If checked, the behavior sequence will finish the life cycle of each child behavior in the list before it transitions to another step. Even when the *"Repeat"* option is enabled, the execution will transition to the next step after the child behavior list has been completed. 
    Uncheck this option if you want to interrupt the sequence as soon as all conditions of a transition are fulfilled.

#### Example
Play an audio file after a set time, for example to give the user some delayed hints.

This is a sequence combining a Delay and a Play Audio File behavior. Refer to the documentation for the [Delay behavior](delay-behavior.md) and the [Play Audio File behavior](play-audio-file-behavior.md).