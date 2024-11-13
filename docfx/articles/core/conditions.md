## Conditions

Conditions are used to determine which transition is used to exit a step. Transitions are evaluated top to bottom, and
the first valid one will be selected. To be valid means to have only fulfilled conditions or no conditions at all.
A condition usually requires the user's intervention, for example grabbing an object. However this is not always the
case: conditions like the timeout condition will trigger regardless of the user's activity. There may also be cases in
which other factors in the environment determine if a condition is fulfilled.
Conditions need to be active in order to be fulfilled. As soon as a step is active, all containing Conditions are active
as well.
This section lists the conditions included in VR Builder.
