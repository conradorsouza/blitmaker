package blitmaker.sprite 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteSheet extends Object
	{
		private var _bitmap:Bitmap;
		
		public function SpriteSheet(bitmap:Bitmap) 
		{
			this._bitmap = bitmap;
		}
		
		public function get bitmap():Bitmap { return this._bitmap; }
		
	}

}