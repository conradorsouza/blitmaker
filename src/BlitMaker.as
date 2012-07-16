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

package 
{
	import blitmaker.sprite.BlitSprite;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author Conrado Souza
	 */
	public class BlitMaker extends Sprite 
	{
		
		[Embed(source="../bin/buildings.png")]
		private const _buildingsImage:Class;
		
		[Embed(source="../bin/buildings.xml", mimeType="application/octet-stream")]
		private const _buildingsXML:Class;

		private var _blitBuildingSprite:BlitSprite;
	
		public function BlitMaker() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var dataSheetBuildings:XML = XML(new _buildingsXML());
			var buttonSpriteSheetBuildings:Bitmap = new _buildingsImage();
			_blitBuildingSprite = new BlitSprite(buttonSpriteSheetBuildings, dataSheetBuildings, 120); 
			
			addChild(_blitBuildingSprite);

		}
		
	}
	
}