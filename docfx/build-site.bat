@echo off
echo Building documentation...
docfx build --output ../docs

echo Serving documentation, press CTRL+C to interrupt.
docfx serve ../docs