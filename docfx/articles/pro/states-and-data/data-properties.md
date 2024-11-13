## Data Properties

This add-on makes use of data properties to store values. A data property is a VR Builder property that stores one value
of a defined data type, for example a number or a boolean. It is then possible to access those in the process steps to
read or change the values.

There are four types of data properties in this add-on.

- **Number Data Property**: Stores a single number (C# type: float).
- **Text Data Property**: Stores a string of text (C# type: string).
- **Boolean Data Property**: Stores a true/false value (C# type: bool).
- **State Data Property**: Stores a state value. More detailed information [below](state-data-properties.md) (C# type:
  int, exposed as enum).

### Creating Data Properties

We consider good practice to have each data property on a different, appropriately named empty game object, e.g. "Total
Points". This way it is easy to keep track of them and drag them in the step inspector when needed.

To create the property itself, just add a `Data Property` component of the required type to the game object, or do it
directly in the step inspector through "Fix it" button.

In the inspector, it is possible to type a default value for the data property. The property will have that value at the
start of the process, and the `Reset Value` behavior will reset the property to its default. Additionally, it is
possible to subscribe to the property events.

![Number Data Property](images/number-data-property.png)
