## Updating

To update to a new version of VR Builder, it is recommended to remove the package before importing the new one. It is also good practice to backup/commit your project before updating the package.

Removing the old package is necessary in order to ensure that obsolete files are removed. When an Asset Store package is updated, it only adds new files and updates the existing ones - no files are removed, which could result in redundant or conflicting code.

To remove the asset, open the Package Manager and show the packages in the project. Find VR Builder and click `Remove`. You can then import the new package from the Package Manager.

    Note: The demo processes might have changed in the updated version of the package. If you plan to use the demo scenes, ensure to delete the demo processes from the StreamingAssets/Processes folder before importing the new package.

### Upgrading to major versions

Major VR Builder releases are usually not completely compatible with the previous version. Updating to them requires extra care, and is not recommended in production unless you need some of the new features. The specifics can vary depending on the release, and we will provide detailed upgrade guides when necessary. You can find the guide to upgrade to the latest version (VR Builder 4) from version 3 [here](https://www.mindport.co/vr-builder-tutorials/update-vr-builder).