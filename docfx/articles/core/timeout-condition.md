### Timeout

#### Description

The Timeout condition is fulfilled when the time specified in `Wait (in seconds)` has elapsed. This can make sense as
a "fallback" condition. For example, if the user does not complete condition X in the allotted amount of time, the
timeout condition will trigger leading to a different step with different consequences.

#### Configuration

- **Wait (in seconds)**

  Set the time in seconds that should elapse before this condition is fulfilled.
