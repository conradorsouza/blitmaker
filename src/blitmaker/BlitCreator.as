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

package blitmaker 
{
	import blitmaker.events.BlitCreatorEvents;
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
	public class BlitCreator extends EventDispatcher
	{
		private var _fps:uint = 24;
		private var _blitSprite:BlitSprite;
		private var _spriteSheet:Bitmap;
		private var _spriteSheetData:XML;
		
		public function BlitCreator(fps:uint) 
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
			_spriteSheetData = dataSheet;
			this.dispatchEvent(new BlitCreatorEvents(BlitCreatorEvents.SPRITEDATA_LOADED));
			
			buildContent();
		}
		
		private function buildSpriteSheet(bitmap:Bitmap):void
		{
			_spriteSheet = bitmap;
			this.dispatchEvent(new BlitCreatorEvents(BlitCreatorEvents.SPRITE_LOADED));
			
			buildContent();
		}
		
		private function buildContent():void 
		{
			if (_spriteSheet && _spriteSheetData)
			{
				this._blitSprite = new BlitSprite(_spriteSheet, _spriteSheetData);
				this._blitSprite.fps = this._fps;
				this.dispatchEvent(new BlitCreatorEvents(BlitCreatorEvents.BLIT_LOADED));
			}
			
		}
				
		public function get blitSprite():BlitSprite { return this._blitSprite; }
	
		
	}

}