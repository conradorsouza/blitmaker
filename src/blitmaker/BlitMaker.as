package blitmaker 
{
	import blitmaker.events.BlitMakerEvents;
	import blitmaker.events.SpriteDataSheetLoaderEvents;
	import blitmaker.events.SpriteLoaderEvents;
	import blitmaker.loader.SpriteDataSheetLoader;
	import blitmaker.loader.SpriteLoader;
	import blitmaker.sprite.BlitSprite;
	import blitmaker.sprite.SpriteSheetData;
	import flash.display.Bitmap;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Conrado Souza 
	 */
	public class BlitMaker extends EventDispatcher
	{
		private var _fps:uint = 24;
		private var _blitSprite:BlitSprite;
		private var _spriteSheet:Bitmap;
		private var _spriteSheetData:SpriteSheetData;
		
		public function BlitMaker(fps:uint) 
		{
			this._fps = fps;
		}
		
		public function loadSpriteSheet(path:String):void
		{
			var spriteLoader:SpriteLoader = new SpriteLoader();
				spriteLoader.addEventListener(SpriteLoaderEvents.SPRITE_LOADED, spriteLoaded);
				spriteLoader.load(path);
				
		}
		
		public function loadSpriteSheetData(path:String):void
		{
			var spriteDataLoader:SpriteDataSheetLoader = new SpriteDataSheetLoader();
				spriteDataLoader.addEventListener(SpriteDataSheetLoaderEvents.DATA_LOADED, spriteDataLoaded);
				spriteDataLoader.load(path);
		}
		
		private function spriteLoaded(e:SpriteLoaderEvents):void 
		{
			buildSpriteSheet(e.bitmap);
		}
		
		private function spriteDataLoaded(e:SpriteDataSheetLoaderEvents):void 
		{
			buildSpriteDataSheet(e.data);
		}
		
		public function addSpriteSheet(buttonSpriteSheet:Bitmap):void 
		{
			buildSpriteSheet(buttonSpriteSheet);
		}
		
		public function addSpriteSheetData(dataSheet:XML):void 
		{
			buildSpriteDataSheet(dataSheet);
		}
		
		private function buildSpriteDataSheet(dataSheet:XML):void
		{
			_spriteSheetData = new SpriteSheetData(dataSheet)
			this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.SPRITEDATA_LOADED));
			
			buildContent();
		}
		
		private function buildSpriteSheet(bitmap:Bitmap):void
		{
			_spriteSheet = bitmap;
			this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.SPRITE_LOADED));
			
			buildContent();
		}
		
		private function buildContent():void 
		{
			if (_spriteSheet && _spriteSheetData)
			{
				this._blitSprite = new BlitSprite(_spriteSheet, _spriteSheetData);
				this._blitSprite.fps = this._fps;
				this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.BLIT_LOADED));
			}
			
		}
				
		public function get blitSprite():BlitSprite { return this._blitSprite; }
	
		
	}

}