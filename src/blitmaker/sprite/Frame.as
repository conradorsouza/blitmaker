package blitmaker.sprite 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class Frame extends Object
	{
		
		private var _frameID:String;
		private var _index:uint;
		private var _x:Number;
		private var _y:Number;
		private var _width:Number;
		private var _height:Number;
		private var _rect : Rectangle;
		
		public function Frame(index:uint = 0, x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0, frameID:String = "", rect:Rectangle=null) 
		{
			this._index = index;
			this._frameID = frameID;
			this._x = x;
			this._y = y;
			this._width = width;
			this._height = height;
			this._rect = rect
		}
		
		public function get index():uint { return this._index; }
		
		public function get frameID():String { return this._frameID; }
		
		public function get x():Number { return this._x; }
		
		public function get y():Number { return this._y; }
		
		public function get width():Number { return this._width; }
		
		public function get height():Number { return this._height; }
		
		public function set index(value:uint):void { this._index = value; }
		
		public function set x(value:Number):void { this._x = value; }
		
		public function set y(value:Number):void { this._y = value; }
		
		public function set width(value:Number):void { this._width = value; }
		
		public function set height(value:Number):void { this._height = value; }
				
		public function set frameID(value:String):void { this._frameID = value; }
		
		public function get rect():Rectangle { return this._rect; }
		
		public function set rect(value:Rectangle):void { this._rect = value; }
	}

}