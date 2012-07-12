package blitmaker.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteDataCheetLoaderEvents extends Event 
	{
		public static const DATA_LOADED:String = "dataLoaded";
		
		private var _data:XML;
		
		public function SpriteDataCheetLoaderEvents(type:String, data:XML, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this._data = data;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new SpriteDataCheetLoaderEvents(type, _data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SpriteDataCheetLoaderEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get data():XML { return this._data; }
		
	}
	
}