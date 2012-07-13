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
	import blitmaker.events.SpriteDataSheetLoaderEvents;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteDataSheetLoader extends EventDispatcher
	{
		
		public function SpriteDataSheetLoader() 
		{
			
		}
		
		public function load(path:String):void
		{
			var request:URLRequest = new URLRequest();
				request.url = path;
				
			var spriteLoader:URLLoader = new URLLoader();
				spriteLoader.addEventListener(Event.COMPLETE, spriteLoaded);
				spriteLoader.load(request);
		}
		
		private function spriteLoaded(e:Event):void 
		{
			var data:XML = XML(e.currentTarget.data);
			
			dispatchEvent(new SpriteDataSheetLoaderEvents(SpriteDataSheetLoaderEvents.DATA_LOADED, data));
		}
	}

}