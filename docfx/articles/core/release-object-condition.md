### Release Object

#### Description

The Release Objects condition is fulfilled when all of the `Objects` are released by the user's controller. If the user
is not already holding any of the specified objects in hand while this condition is active, it is fulfilled immediately.

#### Configuration

- **Objects**

  The `Process Scene Objects` to release. The objects need to have the `Grabbable Property` and a collider component
  configured.
