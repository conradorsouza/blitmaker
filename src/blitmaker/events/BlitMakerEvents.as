package blitmaker.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class BlitMakerEvents extends Event 
	{
		
		public static const SPRITE_LOADED:String = "spriteLoaded";
		public static const SPRITEDATA_LOADED:String = "spriteDataLoaded";
		static public const BLIT_LOADED:String = "blitLoaded";
		
		public function BlitMakerEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new BlitMakerEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BlitMakerEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}