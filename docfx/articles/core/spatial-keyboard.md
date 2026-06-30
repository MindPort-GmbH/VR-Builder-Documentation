## Spatial Keyboard

VR Builder supports the XR Interaction Toolkit's spatial (non-native) keyboard as an in-world input method, so VR users can type without a hardware keyboard. This page covers:

- Adding the **spatial keyboard to the scene** through the Scene Setup Wizard.
- Wiring **one or more UI Toolkit `UIDocument`s** to the keyboard with a bridge component.
- The **multi-user** auto-setup that wires the keyboard to the built-in connection window.
- Plugging in a **different keyboard implementation** (for example, a custom floating keyboard prefab) by implementing your own keyboard backend.
- When you can rely on a **native headset keyboard** (Pico OS, Quest in supported modes, etc.) and skip the spatial keyboard setup entirely.

### Requirements

- A VR Builder scene set up via the Scene Setup Wizard (see [XR Rig](xr-rig.md)).
- The Unity **XR Interaction Toolkit** package, with the **XRI Spatial Keyboard** sample imported. This sample provides the `XRKeyboard`, the `XRI Global Keyboard Manager` prefab, and `GlobalNonNativeKeyboard`.

The Scene Setup Wizard option for the spatial keyboard is greyed out when the XRI Spatial Keyboard sample is not imported.

### Adding the Spatial Keyboard via Scene Setup

When you create a scene from `Tools > VR Builder > Scene Setup Wizard`, the configuration page contains a checkbox to add the spatial keyboard. Enabling it makes VR Builder spawn the `XRI Global Keyboard Manager` prefab from the XRI sample into the scene. This is the single shared `XRKeyboard` instance that every text field will open.

What scene setup does **depends on the configuration you pick**:

- **Single-user scenes** — Scene setup only adds the `XRI Global Keyboard Manager` to the scene. It does **not** create a `UIDocument` for you and it does **not** add a bridge component anywhere. You are responsible for adding the `UITKKeyboardBridge` to each `UIDocument` you want connected to the keyboard (see the next section).
- **Multi-user scenes (Netcode add-on)** — Scene setup adds the `XRI Global Keyboard Manager` **and** automatically attaches `UITKKeyboardBridge` to the built-in `CONNECTION_WINDOW` `UIDocument`, with its `Server IP` input field registered. The connection panel works out of the box; any additional `UIDocument`s you add later still need their own bridge.

### Wiring a UIDocument to the Keyboard

To make the spatial keyboard open for a UI Toolkit `TextField` in your own `UIDocument`:

1. Select the GameObject that holds the `UIDocument`.
2. Add a **UITK Keyboard Bridge** (`UITKKeyboardBridge`) component to it. The component requires a `UIDocument` on the same GameObject (enforced by `[RequireComponent(typeof(UIDocument))]`).
3. Add the **XRI Spatial Keyboard Backend** (`XriSpatialKeyboardBackend`) component to the same GameObject — or assign an existing backend from elsewhere via the bridge's **Keyboard Backend Behaviour** field. When left blank, the bridge auto-resolves any `IKeyboardBackend` component on its own GameObject.
4. In the bridge's **Text Field Names** list, add the `name` of every UI Toolkit `TextField` you want to open the spatial keyboard. Only fields whose names are in this list will be hooked up; unlisted fields are ignored.

#### Multiple UIDocuments

A bridge serves a single `UIDocument` — its own. If you have several `UIDocument`s in the scene (for example, a main menu, a settings panel, and a debug HUD), add a separate `UITKKeyboardBridge` to **each** `UIDocument` GameObject and list that document's own field names in its bridge. They can all share the same `XriSpatialKeyboardBackend` instance, or each carry its own; they all drive the single `XRI Global Keyboard Manager` in the scene.

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

The bridge listens to events on every registered `TextField` — pointer down, focus in, focus out, value changed, key up, and navigation move. When the user focuses or interacts with a field, the bridge asks the backend to open the keyboard using the field's current text and caret. When the backend reports that a key was pressed or text was submitted, the bridge writes the new text and caret position back into the `TextField`, without re-triggering its own change callbacks. This keeps the two representations in sync in both directions.

