## Customizing the Process Controller

The process controller can be configured on the `[PROCESS_CONTROLLER]` game object in a VR Builder scene. This object
handles running the process and a few configuration parameters. The `Process Controller Setup` script lets you choose
which process controller prefab is spawned when the scene runs.

![Process Controller Setup](images/process-controller-setup.png)

It is possible to select one of the default process controller prefabs, or use a custom one by ticking the
`Use custom prefab` box. It is also possible to select whether to auto start the process, or start it manually, for
example through one of the menus provided in this add-on.

Both default process controllers automatically start the process when the scene runs. If you want to avoid that, so the
process can be started from the menu, you'll have to create a custom process controller prefab. You can use one of the
default ones found in
`Assets\MindPort\VR Builder\Core\Source\Basic-UI-Component\Runtime\ProcessController\Resources\Prefabs` as a baseline.

The `Basic Process Loader` component ensures the process runs on scene start. To prevent this behavior, do not include
this script in your custom controller.
