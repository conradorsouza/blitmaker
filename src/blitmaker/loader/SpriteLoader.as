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

package blitmaker.loader 
{
	import blitmaker.events.SpriteLoaderEvents;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteLoader extends EventDispatcher
	{
		
		private var _request:URLRequest;
		private var _spriteLoader:Loader;
		
		public function SpriteLoader() 
		{
			
		}
		
		public function load(path:String):void
		{
			this._request = new URLRequest();
			this._request.url = path;
			
			this._spriteLoader = new Loader();
			this._spriteLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, spriteLoaded);
			this._spriteLoader.load( this._request );
		}
		
		private function spriteLoaded(e:Event):void 
		{
			dispatchEvent(new SpriteLoaderEvents(SpriteLoaderEvents.SPRITE_LOADED, e.target.content as Bitmap));
		}
		
		private function dispose():void
		{
			this._spriteLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, spriteLoaded);
			this._spriteLoader.unloadAndStop();
			this._spriteLoader = null;
			
			this._request = null;
		}
		
	}

}