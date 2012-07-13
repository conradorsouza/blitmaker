blitmaker
=========

BlitMaker

Compile Main.as to see project running.


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

_blitMaker = new BlitMaker(30);
var dataSheet:XML = XML(new _buttonXML());
var buttonSpriteSheet:Bitmap = new _buttonImage();
_blitMaker.addEventListener(BlitMakerEvents.BLIT_LOADED, addToStage);
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
_blitSprite = new BlitSprite(buttonSpriteSheet, new SpriteSheetData(dataSheet), 30); 




