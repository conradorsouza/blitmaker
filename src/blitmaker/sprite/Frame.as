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

package blitmaker.sprite 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class Frame extends Object
	{
		
		private var _rect : Rectangle;
		private var _x:Number;
		private var _y:Number;
		private var _index:uint;
		private var _width:Number;
		private var _height:Number;
		private var _label:String;
		private var _frameFunction:Function;
		
		public function Frame() 
		{
			
		}
		
		public function execFrameFunction():void 
		{
			if (this._frameFunction != null)
				this._frameFunction();
		}
		
		public function get index():uint { return this._index; }
		
		public function get label():String { return this._label; }
			
		public function get x():Number { return this._x; }
		
		public function get y():Number { return this._y; }
		
		public function get width():Number { return this._width; }
		
		public function get height():Number { return this._height; }
		
		public function set index(value:uint):void { this._index = value; }

		public function get rect():Rectangle { return this._rect; }
		
		public function set x(value:Number):void { this._x = value; }
		
		public function set y(value:Number):void { this._y = value; }
		
		public function set width(value:Number):void { this._width = value; }
		
		public function set height(value:Number):void { this._height = value; }
				
		public function set rect(value:Rectangle):void { this._rect = value; }
		
		public function set frameFunction(value:Function):void { this._frameFunction = value; }
		
		
		public function set label(value:String):void { this._label = value; }
	}

}