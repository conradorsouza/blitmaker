package 
{
	import blitmaker.BlitMaker;
	import blitmaker.events.BlitMakerEvents;
	import blitmaker.sprite.BlitSprite;
	import flash.display.Bitmap;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class Main extends Sprite 
	{
		private var _blitMaker:BlitMaker;
		private var _blitSprite:BlitSprite;
		
		[Embed(source="../bin/button.png")]
		private const _buttonImage:Class;
		
		[Embed(source="../bin/button.xml", mimeType="application/octet-stream")]
		private const _buttonXML:Class;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_blitMaker = new BlitMaker(50);
			_blitMaker.addEventListener(BlitMakerEvents.BLIT_LOADED, addToStage);
			
			
			/**Use this if you want to load external assets **//**
			_blitMaker.loadSpriteSheet("http://conradorsouza.github.com/blitmaker/example/button.png");
			_blitMaker.loadSpriteSheetData("http://conradorsouza.github.com/blitmaker/example/button.xml");		
			**/
			
			/** Use this if you want to use embeded assets **/
			var dataSheet:XML = XML(new _buttonXML());
			var buttonSpriteSheet:Bitmap = new _buttonImage();
			
			_blitMaker.addSpriteSheet(buttonSpriteSheet);
			_blitMaker.addSpriteSheetData(dataSheet);
				
		}
		
		private function addToStage(e:BlitMakerEvents):void 
		{
			_blitSprite = e.currentTarget.blitSprite
				
			
			addChild(_blitSprite);
		}
		
	}
	
}