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

package blitmaker.events 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteLoaderEvents extends Event 
	{
		public static const SPRITE_LOADED:String = "spriteLoaded";
		
		private var _bitmap:Bitmap;
		
		public function SpriteLoaderEvents(type:String, bitmap:Bitmap=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this._bitmap = bitmap;
			super(type, bubbles, cancelable);			
		} 
		
		public override function clone():Event 
		{ 
			return new SpriteLoaderEvents(type, bitmap, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SpriteLoaderEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get bitmap():Bitmap { return this._bitmap; }
		
	}
	
}