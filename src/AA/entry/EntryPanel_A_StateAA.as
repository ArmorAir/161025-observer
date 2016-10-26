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

public class EntryPanel_A_StateAA extends StateAA
{
	
	public static const BTN_OFFSET_X:int = 220;
	public static const BTN_Y:int = 810 + 360;
	
	override public function onEnter():void {
		var img:ImageAA;
		var node:NodeAA;
		
		
		_bg = new ImageAA;
		_bg.textureId = "entry/img_A.png";
		this.getFusion().addNode(_bg);
		
		
		
		this.getFusion().pivotX = _bg.getSourceWidth() / 2;
		this.getFusion().x = this.getWindow().windowWidth / 2;
		this.getFusion().y = 270;
		
		
//		img = new ImageAA;
//		img.textureId = "entry/text_B.png";
//		this.getFusion().addNode(img);
//		img.x = (_bg.getSourceWidth() - img.getSourceWidth())/2;
//		img.y = 870;
		
		
		
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
		
		
		_installFN= new FusionAA;
		this.getFusion().addNode(_installFN);
		_installFN.x = _bg.getSourceWidth()/2;
		_installFN.y = 965;
		
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
	
	private var _bg:ImageAA;
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