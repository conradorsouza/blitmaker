/**
 * 
 * Copyright (c) 2012 Conrado Souza - conradorsouza@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person 
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, 
 * publish, distribute, sublicense, and/or sell copies of the Software, 
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 * OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 */

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
					frame.index = i;
					frame.x = currentNode.@x;
					frame.y = currentNode.@y;
					frame.label = currentNode.@name;
					frame.width = currentNode.@width;
					frame.height = currentNode.@height;
					frame.rect = new Rectangle( frame.x, frame.y, frame.width, frame.height );
				
				this._frame.push(frame);
			}
		}
		
		public function getFrame(dataIndex:Object):Frame 
		{
			var frame:Frame;
			
			if (dataIndex is uint)
			{
				frame = this.frame[uint(dataIndex)]
				
			}
			else if ( dataIndex is String )
			{
				
				for (var i:int = 0; i < this._frame.length; i++) 
				{
					if (this._frame[i].label == String(dataIndex))
					{
						frame = this._frame[i];
						break;
					}
					else
					{
						frame = this._frame[0];
					}
				}
			}
			else
			{
				
				frame = this._frame[0];
			}
			
			
			return frame;
		}
		
		public function get frame():Vector.<Frame> { return this._frame; }
		
	}

}