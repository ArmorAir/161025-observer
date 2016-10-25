package AA.comp {
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
public class Img2_StateAA extends StateAA
{
	public function Img2_StateAA( texA:String, texB:String )
	{
		_texA = texA;
		_texB = texB;
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
		
	}
	
	
	
	private var _texA:String;
	private var _texB:String;
	
	
}
}