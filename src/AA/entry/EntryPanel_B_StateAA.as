package AA.entry
{
	import AA.InstallSoft_StateAA;
	import AA.QRcode_StateAA;
	import AA.Scan_StateAA;
	import AA.comp.Img2_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.FusionAA;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;

public class EntryPanel_B_StateAA extends StateAA
{
	
	public static const BTN_OFFSET_X:int = 255;
	public static const BTN_Y:int = 1250;
	
	override public function onEnter():void {
		var img:ImageAA;
		var node:NodeAA;
		
		
//		_bg = new ImageAA;
//		_bg.textureId = "entry/img_A.png";
//		this.getFusion().addNode(_bg);
		
		
		
//		this.getFusion().pivotX = this.getWindow() / 2;
//		this.getFusion().x = this.getWindow().windowWidth / 2;
		this.getFusion().y = 270;
		
		
		img = new ImageAA;
		img.textureId = "entry/rect_A.png";
		img.x = (this.getWindow().windowWidth - img.getSourceWidth())/2;
		img.y = 750;
		this.getFusion().addNode(img);
		
		img = new ImageAA;
		img.textureId = "entry/text_C.png";
		img.x = (this.getWindow().windowWidth - img.getSourceWidth())/2;
		img.y = 775;
		this.getFusion().addNode(img);
		
		
		
		node = this.getMorph().createSubMorph(new Img2_StateAA("entry/circle.png", "entry/B.png")).getNode();
		this.getFusion().addNode(node);
		node.x = BTN_OFFSET_X;
		node.y = BTN_Y;
		node.eventClick().addListener(onClientB);
		
		node = this.getMorph().createSubMorph(new Img2_StateAA("entry/circle.png", "entry/A.png")).getNode();
		this.getFusion().addNode(node);
		node.x = this.getWindow().windowWidth - BTN_OFFSET_X;
		node.y = BTN_Y;
		node.eventClick().addListener(onClientA);
		
		
		
		_installFN= new FusionAA;
		this.getFusion().addNode(_installFN);
		_installFN.x = this.getWindow().windowWidth/2;
		_installFN.y = 1585;
		
		img = new ImageAA;
		img.textureId = "entry/text_A.png";
		img.pivotX = img.getSourceWidth()/2;
		img.pivotY = img.getSourceHeight()/2;
		_installFN.addNode(img);
		
		img = new ImageAA;
		img.textureId = "entry/text_A.png";
		img.pivotX = img.getSourceWidth()/2;
		img.pivotY = img.getSourceHeight()/2;
		img.scaleX = 600 / img.getSourceWidth();
		img.scaleY = 95 / img.getSourceHeight();
		img.visible = false;
		_installFN.addNode(img);
		
		_installFN.eventClick().addListener(onInstallSoft);
	}
	
//	private var _bg:ImageAA;
	private var _installFN:FusionAA;


	private function onClientA(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new QRcode_StateAA);
	}
	
	private function onClientB(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new Scan_StateAA);
	}
	
	private function onInstallSoft(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new InstallSoft_StateAA);
	}
	
}
}