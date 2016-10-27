package AA.comp {
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
public class Img1_StateAA extends StateAA
{
	public function Img1_StateAA( texA:String )
	{
		_texA = texA;
	}
	
	override public function onEnter():void {
		var img:ImageAA;
		
		img = new ImageAA;
		img.textureId = _texA;
		this.getFusion().addNode(img);
		img.pivotX = img.getSourceWidth() / 2;
		img.pivotY = img.getSourceHeight() / 2;
		
		
	}
	
	
	
	private var _texA:String;
	
	
}
}