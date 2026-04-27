## Spatial Keyboard

VR Builder supports the XR Interaction Toolkit's spatial (non-native) keyboard as an in-world input method, so VR users can type without a hardware keyboard. This page covers:

- The **automatic setup** done by the Scene Setup Wizard for UI Toolkit-based UI.
- Using the **spatial keyboard with uGUI / TextMeshPro (legacy UI)**, which is handled directly by the XR Interaction Toolkit and needs no VR Builder wiring.
- Using the **headset's native system keyboard** (e.g. Pico, Quest in some modes), which needs no VR Builder wiring either.
- Plugging in a **different keyboard implementation** (for example, a third-party floating keyboard prefab) by implementing your own keyboard backend.

### Requirements

- A VR Builder scene set up via the Scene Setup Wizard (see [XR Rig](xr-rig.md)).
- The Unity **XR Interaction Toolkit** package, with the **XRI Spatial Keyboard** sample imported. This sample provides the `XRKeyboard`, `XRI Global Keyboard Manager` prefab, and `GlobalNonNativeKeyboard` types that the keyboard relies on.

If the XRI Spatial Keyboard sample is not imported, the **Add XR spatial keyboard** option in the Scene Setup Wizard is greyed out.

### Setting Up the Spatial Keyboard with UI Toolkit

The Scene Setup Wizard now does all the wiring for you. When you create a scene from `Tools > VR Builder > Scene Setup Wizard`, the configuration page contains a checkbox:

- **Add XR spatial keyboard** — *enabled by default.*

When this option is on and the XRI Spatial Keyboard sample is present, VR Builder automatically:

1. Spawns the `XRI Global Keyboard Manager` prefab from the sample into the scene. This is the shared `XRKeyboard` instance every text field opens.
2. Creates a GameObject named **`VR Builder UI`** with the following pre-wired components:
   - `UIDocument` — empty source asset; this is where you assign your UXML.
   - `XriSpatialKeyboardBackend` — the keyboard backend that drives the XRI keyboard.
   - `UITKKeyboardBridge` — wired to the backend, with `Close Keyboard On Focus Out = false` and `Close Keyboard On Submit = true`.

After running the wizard, all you have to do is:

1. Select the **`VR Builder UI`** GameObject in the scene.
2. On its `UIDocument`, set the **Source Asset** to your own UXML.
3. On the `UITKKeyboardBridge`, add the `name` of every UI Toolkit `TextField` you want to wire up to the **Text Field Names** list. Only fields whose names appear in this list will open the spatial keyboard — unlisted `TextField`s are ignored.

That's it. Pointing at any registered `TextField` with an XR ray, poking it with a controller, or tabbing to it now opens the in-VR keyboard with the field's current text.

#### Multi-User Scenes (Netcode Add-On)

For multi-user scenes set up with the **Netcode for VR Builder** add-on, the `VR Builder UI` host is not created. Instead, the existing connection UI (`DefaultConnectionUI`) is wired up automatically — the `UITKKeyboardBridge` and `XriSpatialKeyboardBackend` are added to it at runtime by `DefaultConnectionUIXriKeyboardBridgeBootstrap`, configured for the `ServerIpInput` field. No manual setup is needed for the IP-entry field.

If you add your own UI Toolkit screens to a multi-user scene, follow the same steps as in single-user: drop a GameObject with `UIDocument`, `XriSpatialKeyboardBackend`, and `UITKKeyboardBridge`, then list your field names in **Text Field Names**.

### Using the Spatial Keyboard with uGUI / TextMeshPro (Legacy UI)

If your UI uses Unity's legacy uGUI (`Canvas` with `InputField` or `TMP_InputField`) instead of UI Toolkit, you do not need the VR Builder bridge at all. The XR Interaction Toolkit's Spatial Keyboard sample integrates directly with uGUI input fields through `GlobalNonNativeKeyboard`.

To enable it:

1. In the Scene Setup Wizard, leave **Add XR spatial keyboard** enabled — this places the `XRI Global Keyboard Manager` prefab in the scene, which is everything XRI needs for legacy UI.
2. Add your `Canvas` with `InputField` or `TMP_InputField` components as you normally would.

For details on configuration, theming, and the XRI keyboard's behavior with legacy UI, see the [XR Interaction Toolkit documentation](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@latest) for the Spatial Keyboard sample.

