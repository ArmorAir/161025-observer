package AA.comp
{
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
	public class SettingBtnA_StateAA extends StateAA
	{
		public function SettingBtnA_StateAA( texA:String, texB:String, texC:String )
		{
			_texA = texA;
			_texB = texB;
			_texC = texC;
		}
		
		override public function onEnter():void {
			var img:ImageAA;
			
			img = new ImageAA;
			img.textureId = _texA;
			this.getFusion().addNode(img);
			img.pivotX = img.getSourceWidth() / 2;
			img.pivotY = img.getSourceHeight() / 2;
			
			img = new ImageAA;
			img.textureId = _texB;
			this.getFusion().addNode(img);
			img.pivotX = img.getSourceWidth() / 2;
			img.pivotY = img.getSourceHeight() / 2;
			img.x = -133;
			img.y = -6
				
			img = new ImageAA;
			img.textureId = _texC;
			this.getFusion().addNode(img);
			img.pivotX = img.getSourceWidth() / 2;
			img.pivotY = img.getSourceHeight() / 2;	
			img.x = 175;
			img.y = -6
		}
		
		
		
		
		private var _texA:String;
		private var _texB:String;		
		private var _texC:String;

	}
}