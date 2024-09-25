### Point at Objects

#### Description

The Point at Objects behavior can be used to direct the user towards the objects they are supposed to interact with. By default, this is done by displaying an arrow just in front of the user, hovering above ground level. This does not intrude the user's field of view, but they can easily look down if they need a pointer.

#### Configuration

- **Objects**

The `Process Scene Objects` to point at.

- **Pointer Resource**

The prefab in a `Resources` folder that is used to point at the object. The prefab needs to contain an `Object Pointer` component. By default, it points to the `CompassArrow` prefab, which displays an arrow as described above.

#### Pointer Customization

It is possible to customize the object used for pointing. The most straightforward customization is to make a copy of the `CompassArrow` prefab and replace or edit the arrow mesh.

It is also possible to create different pointer prefabs that behave in different ways. Pointer prefabs need to have a component inheriting from `ObjectPointer` on their root object. Feel free to create your own overrides with custom logic of this class. You can look at the default `ArrowObjectPointer` for reference.