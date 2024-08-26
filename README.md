# VR Builder Documentation

## Installation

1. Use DocFX DocFX 2.59.4. At the time of writing, it can be installed from chocolatey running `choco install docfx`.
2. To create PDFs, you also need wkhtmltopdf. Can be installed from chocolatey as well, `choco install wkhtmltopdf`.

## Usage

1. Pull this repo in a VR Builder Unity project folder (same level as Assets folder).
2. Refresh all .csproj files in Unity and ensure the project compiles in Unity.
3. Run `docfx build --output ../docs` to build the documentation.
4. Run `docfx serve ../docs` to ensure the documentation works as intended in your browser.
5. Run `docfx pdf` to generate pdf files of the documentation. These can be found in the `pdf` folder.
6. Once the changes are on the `main` branch, the online documentation will be automatically updated.