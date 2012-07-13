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
		
		public function BlitSprite(spriteSheet:Bitmap, dataFile:SpriteSheetData, fps:uint = 24) 
		{
			this._fps = fps;
			this._dataFile = dataFile;
			this._spriteSheet = spriteSheet;
			this._totalFrames = dataFile.frame.length;
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