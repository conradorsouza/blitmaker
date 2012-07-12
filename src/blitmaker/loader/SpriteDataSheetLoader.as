package blitmaker.loader 
{
	import blitmaker.events.SpriteDataSheetLoaderEvents;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteDataSheetLoader extends EventDispatcher
	{
		
		public function SpriteDataSheetLoader() 
		{
			
		}
		
		public function load(path:String):void
		{
			var request:URLRequest = new URLRequest();
				request.url = path;
				
			var spriteLoader:URLLoader = new URLLoader();
				spriteLoader.addEventListener(Event.COMPLETE, spriteLoaded);
				spriteLoader.load(request);
		}
		
		private function spriteLoaded(e:Event):void 
		{
			var data:XML = XML(e.currentTarget.data);
			
			dispatchEvent(new SpriteDataSheetLoaderEvents(SpriteDataSheetLoaderEvents.DATA_LOADED, data));
		}
	}

}