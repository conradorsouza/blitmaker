package blitmaker.sprite 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class SpriteSheetData extends Object
	{
		private var _data:XML;
		private var _frame:Vector.<Frame>
		private var _length:uint;
		
		public function SpriteSheetData(data:XML) 
		{
			this._data = data;
			this._frame = new Vector.<Frame>();
			this._length = this._data.SubTexture.length();
			
			var currentNode:XML;
			
			for (var i:int = 0; i < this._length; i++) 
			{
				currentNode = this._data.SubTexture[i];
				
				var frame:Frame = new Frame();
					frame.x = currentNode.@x;
					frame.y = currentNode.@y;
					frame.index = i;
					frame.width = currentNode.@width;
					frame.height = currentNode.@height;
					frame.frameID = currentNode.@name;
					frame.rect = new Rectangle( frame.x, frame.y, frame.width, frame.height );
				
				this._frame.push(frame);
			}
		}
		
		public function get frame():Vector.<Frame> { return this._frame; }
		
	}

}