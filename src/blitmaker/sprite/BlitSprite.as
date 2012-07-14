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
		private var _fps:uint = 24;
		private var _dataFile:SpriteSheetData;
		private var _totalFrames:int;
		private var _spriteSheet:Bitmap;
		private var _currentFrame:uint;
		
		
		private var _timer:Timer;
		private var _frameDirection:int = 1;
		
		public function BlitSprite(spriteSheet:Bitmap, dataFile:XML, fps:uint = 24) 
		{
			this._fps = fps;
			this._dataFile = new SpriteSheetData(dataFile);
			this._spriteSheet = spriteSheet;
			this._totalFrames = this._dataFile.frame.length;
			this._currentFrame = 0;
			
			this._timer = new Timer(1000/this._fps, 0);
			this._timer.addEventListener(TimerEvent.TIMER, changeFrame);
			this._timer.start();			
			
			drawFrame(this._currentFrame);

			this.addChild( spriteSheet );
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
		
		public function gotoAndStop(frameNumber:uint):void
		{
			this._currentFrame = frameNumber >= this._totalFrames-1 ? 0 : frameNumber;
			
			if(this._timer.running)
				this._timer.stop();
			
			changeFrame();
		}
		
		public function gotoAndPlay(frameNumber:uint):void
		{
			this._currentFrame = frameNumber >= this._totalFrames-1 ? 0 : frameNumber;
			
			if(!this._timer.running)
				this._timer.start();
				
			changeFrame();
		}
		
		private function drawFrame(dataIndex:uint):void 
		{
			var frame:Frame = this._dataFile.frame[dataIndex];
				frame.execFrameFunction();
				
			this._spriteSheet.scrollRect = frame.rect;
		}
		
		public function addFrameScript(frame:uint, method:Function):void
		{
			this._dataFile.frame[frame].frameFunction = method;
		}
		
		public function stop():void
		{
			this._timer.stop();
		}
		
		public function play():void
		{
			this._timer.start();
		}
		
		public function get fps():uint { return this._fps; }
		
		public function set fps(value:uint):void 
		{
			this._fps = value;
			this._timer.delay = 1000 / value;
		}
		
		public function get currentFrame():uint { return this._currentFrame; }
		
	}

}