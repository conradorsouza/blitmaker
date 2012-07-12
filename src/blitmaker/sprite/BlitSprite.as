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
		private var _spriteCheet:SpriteCheet;
		private var _dataFile:SpriteCheetData;
		private var _currentFrame:uint;
		private var _totalFrames:int;
		private var _fps:uint = 24;
		
		
		private var _timer:Timer;
		private var _frameDirection:int = 1;
		
		public function BlitSprite(spriteCheet:SpriteCheet, dataFile:SpriteCheetData) 
		{
			this._spriteCheet = spriteCheet;
			this._dataFile = dataFile;
			this._currentFrame = 0;
			this._totalFrames = dataFile.frame.length;
			
			this._timer = new Timer(this._fps, 0);
			this._timer.addEventListener(TimerEvent.TIMER, changeFrame);
			this._timer.start();
			
			drawFrame(this._currentFrame);

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
			while (this.numChildren)
				this.removeChildAt(0);
				
			var frame:Frame = this._dataFile.frame[dataIndex]
			
			var currentFrame:Bitmap = this._spriteCheet.readPixels(frame);
			this.addChild(currentFrame)
			
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