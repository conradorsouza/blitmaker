blitmaker
=========

/**
 * 
 * Copyright (c) 2012 Conrado Souza - conradorsouza@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person 
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, 
 * publish, distribute, sublicense, and/or sell copies of the Software, 
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 * OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 */



BlitMaker
BlitMaker project works with Sparrow/Starling XML for loading positions of the sprite sheet.

This xml can be generated with Flash CS6, TexturePacker, and many other texture sheet makers. 
Compile src/BlitMaker.as to see project running.


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
var dataSheet:XML = XML(new _buttonXML());
var buttonSpriteSheet:Bitmap = new _buttonImage();
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

var dataSheet:XML = XML(new _buttonXML());
var buttonSpriteSheet:Bitmap = new _buttonImage();
_blitSprite = new BlitSprite(buttonSpriteSheet, dataSheet, 30); 




