### Use Object

#### Description

The Use Objects condition is fulfilled when any of the `Objects` are used by pressing the *Use* button of the controller while being touched or grabbed.

#### Configuration

- **Objects**

    The `Process Scene Objects` of which one is required to be used. The `Objects` need to have the `Usable Property` and a collider component configured.

- **Lock settings**

    If the `Inherit Scene Object Lock State` is marked at the `Usable Property`, the `Process Scene Object` will inherits the lock state of it's parent `Process Scene Object`.

    If the `Is Always Unlocked` is marked at the `Usable Property`, the `Process Scene Object` will not be locked by the VR Builder process runtime. 
    It is still possible to lock the `Usable Property` manually.