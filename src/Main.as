package 
{
	import blitmaker.BlitMaker;
	import blitmaker.events.BlitMakerEvents;
	import blitmaker.sprite.BlitSprite;
	import flash.display.Sprite;
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
			
			_blitMaker = new BlitMaker(50);
			_blitMaker.addEventListener(BlitMakerEvents.BLIT_LOADED, addToStage);
			_blitMaker.loadSpriteSheet("button.png");
			_blitMaker.loadSpriteSheetData("button.xml");		
			
			stage.doubleClickEnabled = true
				
		}
		
		private function addToStage(e:BlitMakerEvents):void 
		{
			_blitSprite = e.currentTarget.blitSprite
				
			
			addChild(_blitSprite);
		}
		
	}
	
}