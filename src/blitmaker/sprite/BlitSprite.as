package blitmaker.sprite 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class BlitSprite extends Sprite 
	{
		private var _spriteSheet:SpriteSheet;
		private var _dataFile:SpriteSheetData;
		private var _currentFrame:uint;
		private var _totalFrames:int;
		private var _fps:uint = 24;
		
		
		private var _timer:Timer;
		private var _frameDirection:int = 1;
		
		public function BlitSprite(spriteSheet:SpriteSheet, dataFile:SpriteSheetData) 
		{
			this._spriteSheet = spriteSheet;
			this._dataFile = dataFile;
			this._currentFrame = 0;
			this._totalFrames = dataFile.frame.length;
			
			this._timer = new Timer(this._fps, 0);
			this._timer.addEventListener(TimerEvent.TIMER, changeFrame);
			this._timer.start();			
			
			drawFrame(this._currentFrame);
			this.addChild( spriteSheet.bitmap );
		}
		
		private function changeFrame(e:TimerEvent):void 
		{
			if (this._currentFrame < this._totalFrames-1)
			{
				this._currentFrame += this._frameDirection;
			}
			else
			{
				this._currentFrame = 0;
			}
			
			drawFrame(this._currentFrame);			
		}
		
		private function drawFrame(dataIndex:uint):void 
		{
			var frame:Frame = this._dataFile.frame[dataIndex];
			_spriteSheet.bitmap.scrollRect = frame.rect;
		}
		
		public function stop():void
		{
			_timer.stop();
		}
		
		public function play():void
		{
			_timer.start();
		}
		
		public function get fps():uint { return this._fps; }
		
		
		public function set fps(value:uint):void 
		{
			this._fps = value;
			_timer.delay = 1000 / value;
		
		}
		
	}

}