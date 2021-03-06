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
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class BlitSprite extends Sprite 
	{

		private var _timer:Timer;
		private var _dataFile:SpriteSheetData;
		private var _spriteSheet:Bitmap;

		private var _fps:uint = 24;
		private var _totalFrames:uint;
		private var _currentFrame:uint;
		private var _frameDirection:int = 1;
		
		/**
		 * 
		 * @param spriteSheet:Bitmap
		 * Bitmap source from the animation sheet
		 * 
		 * @param dataFile:XML
		 * XML File that contains animation data
		 * 
		 * @param fps:uint
		 * Animation FPS Value
		 */		
		public function BlitSprite(spriteSheet:Bitmap, dataFile:XML, fps:uint = 24) 
		{
			this._fps = fps;
			this._dataFile = new SpriteSheetData(dataFile);
			this._spriteSheet = new Bitmap(spriteSheet.bitmapData);
			this._totalFrames = this._dataFile.frame.length;
			this._currentFrame = 0;
			
			this._timer = new Timer(1000/this._fps, 0);
			this._timer.addEventListener(TimerEvent.TIMER, changeFrame);
			this._timer.start();			

			this.addChild( this._spriteSheet );
			drawFrame(this._currentFrame);
		}
		
		private function changeFrame(e:TimerEvent = null):void 
		{
			drawFrame(this._currentFrame);

			if (this._currentFrame < this._totalFrames-1)
			{
				this._currentFrame += this._frameDirection;
			}
			else
			{
				this._currentFrame = 0;
			}
		}
		
		/**
		 * @param frameNumber:Object Destination frame number. Can be a uint or a String
		 */		
		public function gotoAndStop(frame:Object):void
		{
			if(this._timer.running)
				this._timer.stop();
				
			var desiredFrameIndex:uint 
			var totalFrames:uint = this._totalFrames-1
			
			desiredFrameIndex = this._dataFile.getFrame(frame).index
			this._currentFrame = desiredFrameIndex >= totalFrames ? 0 : desiredFrameIndex;
						
			changeFrame();
		}
		
		/**
		 * @param frameNumber:Object Destination frame number. Can be a uint or a String
		 */		
		public function gotoAndPlay(frame:Object):void
		{
			var desiredFrameIndex:uint
			var totalFrames:uint = this._totalFrames-1
			
			desiredFrameIndex = this._dataFile.getFrame(frame).index
			this._currentFrame = desiredFrameIndex >= totalFrames ? 0 : desiredFrameIndex;
			
			if(!this._timer.running)
				this._timer.start();
				
			changeFrame();
		}
		
		private function drawFrame(dataIndex:Object):void 
		{
			var frame:Frame	
				frame = this._dataFile.getFrame(dataIndex);
						
			frame.execFrameFunction();
				
			this.width = frame.width;
			this.height = frame.height;
			this._spriteSheet.scrollRect = frame.rect;
		}
		
		/**
		 * @param frame:Object Desired frame to dispatch a custom function. Can be a uint or a String
		 * @param method:Function Function that is going to be executed when it reaches the desired frame
		 */		
		public function addFrameScript(frame:Object, method:Function):void
		{
			this._dataFile.getFrame(frame).frameFunction = method;
		}
		
		/**
		 *@exampleText Stops animation 
		 */		
		public function stop():void
		{
			this._timer.stop();
		}
		
		/**
		 *@exampleText Starts animation 
		 */		
		public function play():void
		{
			this._timer.start();
		}
		
		/**
		 * @return Return the current FPS value
		 */		
		public function get fps():uint { return this._fps; }
		
		/**
		 * @param value:uint Set a new FPS value for the animation
		 */		
		public function set fps(value:uint):void 
		{
			this._fps = value;
			this._timer.delay = 1000 / value;
		}
		
		/**
		 * @return Reads the current frame index
		 */		
		public function get currentFrame():uint { return this._currentFrame; }
		
		public function get totalFrames():uint { return this._totalFrames; }
		
	}

}