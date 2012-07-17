Blitmaker

=========
<pre>
Copyright (c) 2012 Conrado Souza - conradorsouza@gmail.com

Permission is hereby granted, free of charge, to any person 
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, 
publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</pre>


BlitMaker
BlitMaker project works with Sparrow/Starling XML for loading positions of the sprite sheet.

BlitMaker is a actionscript3 framework that was created to make blitting easy.

This xml can be generated with Flash CS6, TexturePacker, and many other texture sheet makers. 
Compile src/BlitMaker.as to see project running.

BlitSprite can support the following functionalities(very similar to a MovieClip).

Frames index starts at 0.

Methods:<br />
gotoAndPlay: go to a frame and make animation continue from it. Working with frame numbers and labels<br />
gotoAndStop: go to a frame and stops animation on it. Working with frame numbers and labels<br />
addFrameScript: add a function to a frame. Working with frame numbers and labels<br />
play: stats animation instantly<br />
stop: stops animation instantly<br />
<br />
Getters and Setters<br />
totalFrames: read-only. Read the total number of frames.<br />
currentFrame: read-only. Reads the current frame index.<br />
fps: read-write. Read or write current fps value, it changes the animation speed on runtime.<br />


=========
How to use

/**Use this if you want to load external assets **/

_blitMaker = new BlitMaker(30);
_blitMaker.addEventListener(BlitMakerEvents.BLIT_LOADED, addToStage);
_blitMaker.loadSpriteSheet("http://conradorsouza.github.com/blitmaker/example/button.png");
_blitMaker.loadSpriteSheetData("http://conradorsouza.github.com/blitmaker/example/button.xml");	

private function addToStage(e:BlitMakerEvents):void 
{
	_blitSprite = e.currentTarget.blitSprite
	addChild(_blitSprite);
}

===============================================================

/** Use this if you want to use embeded assets **/

_blitMaker = new BlitCreator(30);

[Embed(source="../bin/buildings.png")]
private const _buildingsImage:Class;
[Embed(source="../bin/buildings.xml", mimeType="application/octet-stream")]
private const _buildingsXML:Class;

var dataSheet:XML = XML(new _buildingsXML());
var buttonSpriteSheet:Bitmap = new _buildingsImage();
_blitMaker.addEventListener(BlitCreatorEvents.BLIT_LOADED, addToStage);
_blitMaker.addSpriteSheet(buttonSpriteSheet);
_blitMaker.addSpriteSheetData(dataSheet);

private function addToStage(e:BlitMakerEvents):void 
{
	_blitSprite = e.currentTarget.blitSprite
	addChild(_blitSprite);
}

===============================================================

/** You can directly create a BlitSprite if you need.*/

[Embed(source="../bin/buildings.png")]
private const _buildingsImage:Class;
[Embed(source="../bin/buildings.xml", mimeType="application/octet-stream")]
private const _buildingsXML:Class;

var dataSheet:XML = XML(new _buildingsXML());
var buttonSpriteSheet:Bitmap = new _buildingsImage();
_blitSprite = new BlitSprite(buttonSpriteSheet, dataSheet, 30); 
addChild(_blitSprite);




