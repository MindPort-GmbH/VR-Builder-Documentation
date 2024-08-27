@echo off
echo BUILDING DOCUMENTATION...
docfx build --output ../docs

echo CREATING PDF FILES...
docfx pdf

echo SERVING DOCUMENTATION, PRESS CTRL+C TO INTERRUPT.
docfx serve ../docs