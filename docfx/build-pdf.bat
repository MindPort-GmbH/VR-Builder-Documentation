@echo off
del pdf\docfx_articles\*.pdf

echo Building VR Builder manual...
docfx pdf docfx.json
ren pdf\docfx_articles\core.pdf VR-Builder-Manual.pdf
