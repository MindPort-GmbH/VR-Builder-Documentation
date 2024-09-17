@echo off
del pdf\docfx_articles\*.pdf

echo Building VR Builder manual...
docfx pdf docfx.json
ren pdf\docfx_articles\core.pdf VR-Builder-Manual.pdf

echo Building Animations manual...
docfx pdf docfx-animations.json
ren pdf\docfx_articles\animations.pdf Animations-for-VR-Builder-Manual.pdf

echo Building Menus manual...
docfx pdf docfx-menus.json
ren pdf\docfx_articles\process-menu.pdf Menus-for-VR-Builder-Manual.pdf

echo Building Randomization manual...
docfx pdf docfx-randomization.json
ren pdf\docfx_articles\randomization.pdf Randomization-for-VR-Builder-Manual.pdf

echo Building States and Data manual...
docfx pdf docfx-statesanddata.json
ren pdf\docfx_articles\states-and-data.pdf States-and-Data-for-VR-Builder-Manual.pdf

echo Building Track and Measure manual...
docfx pdf docfx-trackandmeasure.json
ren pdf\docfx_articles\track-and-measure.pdf Track-and-Measure-for-VR-Builder-Manual.pdf
