package blitmaker.sprite 
{
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteCheetData extends Object
	{
		private var _data:XML;
		private var _frame:Vector.<Frame>
		private var _length:uint;
		public function SpriteCheetData(data:XML) 
		{
			this._data = data;
			this._frame = new Vector.<Frame>();
			this._length = this._data.SubTexture.length();
	
			for (var i:int = 0; i < this._length; i++) 
			{
				var frame:Frame = new Frame();
					frame.index = i;
					frame.frameID = this._data.SubTexture[i].@name;
					frame.x = this._data.SubTexture[i].@x;
					frame.y = this._data.SubTexture[i].@y;
					frame.width = this._data.SubTexture[i].@width;
					frame.height = this._data.SubTexture[i].@height;
				
				this._frame.push(frame);
			}
		}
		
		public function get frame():Vector.<Frame> { return this._frame; }
		
	}

}