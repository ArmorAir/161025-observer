package AA
{
	import flash.ui.Keyboard;
	
	import AA.QRcode.QRcodeShape_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Key;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;

public class QRcode_StateAA extends StateAA
{
	
	override public function onEnter():void {
		var img:ImageAA;
		var node:NodeAA;
		
		img = new ImageAA;
		img.textureId = "bg/bg_A.png";
		this.getFusion().addNode(img);
		
		img = new ImageAA;
		img.textureId = "bg/mask.png";
		this.getFusion().addNode(img);
		
		node = this.getMorph().createSubMorph(new QRcodeShape_StateAA).getNode();
		this.getFusion().addNode(node);
		node.x = this.getWindow().windowWidth / 2;
		node.y = 415;
		
	}
	
	
	
//	override public function onKeyboard(k:Key):Boolean {
//		if(k.getKeyCode() == Keyboard.BACK) {
//			AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA);
//		}
//		return true;
//	}
	

}
}