## Locomotion

By default the rig is configured for locomotion types that minimize discomfort. These are movement by teleportation and rotation with snap turn. You can modify the locomotion styles supported by your rig by enabling or disabling the child objects of the `Locomotion` object on the rig.

![Rig Locomotion](images/rig_locomotion.png)

### General Documentation

For detailed explanations on all locomotion styles supported please refer to the XR Interaction Toolkit documentation. As of 04.08.2025 VR Builder uses XR Interaction Toolkit [version 3.1.2](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@3.1/manual/locomotion-landing.html) as the source of the rig.

For a more in-depth guide on locomotion in VR we suggest reading the excellent guide at [Meta’s locomotion design guidelines](https://developers.meta.com/horizon/design/locomotion-overview).

### Setup Teleportation in VR Builder

Teleportation requires the user to push the right thumbstick forward then release it while pointing at a teleportable surface or anchor. Most of the setup is handled automatically by VR Builder, but a few steps are required for it to work properly.

#### Layer Configuration

It is recommended that teleportation use a layer different from normal interactions. By default, VR Builder uses the `Teleport` raycast layer for controller raycasts and the `Teleport` XRI interaction layer for teleport actions. When you import VR Builder, it attempts to create both layers at index 31 of their respective layer arrays.

Interactors and interactables must be configured with these layers to function. In a new scene, the default rig’s teleport interactors are already set up to raycast and interact on these layers.

### Anchor and Area Setup

When creating a teleportation anchor or area, use the **Teleportation Anchor (VR Builder)** or **Teleportation Area (VR Builder)** components instead of the XRI versions. Each component has a button in its inspector that configures compatible settings, including layer masks. The **Teleportation Anchor** also offers additional options:

- **Set Default Teleportation Anchor**: Creates a default anchor by adding a collider to the game object and a graphical representation of the anchor (a feet silouhette inside a circle).

- **Add Snap Volume**: Configures the anchor so that the teleportation ray snaps to it when it's in the vicinity.

- **Add Interaction Affordance**: Adds feedback when the user interacts with the anchor.

- **Add Proximity Entry**: If this is enabled, the user will be considered teleported at the anchor even if they get close by walking or stick locomotion. This can be relevant if the VR Builder process includes a [Teleport condition](teleport-condition.md) to that anchor.

#### Troubelshoting

Teleportation generally works out of the box. If you encounter issues—such as after editing an old scene or moving the XR Teleport layer—you can reset all layers on the rig, anchors, and areas. To do this, select: `Tools > VR Builder > Developer > Configure Teleportation Layers`. Be aware that this will overwrite existing layer masks and assign the `Teleport` layer to all affected objects.