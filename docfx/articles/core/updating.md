## Updating

To update to a new version of VR Builder, it is recommended to remove the package before importing the new one. It is also good practice to backup/commit your project before updating the package.

Removing the old package is necessary in order to ensure that obsolete files are removed. When an Asset Store package is updated, it only adds new files and updates the existing ones - no files are removed, which could result in redundant or conflicting code.

To remove the asset, open the Package Manager and show the packages in the project. Find VR Builder and click `Remove`. You can then import the new package from the Package Manager.

    Note: The demo processes might have changed in the updated version of the package. If you plan to use the demo scenes, ensure to delete the demo processes from the StreamingAssets/Processes folder before importing the new package, or the existing process files will not be overwritten.

### Upgrading to major versions

Major VR Builder releases are usually not completely compatible with the previous version. Updating to them requires extra care, and is not recommended in production unless you need some of the new features. The specifics can vary depending on the release, and we will provide detailed upgrade guides when necessary. In particular, VR Builder 5 represents a clean cut with the past as it introduces support for Unity 6, XRI 3 and URP. Currently, it is not possible to automatically upgrade a project created with VR Builder 4 to version 5. If you need to do so, [contact us](mailto:contact@mindport.co) and we will support you with the matter.