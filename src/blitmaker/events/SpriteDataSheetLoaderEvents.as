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
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteDataSheetLoaderEvents extends Event 
	{
		public static const DATA_LOADED:String = "dataLoaded";
		
		private var _data:XML;
		
		public function SpriteDataSheetLoaderEvents(type:String, data:XML, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this._data = data;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new SpriteDataSheetLoaderEvents(type, _data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SpriteDataSheetLoaderEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get data():XML { return this._data; }
		
	}
	
}