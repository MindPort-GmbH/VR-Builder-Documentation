### Touch Object

#### Description

The Touch Object condition is fulfilled when any of the `Objects` is touched by the user's controller.  If a user is already touching the any of the objects while this condition is active, this condition is fulfilled immediately.

#### Configuration

- **Object**

    The `Process Scene Objects` to be touched. The objects need to have the `Touchable Property` and a collider component configured.

- **Lock settings**

    If the `Inherit Scene Object Lock State` is checked on the `Touchable Property`, the `Process Scene Object` will inherit the lock state of its parent `Process Scene Object`.

    If the `Is Always Unlocked` is checked on the `Touchable Property`, the `Process Scene Object` will not be locked by the VR Builder process at runtime.
    It is still possible to lock the `Touchable Property` manually.