### Using the Headset's Native Keyboard

If you would rather use the headset's built-in system keyboard (for example, the Pico OS keyboard, the Quest system keyboard in supported modes, or the OS keyboard on mobile / standalone) instead of an in-Unity keyboard, **no VR Builder setup is required**. Build your UI normally with UI Toolkit (`UIDocument` + `TextField`) — when a `TextField` gains focus on a device that exposes a native keyboard, the OS surfaces it automatically.

For this path:

- **Disable** the **Add XR spatial keyboard** checkbox in the Scene Setup Wizard, or simply delete the auto-created `VR Builder UI` host and the `XRI Global Keyboard Manager` from the scene. Otherwise the in-VR XRI keyboard will open in addition to (or instead of) the native one.
- You do **not** need the `UITKKeyboardBridge`, the `XriSpatialKeyboardBackend`, or the XRI Spatial Keyboard sample at all.
- Native keyboard availability depends on the runtime — on standalone headsets it varies by vendor and by whether the app is foregrounded inside a system overlay context. Test on your target device.

### Component Reference

The components below are added automatically by the Scene Setup Wizard. You usually don't need to touch them — but knowing the fields helps when customizing behavior.

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

The XRI spatial keyboard is one option. If you want to drive UI Toolkit fields with the headset's native system keyboard, a third-party floating keyboard asset, or your own custom prefab, you can write your own backend and plug it into the same `UITKKeyboardBridge`.

To add a custom keyboard:

1. **Implement `IKeyboardBackend`.** Create a `MonoBehaviour` that implements `VRBuilder.Core.UI.Keyboard.IKeyboardBackend`. The interface requires:
   - `bool IsAvailable` and `bool IsOpen` properties.
   - `Open(KeyboardTextState state)`, `SyncState(KeyboardTextState state)`, and `Close()` methods.
   - `StateUpdated`, `Submitted`, and `Closed` events that fire when the user types, submits, or closes the keyboard.
   Use `XriSpatialKeyboardBackend` as a reference implementation — it shows how to translate input events from an external keyboard into the `KeyboardTextState` the bridge expects.
2. **Add your keyboard prefab to the scene**, or spawn it at runtime from your backend — whichever fits the keyboard you are integrating.
3. **Swap the backend on the bridge.** On the **`VR Builder UI`** GameObject, replace `XriSpatialKeyboardBackend` with your new backend component, and assign it to the bridge's **Keyboard Backend Behaviour** field (or leave the field blank and let the bridge auto-resolve the `IKeyboardBackend` from the same GameObject). You can also disable **Add XR spatial keyboard** in the Scene Setup Wizard if you want to skip the XRI prefab and host setup entirely, then add your own host GameObject manually.

From that point on, the bridge talks to your backend exactly the same way it talks to the spatial keyboard — focusing a `TextField` opens your keyboard, and typing on your keyboard updates the `TextField`.

### Troubleshooting

- **The "Add XR spatial keyboard" option is greyed out in the Scene Setup Wizard.**  
  The XRI Spatial Keyboard sample is not imported. Open the Package Manager, find the XR Interaction Toolkit, and import the **Spatial Keyboard** sample.
- **"Scene setup could not find 'XRI Global Keyboard Manager' prefab."**  
  Same cause as above — import the XRI Spatial Keyboard sample.
- **"UITKKeyboardBridge could not find an available keyboard backend."**  
  The bridge could not resolve an `IKeyboardBackend`. Make sure `XriSpatialKeyboardBackend` (or your custom backend) is on the same GameObject as the bridge, or assigned to the **Keyboard Backend Behaviour** field.
- **"XriSpatialKeyboardBackend could not find an XRKeyboard."**  
  No `XRKeyboard` is in the scene. If you removed the `XRI Global Keyboard Manager`, drop it back in from the XRI Spatial Keyboard sample.
- **The keyboard does not open for a specific `TextField`.**  
  Confirm that the field's `name` appears in the bridge's **Text Field Names** list, and that the `TextField` is inside the `UIDocument` attached to the same GameObject as the bridge.
- **The keyboard opens and immediately closes.**  
  This usually happens when `Close Keyboard On Focus Out` is enabled and the user's pointer moves from the `TextField` onto the keyboard. Disable that option so the editing session stays alive while the user is typing.
