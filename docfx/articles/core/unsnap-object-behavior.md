### Unsnap Object

#### Description

The Unsnap Object behavior unsnaps a snapped object from a snap zone. This can be useful in case the object needs to be
further manipulated by the process.

#### Configuration

Either the object or the snap zone can be left null. This will result in either the object unsnapping from any snap zone
it is in, or in the unsnapping of whatever object is snapped to the specified snap zone.

If both are specified, the unsnap will occur only if the specified object is snapped to the specified snap zone.

- **Object to unsnap**

  The `Process Scene Object` to unsnap.

- **Snap zone to unsnap**

  The `Snap Zone` from which the object will be unsnapped.
