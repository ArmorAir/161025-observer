package AA {
	import AA.comp.Img2_StateAA;
	import AA.entry.EntryPanel_StateAA;
	
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
public class Entry_StateAA extends StateAA {
	
	
	override public function onEnter() : void {
		var img:ImageAA;
		var node:NodeAA;
		
		img = new ImageAA;
		img.textureId = "bg/bg_A.png";
		this.getFusion().addNode(img);
		
		img = new ImageAA;
		img.textureId = "bg/mask.png";
		this.getFusion().addNode(img);
		
		this.getFusion().addNode(this.getMorph().createSubMorph(new EntryPanel_StateAA).getNode());
		
	}
	
	
}
}