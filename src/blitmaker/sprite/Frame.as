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
		private var _frameID:String;
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
		
		public function get frameID():String { return this._frameID; }
		
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
				
		public function set frameID(value:String):void { this._frameID = value; }

		public function set rect(value:Rectangle):void { this._rect = value; }
		
		public function set frameFunction(value:Function):void { this._frameFunction = value; }
	}

}