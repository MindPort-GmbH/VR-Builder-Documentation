### Start Particle Emission

#### Description

The Start Particle Emission behavior starts particle emission on the selected objects.
It can be useful for effects that should begin only when a process step is reached, such as smoke, sparks or ambient particles.

#### Configuration

- **Targets**

    The `Process Scene Objects` that should start emitting particles.
    Each target needs a `Particle System Property` component.

- **Execution stages**

    By default, steps execute behaviors in the beginning, in their activation stage. This can be changed with the `Execution stages` dropdown menu:

    - `Before Step Execution`: The step invokes the behavior during its activation.
    - `After Step Execution`: Once a transition to another step has been selected and the current step starts deactivating, the behavior is invoked.
    - `Before and After Step Execution`: Execution at activation and deactivation of a step.
