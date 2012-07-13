package 
{
	import blitmaker.BlitMaker;
	import blitmaker.events.BlitMakerEvents;
	import blitmaker.sprite.BlitSprite;
	
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
			_blitMaker.loadSpriteSheet("http://conradorsouza.github.com/blitmaker/example/button.png");
			_blitMaker.loadSpriteSheetData("http://conradorsouza.github.com/blitmaker/example/button.xml");		
			
			stage.doubleClickEnabled = true
				
		}
		
		private function addToStage(e:BlitMakerEvents):void 
		{
			_blitSprite = e.currentTarget.blitSprite
				
			
			addChild(_blitSprite);
		}
		
	}
	
}