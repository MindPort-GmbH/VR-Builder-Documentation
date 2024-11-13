### Spawn Confetti

#### Description

The Spawn Confetti behavior causes confetti to fall above the selected `Object`. It can be useful as visual feedback or
celebration for completing a task successfully.

#### Configuration

- **Spawn Above User**

  If checked, the spawn position will be above the user rather than on the specified `Process Scene Object`.


- **Position Provider**

  Specifies where the confetti should spawn if not set to spawn above the user.

- **Confetti Machine Path**

  Path to the confetti machine prefab, relative to a `Resources` folder. Use the default one or point to your custom
  confetti machine.

- **Area Radius**

  Radius around the position provider in which confetti will be spawned.

- **Duration**

  Duration of the visual effect in seconds.

- **Execution stages**

  By default, steps execute behaviors in the beginning, in their activation stage. This can be changed with the
  `Execution stages` dropdown menu:

    - `Before Step Execution`: The step invokes the behavior during its activation.
    - `After Step Execution`: Once a transition to another step has been selected and the current step starts
      deactivating, the behavior is invoked.
    - `Before and After Step Execution`: Execution at activation and deactivation of a step.
