### Rotate Around Axis

#### Introduction

This behavior rotates an object around a given axis. The object rotates a specified amount of degrees in a given time.
The axis can be represented by a second transform, and it is possible to choose whether the object will rotate around
the X, Y or Z axis of that object.

#### Inspector

![Rotate Around Axis Inspector](images/rotate-around-axis-inspector.png)

It is possible to configure the following parameters.

**Object**: The object to be rotated.

**Rotation Axis Provider**: The object defining the position of the rotation axis. If none is selected, the axis will
pass through the origin of the rotating object, which in most cases means that the object will rotate on itself.

**Rotation Axis**: The local axis of the provider object which will be used to rotate around.

**Duration (in seconds)**: The total duration of the animation.

**Animation Curve**: Defines the state of the animation over time. The X axis represents the duration of the animation (
normalized), while the Y axis represents values from the object's initial rotation (0) and the object's target rotation
defined above (1).
