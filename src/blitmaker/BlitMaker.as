package blitmaker 
{
	import blitmaker.events.BlitMakerEvents;
	import blitmaker.events.SpriteDataSheetLoaderEvents;
	import blitmaker.events.SpriteLoaderEvents;
	import blitmaker.loader.SpriteDataSheetLoader;
	import blitmaker.loader.SpriteLoader;
	import blitmaker.sprite.BlitSprite;
	import blitmaker.sprite.SpriteSheet;
	import blitmaker.sprite.SpriteSheetData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Conrado Souza 
	 */
	public class BlitMaker extends EventDispatcher
	{
		private var _blitSprite:BlitSprite;
		private var _spriteSheet:SpriteSheet;
		private var _spriteSheetData:SpriteSheetData;
		private var _fps:uint = 24;
		
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
		
		private function spriteLoaded(e:SpriteLoaderEvents):void 
		{
			_spriteSheet = new SpriteSheet(e.bitmapData)
			
			this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.SPRITE_LOADED));
			
			buildContent();
			
		}
		
		public function loadSpriteSheetData(path:String):void
		{
			var spriteDataLoader:SpriteDataSheetLoader = new SpriteDataSheetLoader();
				spriteDataLoader.addEventListener(SpriteDataSheetLoaderEvents.DATA_LOADED, spriteDataLoaded);
				spriteDataLoader.load(path);
				
		}
		
		private function spriteDataLoaded(e:SpriteDataSheetLoaderEvents):void 
		{
			_spriteSheetData = new SpriteSheetData(e.data)
			
			this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.SPRITEDATA_LOADED));
			
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