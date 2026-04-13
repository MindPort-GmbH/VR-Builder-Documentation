# VR Builder Documentation Agent Guide

## Purpose
This repository contains documentation for the VR Builder Unity plugin ecosystem:
- Core package: `co.mindport.vrbuilder.core`
- Pro extension: `co.mindport.vrbuilder.pro`
- Additional add-ons in the `co.mindport.vrbuilder.*` namespace

## Repository Layout
```text
[Repository Root]
├── docfx/                       # Source of truth for documentation.
│   ├── articles/                # Manual content (`.md`) and table of contents files (`toc.yml`).
│   ├── templates/               # DocFX templates, including the PDF template.
│   ├── docfx.json               # Main DocFX config (site build + Core PDF config).
│   ├── docfx-pro.json           # Pro PDF config.
│   ├── build-*.bat              # Canonical build scripts.
│   └── pdf/                     # Generated PDF output.
├── docs/                        # Generated HTML output published via GitHub Pages.
```

## Non-Negotiable Rules
1. Do not manually edit files in `docs/`.
2. Do not manually edit generated PDFs in `docfx/pdf/docfx_articles/`.
3. Make documentation changes in `docfx/articles/`, `docfx/*.json`, `docfx/toc.yml`, or template files.
4. Regenerate outputs using the build scripts when output changes are needed.
5. Keep Core and Pro documentation separated correctly (Core in `articles/core`, Pro and add-ons in `articles/pro` or their dedicated subtree).

## Build Prerequisites
- This repository must be placed inside a VR Builder Unity project folder so API metadata can be resolved.
- Required tools:
  - DocFX 2.59.4
  - `wkhtmltopdf` (required for PDF generation)
- Unity project should have generated project files and XML docs for VR Builder assemblies.

## Build Workflow
Run from `docfx/` or call the scripts via relative path from repo root.

- Build site only:
  - `docfx\\build-site.bat`
  - Generates API metadata and HTML site to `docs/`, then serves locally.
- Build PDFs only:
  - `docfx\\build-pdf.bat`
  - Generates:
    - `docfx/pdf/docfx_articles/VR-Builder-Manual.pdf`
    - `docfx/pdf/docfx_articles/VR-Builder-Pro-Manual.pdf`
- Build all:
  - `docfx\\build-all.bat`
  - Runs metadata + site build + PDF build + local serve.

## Authoring Guidance
- Add or update manual pages under `docfx/articles/...`.
- Keep relevant `toc.yml` files in sync when adding/moving pages.
- Store article images under the matching `docfx/articles/**/images/` subtree.
- API docs are generated from Unity assemblies/projects; do not hand-author API HTML.

## Validation Checklist
1. Run the appropriate build script(s) successfully.
2. Verify site rendering and navigation at `http://localhost:8080/`.
3. Confirm Core and Pro manuals generate with expected filenames.
4. Check that links, images, and TOC entries resolve.
