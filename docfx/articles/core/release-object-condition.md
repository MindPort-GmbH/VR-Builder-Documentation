### Release Object

#### Description

The Release Objects condition is fulfilled when all of the `Objects` are released by the user's controller. If the user is not already holding any of the specified objects in hand while this condition is active, it is fulfilled immediately.

#### Configuration

- **Objects**

    The `Process Scene Objects` to release. The objects need to have the `Grabbable Property` and a collider component configured.

- **Lock settings**

  If the `Inherit Scene Object Lock State` is checked on the `Grabbable Property`, the `Process Scene Object` will inherit the lock state of its parent `Process Scene Object`.

  If the `Is Always Unlocked` is checked on the `Grabbable Property`, the `Process Scene Object` will not be locked by the VR Builder process at runtime.
  It is still possible to lock the `Grabbable Property` manually.