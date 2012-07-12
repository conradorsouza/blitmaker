package blitmaker 
{
	import blitmaker.events.BlitMakerEvents;
	import blitmaker.events.SpriteDataCheetLoaderEvents;
	import blitmaker.events.SpriteLoaderEvents;
	import blitmaker.loader.SpriteDataCheetLoader;
	import blitmaker.loader.SpriteLoader;
	import blitmaker.sprite.BlitSprite;
	import blitmaker.sprite.SpriteCheet;
	import blitmaker.sprite.SpriteCheetData;
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
		private var _spriteCheet:SpriteCheet;
		private var _spriteCheetData:SpriteCheetData;
		private var _fps:uint = 24;
		
		public function BlitMaker(fps:uint) 
		{
			this._fps = fps;
		}
		
		public function loadSpriteCheet(path:String):void
		{
			var spriteLoader:SpriteLoader = new SpriteLoader();
				spriteLoader.addEventListener(SpriteLoaderEvents.SPRITE_LOADED, spriteLoaded);
				spriteLoader.load(path);
				
		}
		
		private function spriteLoaded(e:SpriteLoaderEvents):void 
		{
			_spriteCheet = new SpriteCheet(e.bitmapData)
			
			this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.SPRITE_LOADED));
			
			buildContent();
			
		}
		
		public function loadSpriteCheetData(path:String):void
		{
			var spriteDataLoader:SpriteDataCheetLoader = new SpriteDataCheetLoader();
				spriteDataLoader.addEventListener(SpriteDataCheetLoaderEvents.DATA_LOADED, spriteDataLoaded);
				spriteDataLoader.load(path);
				
		}
		
		private function spriteDataLoaded(e:SpriteDataCheetLoaderEvents):void 
		{
			_spriteCheetData = new SpriteCheetData(e.data)
			
			this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.SPRITEDATA_LOADED));
			
			buildContent();
			
		}
		
		private function buildContent():void 
		{
			if (_spriteCheet && _spriteCheetData)
			{
				
				this._blitSprite = new BlitSprite(_spriteCheet, _spriteCheetData);
				this._blitSprite.fps = this._fps;
				this.dispatchEvent(new BlitMakerEvents(BlitMakerEvents.BLIT_LOADED));
			}
			
		}
				
		public function get blitSprite():BlitSprite { return this._blitSprite; }
	
		
	}

}