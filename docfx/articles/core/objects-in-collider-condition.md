### Move Objects in Collider

#### Description

The Move Objects in Collider condition is fulfilled when at least `Required object count` of the configured `Objects` are inside the specified `Collider` for the required amount of time (`Required seconds inside`) while this condition is active.

#### Configuration

- **Objects**

    The `Process Scene Objects` that should be inside the collider.

- **Collider**

    The `Process Scene Object` with the destination collider. Make sure that a collider is present and that the option `Is Trigger` is enabled.

- **Required seconds inside**

    Set the time in seconds that the `Objects` should stay inside the `Collider`.

- **Required object count**

    Set how many `Objects` should stay inside the `Collider` at the same time. If this is set to **0** (or lower), the condition is always fulfilled. If `Required object count` is **higher than** the configured `Process Scene Objects` count, the condition is **unfulfillable**.

#### Remarks

- `Objects` do not need colliders for this condition to work.
- If the `Objects` need to be grabbable themselves, they need the `Grabbable Property` and a collider component. The collider defines the area where the user can grab the object.
- An `Object` counts as inside the collider if its transform position is inside the `Collider`. This means a 3D object can count as inside even if it is only partially inside the `Collider`. You can have one grabbable object with multiple child `Objects` to ensure that the whole object is inside, for example, on a cube with an `Object` on each corner.
- The implementation uses `Collider.ClosestPoint` with the `Object` transform position. If the closest point equals the queried position (within floating-point tolerance), the point is considered inside.