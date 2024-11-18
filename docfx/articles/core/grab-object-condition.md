### Grab Object

#### Description

The Grab Object condition is fulfilled when the user grabs any of the `Objects`. 
The condition is also fulfilled if the user already grabbed any of Objects before the step was activated, that is, if the user is already holding the specified object.

#### Configuration

- **Objects**

    The `Process Scene Objects` to grab. The objects needs to have the `Grabbable Property` and a collider component configured. The collider defines the area where the user can grab an object.
