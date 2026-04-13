### Poke Object
 
#### Description
 
The Poke Object condition is fulfilled when any of the `Objects` is poked by the user's controller to the specified poke depth threshold and held for the required duration in seconds. If `Must Poke All Objects` is enabled, all listed objects must be poked to fulfill the condition. If a user is already poking any of the objects while this condition is active, this condition is fulfilled immediately once the depth and duration requirements are met.
 
#### Configuration
 
- **Objects**
 
    The `Process Scene Objects` to be poked. The objects need to have the `Pokable Property` and a collider component configured.
 
- **Must Poke All Objects**
 
    If enabled, all listed objects must be poked to fulfill the condition. If disabled, poking any one of the objects is sufficient.
 
- **Poke Depth Threshold**
 
    A value between 0 and 1 that defines how deep the poke must reach for the condition to register. A value of 0 means any contact is sufficient, while a value of 1 requires the poke to reach full depth.
 
- **Required Hold Duration**
 
    The time in seconds the user must hold the poke at or beyond the depth threshold for the condition to be fulfilled. A value of 0 means the condition is fulfilled as soon as the threshold is reached.
 
- **Lock settings**
 
    If the `Inherit Scene Object Lock State` is checked on the `Pokable Property`, the `Process Scene Object` will inherit the lock state of its parent `Process Scene Object`.
 
    If the `Is Always Unlocked` is checked on the `Pokable Property`, the `Process Scene Object` will not be locked by the VR Builder process at runtime.
    It is still possible to lock the `Pokable Property` manually.
 
#### Remarks
 
- The `Pokable Property` requires an `XRSimpleInteractable` and an `XRPokeFilter` component on the object. These are added automatically when the `Pokable Property` is configured.
- The `Pokable Property` is not compatible with the `Grabbable Property`, `Usable Property`, or `Touchable Property`. Only one of these interaction properties should be used on a given object.
 
#### Poke Follow Affordance
 
By default, the Poke Object condition works on any GameObject with a `Pokable Property` and does not require the object to visually move when poked.
 
If you want the object to **visually move or press** in response to the poke (for example, a button that presses in when poked), you need to add the `XR Poke Follow Affordance` component. This requires a different setup from the standard poke configuration. Refer to the `pokeButton` prefab included in the project for a working example of how to set this up correctly.
 
This setup is specifically for cases where the object should move on poke. For all other poke interactions, the standard `Pokable Property` configuration is sufficient.