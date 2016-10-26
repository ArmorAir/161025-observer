package AA.comp
{
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	import Lv_2.display.effects.TintEffectAA;
	
	public class SettingBtnB_StateAA extends StateAA
	{
		public function SettingBtnB_StateAA( texA:String, texB:String, offsetX:int )
		{
			_texA = texA;
			_texB = texB;
			_offsetX = offsetX;
		}
		
		override public function onEnter():void {
			var img:ImageAA;
			
			img = new ImageAA;
			img.textureId = _texA;
			this.getFusion().addNode(img);
			img.pivotX = img.getSourceWidth() / 2;
			img.pivotY = img.getSourceHeight() / 2;
//			img.effect = new TintEffectAA(0xdd3333);
			
			
			img = new ImageAA;
			img.textureId = _texB;
			this.getFusion().addNode(img);
			img.pivotX = img.getSourceWidth() / 2;
			img.pivotY = img.getSourceHeight() / 2;
			img.x = _offsetX;
			img.y = -6
			
		}
		
		
		
		
		private var _texA:String;
		private var _texB:String;		
		private var _offsetX:int;

	}
}