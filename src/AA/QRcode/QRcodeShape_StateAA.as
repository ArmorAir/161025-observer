package AA.QRcode
{
	import AA.Entry_StateAA;
	import AA.ObserverA_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
public class QRcodeShape_StateAA extends StateAA
{
	public function QRcodeShape_StateAA()
	{
		super();
	}
	
	override public function onEnter():void {
		var img:ImageAA;
		
		_bg = new ImageAA;
		_bg.textureId = "QRcode/img_B.png";
		this.getFusion().addNode(_bg);
		_bg.pivotX = _bg.getSourceWidth() / 2;
		
		img = new ImageAA;
		img.textureId = "QRcode/img.png";
		this.getFusion().addNode(img);
		img.pivotX = img.getSourceWidth() / 2;
		img.y = (_bg.getSourceHeight() - img.getSourceHeight())/2;
		img.eventClick().addListener(onObserveA);
		
		
		
		img = new ImageAA;
		img.textureId = "QRcode/text_A.png";
		this.getFusion().addNode(img);
		img.pivotX = img.getSourceWidth() / 2;
		img.y = _bg.getSourceHeight() + 18;
		
		img = new ImageAA;
		img.textureId = "QRcode/btn.png";
		this.getFusion().addNode(img);
		img.pivotX = img.getSourceWidth() / 2;
		img.y = _bg.getSourceHeight() + 118;
		img.eventClick().addListener(onQuit);
		
		
	}
	
	
	private var _bg:ImageAA;
	
	
	private function onQuit(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA);
	}
	
	private function onObserveA(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new ObserverA_StateAA());
	}
	
}
}