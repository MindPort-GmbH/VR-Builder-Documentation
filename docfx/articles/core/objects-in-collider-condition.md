### Move Objects in Collider

#### Description

The Move Objects in Collider condition is fulfilled when the `Objects` are within the specified `Collider` for the required amount of time (`Required seconds inside`) while this condition is active.

#### Configuration

- **Objects**

    The `Process Scene Objects` to move. If the objects need to be grabbed, they need to have the `Grabbable Property` and a collider component configured. The collider defines the area where the user can grab an object.

- **Collider**

    The `Process Scene Object` with the destination collider. Make sure that a collider is present and that the option `Is Trigger` is enabled.

- **Required seconds inside**

    Set the time in seconds that the `Objects` should stay inside the `Collider`.