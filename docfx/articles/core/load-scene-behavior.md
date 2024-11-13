### Load Scene

#### Description

The Load Scene behavior loads a new scene, either additively or not.
If a scene is loaded additively, it should not contain a VR Builder process as that could interfere with the process
running in the main scene. It still can contain process scene objects which can be interacted with.
If a scene is loaded non-additively, this behavior will effectively interrupt the process as the current scene is
unloaded and a new one is loaded.

#### Configuration

- **Scene to load**

  Select the scene to be loaded from this dropdown. Note that the scene needs to be added to the Build Settings in order
  to show in the dropdown. The scene is serialized by path in the process JSON, so moving or renaming it might break
  this parameter.

- **Load additively**

  If checked, the scene will be loaded additively and the process will keep running. If unchecked, the current scene
  will be unloaded and thus interrupt the current process.

- **Load asynchronously**

  If checked, the scene will be loaded asynchronously. This can result in smoother performance while loading. A scene is
  loaded synchronously in the Start phase of the activating process, while asynchronous loading will happen in the
  Update phase.
