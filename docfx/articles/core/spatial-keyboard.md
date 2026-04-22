## Spatial Keyboard

VR Builder supports the XR Interaction Toolkit's spatial (non-native) keyboard as an in-world input method, so VR users can type without a hardware keyboard. This page covers:

- Using the **spatial keyboard with UI Toolkit** `TextField`s through the bridge components shipped with VR Builder.
- Using the **spatial keyboard with Unity's uGUI (legacy UI)** — which is handled directly by the XR Interaction Toolkit and does not need the VR Builder bridge.
- Plugging in a **different keyboard implementation** (for example, the headset's native system keyboard, or a custom floating keyboard prefab) by implementing your own keyboard backend.

### Requirements

- A VR Builder scene with an XR Rig already set up. See [XR Rig](xr-rig.md) if you have not configured one yet.
- The Unity **XR Interaction Toolkit** package, with the **XRI Spatial Keyboard** sample imported. This sample provides the `XRKeyboard` and `GlobalNonNativeKeyboard` types (namespace `UnityEngine.XR.Interaction.Toolkit.Samples.SpatialKeyboard`).
- **The `XRI Global Keyboard Manager` prefab must be present in your scene.** Without it there is no `XRKeyboard` for the bridge to open. Drag the prefab from the XRI Spatial Keyboard sample into the scene once — it provides the single shared keyboard instance used by every field.

### Using the Spatial Keyboard with UI Toolkit

VR Builder ships two components that together connect a UI Toolkit `TextField` to the spatial keyboard:

- `UITKKeyboardBridge` — listens to a `UIDocument` and its `TextField`.
- `XriSpatialKeyboardBackend` — opens and syncs the XR Interaction Toolkit `XRKeyboard` on behalf of the bridge.

#### Scene Setup

1. Make sure the `XRI Global Keyboard Manager` prefab is in the scene (see Requirements).
2. Select the GameObject that holds your `UIDocument` and add the following components to it:
   - **UITK Keyboard Bridge** (`UITKKeyboardBridge`) — requires a `UIDocument` on the same GameObject (enforced by `[RequireComponent(typeof(UIDocument))]`).
   - **XRI Spatial Keyboard Backend** (`XriSpatialKeyboardBackend`) — implements `IKeyboardBackend` and wraps `XRKeyboard`.
3. Drag the backend into the bridge's **Keyboard Backend Behaviour** field. You can also leave this field blank — when blank, the bridge automatically resolves any `IKeyboardBackend` component on the same GameObject.
4. **Register every `TextField` that should open the keyboard.** In the bridge's **Text Field Names** list, add the `name` of each UI Toolkit `TextField` (the `name` attribute set in UI Builder or UXML) as a string. Only fields whose names appear in this list will be wired up — unlisted `TextField` will not open the spatial keyboard. The list contains `ServerIpInput` by default, which is the field name used by the Netcode add-on's connection UI.

When the scene starts, the bridge queries the `UIDocument`'s root, finds every `TextField` whose name matches one of the entries in the list, and registers them. Focusing one of these fields — by poking it with an XR ray, tapping it with a controller, or tabbing to it — then opens the spatial keyboard with the field's current text.

#### Auto-Configuration with the Netcode Add-On

If the Netcode for VR Builder add-on is installed, no manual setup is needed for the built-in connection UI. At runtime, `DefaultConnectionUIXriKeyboardBridgeBootstrap` finds every `DefaultConnectionUI` in the scene, adds `UITKKeyboardBridge` and `XriSpatialKeyboardBackend` to it if they are missing, and configures the bridge for the `ServerIpInput` field. The components are added at runtime only and will not appear on the prefab in edit mode.

### Using the Spatial Keyboard with uGUI (Legacy UI)

If your UI is built with Unity's legacy uGUI (`Canvas`, `InputField`, or TextMeshPro `TMP_InputField`) instead of UI Toolkit, you do not need the `UITKKeyboardBridge`. The XR Interaction Toolkit ships its own integration that wires `XRKeyboard` directly to uGUI input fields via `GlobalNonNativeKeyboard`. Add the `XRI Global Keyboard Manager` prefab to the scene as described above, and follow the instructions in the [XR Interaction Toolkit documentation](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@latest) for the Spatial Keyboard sample.

### Component Reference

**UITK Keyboard Bridge**

| Field | Purpose |
|---|---|
| Enable Spatial Keyboard Bridge | Master switch. When disabled, `TextField`s behave as if the bridge were not present. |
| Keyboard Backend Behaviour | The `IKeyboardBackend` used to show and drive the keyboard. Leave blank to auto-resolve from the same GameObject. |
| Close Keyboard On Focus Out | When `true`, closes the keyboard as soon as the focused `TextField` loses focus. Leave `false` if users interact with the keyboard itself after tapping a field, otherwise the keyboard closes the moment focus moves onto a key. |
| Close Keyboard On Submit | When `true`, closes the keyboard after a submit (Enter) event. |
| Log Warnings | Logs a warning once if no backend is available at open time. |
| Text Field Names | The names of the `TextField` elements in the bound `UIDocument` that the bridge should manage. Every field you want to hook up must be listed here. |

**XRI Spatial Keyboard Backend**

| Field | Purpose |
|---|---|
| Keyboard | Explicit reference to an `XRKeyboard`. Usually left empty — use `Auto Find Keyboard` or the global manager instead. |
| Auto Find Keyboard | If set, the backend searches the scene for an `XRKeyboard` when none is assigned. |
| Prefer Global Keyboard Manager | If set, the backend uses `GlobalNonNativeKeyboard.instance` when available, so the keyboard appears and is positioned through the global manager. |
| Log Warnings | Logs a warning once if no `XRKeyboard` can be found. |
| Reposition Without Global Manager | When there is no `GlobalNonNativeKeyboard` in the scene, places the keyboard relative to the main camera using `Fallback Keyboard Offset`. |
| Fallback Keyboard Offset | Camera-relative offset used by the fallback positioning — x is right, y is up, z is forward. Default `(0, -0.3, 0.55)`. |

### How It Works

The bridge listens to events on every registered `TextField` — pointer down, focus in, focus out, value changed, key up, and navigation move. When the user focuses or interacts with a field, the bridge asks the backend to open the keyboard using the field's current text and caret. When the backend reports that a key was pressed or text was submitted, the bridge writes the new text and caret position back into the `TextField` through a `UIToolkitTextFieldAdapter`, without re-triggering its own change callbacks. This keeps the two representations in sync in both directions.

### Using a Different Keyboard (Custom Backend)

The spatial keyboard is only one option. If you want to drive UI Toolkit fields with the headset's native system keyboard, a third-party floating keyboard asset, or your own custom prefab, you can write your own backend and plug it into the same `UITKKeyboardBridge`.

To add a custom keyboard:

1. **Implement `IKeyboardBackend`.** Create a `MonoBehaviour` that implements `VRBuilder.Netcode.UI.Keyboard.IKeyboardBackend`. The interface requires:
   - `bool IsAvailable` and `bool IsOpen` properties.
   - `Open(KeyboardTextState state)`, `SyncState(KeyboardTextState state)`, and `Close()` methods.
   - `StateUpdated`, `Submitted`, and `Closed` events that fire when the user types, submits, or closes the keyboard.
   Use `XriSpatialKeyboardBackend` as a reference implementation — it shows how to translate input events from an external keyboard into the `KeyboardTextState` the bridge expects.
2. **Add your keyboard prefab to the scene**, or spawn it at runtime from your backend — whichever fits the keyboard you are integrating.
3. **Swap the backend on the bridge.** On the GameObject holding `UIDocument` and `UITKKeyboardBridge`, replace `XriSpatialKeyboardBackend` with your new backend component, and assign it to the bridge's **Keyboard Backend Behaviour** field (or leave the field blank and let the bridge auto-resolve the `IKeyboardBackend` from the same GameObject).

From that point on, the bridge talks to your backend exactly the same way it talks to the spatial keyboard — focusing a `TextField` opens your keyboard, and typing on your keyboard updates the `TextField`.

### Troubleshooting

- **"UITKKeyboardBridge could not find an available keyboard backend."**  
  The bridge could not resolve an `IKeyboardBackend`. Make sure `XriSpatialKeyboardBackend` (or your custom backend) is on the same GameObject as the bridge, or assigned to the **Keyboard Backend Behaviour** field.
- **"XriSpatialKeyboardBackend could not find an XRKeyboard."**  
  The XRI Spatial Keyboard sample is not present in the scene. Import the XR Interaction Toolkit sample and drag the `XRI Global Keyboard Manager` prefab into the scene.
- **The keyboard does not open for a specific `TextField`.**  
  Confirm that the field's `name` appears in the bridge's **Text Field Names** list, and that the `TextField` is inside the `UIDocument` attached to the same GameObject as the bridge.
- **The keyboard opens and immediately closes.**  
  This usually happens when `Close Keyboard On Focus Out` is enabled and the user's pointer moves from the `TextField` onto the keyboard. Disable that option so the editing session stays alive while the user is typing.
