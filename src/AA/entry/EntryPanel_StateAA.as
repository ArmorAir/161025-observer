package AA.entry
{
	import AA.QRcode_StateAA;
	import AA.Scan_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	import AA.comp.Img2_StateAA;

public class EntryPanel_StateAA extends StateAA
{
	public function EntryPanel_StateAA()
	{
	}
	
	public static const BTN_OFFSET_X:int = 225;
	public static const BTN_Y:int = 810;
	
	override public function onEnter():void {
		var img:ImageAA;
		var node:NodeAA;
		
		
		_bg = new ImageAA;
		_bg.textureId = "entry/img.png";
		this.getFusion().addNode(_bg);
		
		
		
		this.getFusion().pivotX = _bg.getSourceWidth() / 2;
		this.getFusion().x = this.getWindow().windowWidth / 2;
		this.getFusion().y = 400;
		
		
		img = new ImageAA;
		img.textureId = "entry/text_B.png";
		this.getFusion().addNode(img);
		img.x = (_bg.getSourceWidth() - img.getSourceWidth())/2;
		img.y = 620;
		
		
		
		node = this.getMorph().createSubMorph(new Img2_StateAA("entry/circle.png", "entry/A.png")).getNode();
		this.getFusion().addNode(node);
		node.x = BTN_OFFSET_X;
		node.y = BTN_Y;
		node.eventClick().addListener(onClientA);

		
		
		node = this.getMorph().createSubMorph(new Img2_StateAA("entry/circle.png", "entry/B.png")).getNode();
		this.getFusion().addNode(node);
		node.x = _bg.getSourceWidth() - BTN_OFFSET_X;
		node.y = BTN_Y;
		node.eventClick().addListener(onClientB);
		
		
		
		img = new ImageAA;
		img.textureId = "entry/text_A.png";
		this.getFusion().addNode(img);
		img.x = (_bg.getSourceWidth() - img.getSourceWidth())/2;
		img.y = 1030;
	}
	
	private var _bg:ImageAA;
	


	private function onClientA(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new QRcode_StateAA);
	}
	
	private function onClientB(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new Scan_StateAA);
	}
	
}
}