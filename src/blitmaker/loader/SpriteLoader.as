package blitmaker.loader 
{
	import blitmaker.events.SpriteLoaderEvents;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteLoader extends EventDispatcher
	{
		
		public function SpriteLoader() 
		{
			
		}
		
		public function load(path:String):void
		{
			var request:URLRequest = new URLRequest();
				request.url = path;
				
			var spriteLoader:Loader = new Loader();
				spriteLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, spriteLoaded);
				spriteLoader.load(request);
		}
		
		private function spriteLoaded(e:Event):void 
		{
			var bitmap:Bitmap = e.target.content as Bitmap;			
			dispatchEvent(new SpriteLoaderEvents(SpriteLoaderEvents.SPRITE_LOADED, bitmap));
		}
		
	}

}