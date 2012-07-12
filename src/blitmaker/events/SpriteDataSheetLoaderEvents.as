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