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
	public class SpriteCheet extends Object
	{
		private var _bitmapData:BitmapData;
		
		public function SpriteCheet(bitmapData:BitmapData) 
		{
			this._bitmapData = bitmapData;
		}
		
		public function readPixels(frame:Frame):Bitmap 
		{

			var data:BitmapData = new BitmapData(frame.width, frame.height, true);
				data.copyPixels(this._bitmapData, new Rectangle(frame.x, frame.y, frame.width, frame.height), new Point(0, 0));
							
			return new Bitmap(data);;
		}
		
		public function get bitmapData():BitmapData { return this._bitmapData; }
		
	}

}