### Using a Different Keyboard (Custom Backend)

The XRI spatial keyboard is one option. If you want to drive UI Toolkit fields with a different in-VR keyboard — your own prefab, a third-party floating keyboard asset, or anything else — you can write your own backend and plug it into the same `UITKKeyboardBridge`.

To add a custom keyboard:

1. **Implement `IKeyboardBackend`.** Create a `MonoBehaviour` that implements `VRBuilder.Core.UI.Keyboard.IKeyboardBackend`. The interface requires:
   - `bool IsAvailable` and `bool IsOpen` properties.
   - `Open(KeyboardTextState state)`, `SyncState(KeyboardTextState state)`, and `Close()` methods.
   - `StateUpdated`, `Submitted`, and `Closed` events that fire when the user types, submits, or closes the keyboard.
   Use `XriSpatialKeyboardBackend` as a reference implementation — it shows how to translate input events from an external keyboard into the `KeyboardTextState` the bridge expects.
2. **Add your keyboard prefab to the scene**, or spawn it at runtime from your backend — whichever fits the keyboard you are integrating.
3. **Assign the backend to the bridge.** On the GameObject that holds your `UIDocument` and `UITKKeyboardBridge`, add your backend component and either assign it to the bridge's **Keyboard Backend Behaviour** field or leave the field blank to let the bridge auto-resolve any `IKeyboardBackend` on the same GameObject.

In this setup you can skip the **Add XR spatial keyboard** option in the Scene Setup Wizard — the XRI Global Keyboard Manager is not needed when you're using your own backend.

### Using a Native Headset Keyboard

If you would rather use the headset's built-in system keyboard (for example, the Pico OS keyboard, or any other platform that exposes a native keyboard automatically for UI Toolkit input), **you do not need the spatial keyboard setup at all**. Build your UI normally with UI Toolkit (`UIDocument` + `TextField`) — when a `TextField` gains focus on a device that supports a native keyboard, the OS surfaces it directly.

For this path:

- **Leave the "Add XR spatial keyboard" option unchecked** in the Scene Setup Wizard. You don't need the `XRI Global Keyboard Manager`, the bridge, or the backend.
- The XRI Spatial Keyboard sample does not need to be imported.
- Native keyboard availability depends on the runtime — Pico supports it directly for UI Toolkit text fields, but other headsets may not. Test on your target device.

### Troubleshooting

- **The "Add XR spatial keyboard" option is greyed out in the Scene Setup Wizard.**  
  The XRI Spatial Keyboard sample is not imported. Open the Package Manager, find the XR Interaction Toolkit, and import the **Spatial Keyboard** sample.
- **"UITKKeyboardBridge could not find an available keyboard backend."**  
  The bridge could not resolve an `IKeyboardBackend`. Make sure `XriSpatialKeyboardBackend` (or your custom backend) is on the same GameObject as the bridge, or assigned to the **Keyboard Backend Behaviour** field.
- **"XriSpatialKeyboardBackend could not find an XRKeyboard."**  
  No `XRKeyboard` is in the scene. Re-run the Scene Setup Wizard with **Add XR spatial keyboard** enabled, or manually drop the `XRI Global Keyboard Manager` prefab from the XRI Spatial Keyboard sample into the scene.
- **The keyboard does not open for a specific `TextField`.**  
  Confirm that the field's `name` appears in the bridge's **Text Field Names** list, and that the `TextField` is inside the `UIDocument` attached to the same GameObject as the bridge.
- **The keyboard opens and immediately closes.**  
  This usually happens when `Close Keyboard On Focus Out` is enabled and the user's pointer moves from the `TextField` onto the keyboard. Disable that option so the editing session stays alive while the user is typing.
- **A second `UIDocument` doesn't open the keyboard.**  
  Each `UIDocument` needs its own `UITKKeyboardBridge`. Add the bridge to the second `UIDocument`'s GameObject and list its field names in **Text Field Names**.
