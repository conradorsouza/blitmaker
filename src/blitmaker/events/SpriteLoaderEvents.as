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
			_bitmap = bitmap;
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