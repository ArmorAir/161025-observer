package AA.comp
{
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;

	public class Img2Label_StateAA extends Img2_StateAA
	{
		public function Img2Label_StateAA( texA:String, texB:String, label:String, isleft:Boolean )
		{
			super(texA, texB);
			_label = label;
			_isLeft = isleft;
		}
		
		override public function onEnter():void{
			super.onEnter();
			
			
			var img:ImageAA;
			
			img = new ImageAA;
			img.textureId = _label;
			this.getFusion().addNode(img);
//			img.pivotX = img.getSourceWidth() / 2;
			img.pivotY = img.getSourceHeight() / 2;
//			if(_isLeft) {
				img.x = 135;
//			}
//			else {
//				img.x = -200;
//			}
		}
		
		
		private var _label:String;
		private var _isLeft:Boolean;
	}
}