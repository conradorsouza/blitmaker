package blitmaker.events 
{
	import flash.display.BitmapData;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteLoaderEvents extends Event 
	{
		public static const SPRITE_LOADED:String = "spriteLoaded";
		
		private var _bitmapData:BitmapData;
		
		public function SpriteLoaderEvents(type:String, bitmapData:BitmapData=null ,bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_bitmapData = bitmapData;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new SpriteLoaderEvents(type, bitmapData, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SpriteLoaderEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get bitmapData():BitmapData { return this._bitmapData; }
		
		public function set bitmapData(value:BitmapData):void { this._bitmapData = value; }
		
	}
	
}