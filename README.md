# VR Builder Documentation

## Installation

1. Pull this repo in a VR Builder Unity project folder (same level as Assets folder).
2. Install Chocolatey Community Individual https://chocolatey.org/install#individual
3. Use DocFX DocFX 2.59.4. At the time of writing, it can be installed from chocolatey running `choco install docfx`.
4. To create PDFs, you also need wkhtmltopdf. Can be installed from chocolatey as well, `choco install wkhtmltopdf`.
5. To build API Metadata, you'll need MSBuild that can be installed from the VS installer.

## Usage

1. Refresh all .csproj files in Unity and ensure the project compiles in Unity. (Note: Using VS Code as editor might result in errors / warnings when generating the API docs. Better switch to VS before regranting.)
2. Run `docfx/build-all.bat` in to build the documentation, generate PDFs for all packages and serve the site to localhost.
3. Ensure that the documentation works as intended in your browser by checking http://localhost:8080/.
4. You can find the generated PDF files in the `pdf/docfx_articles` folder.
5. You can use `build-pdf` or `build-site` to generate only the PDFs or the site, as needed.
6. Once the changes are on the `main` branch, the online documentation will be automatically updated.