### Move Object

#### Description

The Move Object behavior animates the `Object` to move and rotate (no scaling) to the position and rotation of the
`Final Position Provider` in the time specified in the `Duration (in seconds)` parameter.

Note: If `Object` was affected by gravity before, it will continue to be affected after this behavior.

#### Configuration

- **Object**

  The `Process Scene Object` to be moved and rotated (no scaling).

- **Final position provider**

  The `Process Scene Object` used as the position provider object. It should be placed at the destination position and
  rotation.

- **Animation duration (in seconds)**

  Time in seconds the animation takes to move and rotate `Object` to the `Final position provider`.

  **Example**

  Duration (in seconds) = 1.3

- **Animation curve**

  Lets you tweak the speed of the animation over time.
