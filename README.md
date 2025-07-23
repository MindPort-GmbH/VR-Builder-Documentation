<h1 align="center">VR Builder Documentation</h1>

<p align="center">
    <img src="https://github.com/user-attachments/assets/c8d8ae7e-8369-4d00-9ab1-16159dd1bd6c" alt="vr builder logo" height="200px"/>
    <br>
    <em><span><b>VR</b> <b>Builder</b> is an open source toolkit that lets you create <b>VR</b> applications without prior experience.
    <br>
    It supports all major <b>VR</b> headsets, has a graphical workflow editor, and offers various integrations.</span></em>
    <br>
</p>

<p align="center">
    <a href="https://www.mindport.co/vr-builder"><strong>VR Builder</strong></a>
    <br>
</p>

<p align="center">
    <a href="https://github.com/MindPort-GmbH/VR-Builder-Documentation/issues?q=">Submit an Issue</a>
    ·
    <a href="https://www.mindport.co/blog">Blog</a>
    <br>
    <br>
</p>

<p align="center">
    <a href="https://openupm.com/packages/co.mindport.vrbuilder.core/" title="Download VR Builder over GitHub OpenUPM" target="_blank"><img alt="OpenUPM Badge" src="https://img.shields.io/npm/v/co.mindport.vrbuilder.core?label=openupm&amp;registry_uri=https://package.openupm.com"/></a>
    <a href="https://github.com/MindPort-GmbH/VR-Builder/releases" title="Download VR Builder over GitHub" target="_blank"><img alt="Static download badge" src="https://img.shields.io/github/downloads/MindPort-GmbH/VR-Builder/total.svg"></a>
    <a href="https://github.com/MindPort-GmbH/VR-Builder-Documentation/issues?q=is%3Aopen" title="Show issues for VR Builder Documentation" target="_blank"><img alt="Open issue badge" src="https://img.shields.io/github/issues/MindPort-GmbH/VR-Builder-Documentation"></a>
    <a href="https://discord.com/invite/aUdwRRPgrK" title="Join the community of VR Builder" target="_blank"><img alt="Discord conversation badge" src="https://img.shields.io/discord/861482616539578378"></a>
</p>

## Contribute

To contribute, go to the [Documentation](https://mindport-gmbh.github.io/VR-Builder-Documentation/articles/core/introduction.html), navigate to the page you want to fix, and click on `Improve this Doc`. GitHub will guide you through the following steps:

1. Fork the repository  
2. Edit and commit your changes  
3. Create a pull request 🎉

## Installation

1. Pull this repo in a VR Builder Unity project folder (same level as Assets folder).
2. Install Chocolatey Community Individual https://chocolatey.org/install#individual
3. Use DocFX DocFX 2.59.4. At the time of writing, it can be installed from chocolatey running `choco install docfx`.
4. To create PDFs, you also need wkhtmltopdf. Can be installed from chocolatey as well, `choco install wkhtmltopdf`.
5. To build API Metadata, you'll need MSBuild that can be installed from the VS installer.

## Usage

1. Refresh all .csproj files in Unity and ensure the project compiles in Unity. (Note: Using VS Code as editor might result in errors / warnings when generating the API docs. Better switch to VS before regranting.)
2. Run `docfx/build-all.bat` in to build the documentation, generate PDFs for all packages, and serve the site to localhost.
3. Ensure that the documentation works as intended in your browser by checking http://localhost:8080/.
4. You can find the generated PDF files in the `pdf/docfx_articles` folder.
5. You can use `build-pdf` or `build-site` to generate only the PDFs or the site, as needed.
6. Once the changes are on the `main` branch, the online documentation will be automatically updated.
