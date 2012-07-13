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

		private var _blitBuildingSprite:BlitSprite;
	
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			var dataSheetBuildings:XML = XML(new _buildingsXML());
			var buttonSpriteSheetBuildings:Bitmap = new _buildingsImage();
			_blitBuildingSprite = new BlitSprite(buttonSpriteSheetBuildings, new SpriteSheetData(dataSheetBuildings), 30); 
			
			addChild(_blitBuildingSprite);
			
			_blitBuildingSprite.x = 300;
			_blitBuildingSprite.y = 100;
		}

	}
	
}