package 
{
	import blitmaker.BlitMaker;
	import blitmaker.events.BlitMakerEvents;
	import blitmaker.sprite.BlitSprite;
	import blitmaker.sprite.SpriteSheetData;
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
		
		[Embed(source="../bin/buildings.png")]
		private const _buildingsImage:Class;
		
		[Embed(source="../bin/buildings.xml", mimeType="application/octet-stream")]
		private const _buildingsXML:Class;
		
		
		
		private var _blitMaker:BlitMaker;
		private var _blitBuildingSprite:BlitSprite;
		
		
		
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
			/**Use this if you want to load external assets **/
			//
			//_blitMaker = new BlitMaker(30);
			//_blitMaker.addEventListener(BlitMakerEvents.BLIT_LOADED, addToStage);
			//_blitMaker.loadSpriteSheet("http://conradorsouza.github.com/blitmaker/example/button.png");
			//_blitMaker.loadSpriteSheetData("http://conradorsouza.github.com/blitmaker/example/button.xml");	
			
			
			
			/** Use this if you want to use embeded assets **/
			//
			//_blitMaker = new BlitMaker(30);
			//var dataSheet:XML = XML(new _buildingsXML());
			//var buttonSpriteSheet:Bitmap = new _buildingsImage();
			//_blitBuildingSprite.addEventListener(BlitMakerEvents.BLIT_LOADED, addToStage);
			//_blitBuildingSprite.addSpriteSheet(buttonSpriteSheet);
			//_blitBuildingSprite.addSpriteSheetData(dataSheet);
			
			

			/** You can directly create a BlitSprite if you need.*/
			var dataSheetBuildings:XML = XML(new _buildingsXML());
			var buttonSpriteSheetBuildings:Bitmap = new _buildingsImage();
			_blitBuildingSprite = new BlitSprite(buttonSpriteSheetBuildings, new SpriteSheetData(dataSheetBuildings), 30); 
			
			addChild(_blitBuildingSprite);
			
			_blitBuildingSprite.x = 300;
			_blitBuildingSprite.y = 100;
		}

		private function addToStage(e:BlitMakerEvents):void 
		{
			_blitBuildingSprite = e.currentTarget.blitSprite
			addChild(_blitBuildingSprite);
		}
		
	}
	
}