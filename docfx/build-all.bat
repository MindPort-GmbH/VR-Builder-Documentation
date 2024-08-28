@echo off
echo Building API documentation...
docfx metadata

echo Building documentation...
docfx build --output ../docs

call build-pdf.bat

echo Serving documentation, press CTRL+C to interrupt.
docfx serve ../docs