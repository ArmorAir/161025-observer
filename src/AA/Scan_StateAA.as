package AA
{
	import flash.ui.Keyboard;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Key;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;

public class Scan_StateAA extends StateAA
{
	public function Scan_StateAA()
	{
	}
	
	public static const START_Y:int = 410;
	
	override public function onEnter():void {
		var img:ImageAA;
		
		img = new ImageAA;
		img.textureId = "scan/bg.png";
		this.getFusion().addNode(img);
		
		img = new ImageAA;
		img.textureId = "scan/mask.png";
		this.getFusion().addNode(img);
		
		_frame = new ImageAA;
		_frame.textureId = "scan/img_A.png";
		this.getFusion().addNode(_frame);
		_frame.x = (this.getWindow().windowWidth - _frame.getSourceWidth())/2;
		_frame.y = START_Y;
		_frame.eventClick().addListener(onObserveB);
		
		
		_line = new ImageAA;
		_line.textureId = "scan/line.png";
		this.getFusion().addNode(_line);
		_line.x = (this.getWindow().windowWidth - _line.getSourceWidth())/2 + 5;
		_line.y = START_Y;
		_line.touchable =false;
		
		img = new ImageAA;
		img.textureId = "QRcode/text_A.png";
		this.getFusion().addNode(img);
		img.x = (this.getWindow().windowWidth - img.getSourceWidth()) / 2;
		img.y = _frame.y + _frame.getSourceHeight() + 42;
		
		img = new ImageAA;
		img.textureId = "QRcode/btn.png";
		this.getFusion().addNode(img);
		img.x = (this.getWindow().windowWidth - img.getSourceWidth()) / 2;
		img.y = _frame.y + _frame.getSourceHeight() + 148;
		img.eventClick().addListener(onQuit);
	}
	
	override public function onTick(elapsedTime:int):Boolean {
		_line.y+=elapsedTime / 3;
		if(_line.y >= START_Y + _frame.getSourceHeight() - 15){
			_line.y = START_Y;
		}
		return false;
	}
	
//	override public function onKeyboard(k:Key):Boolean {
//		if(k.getKeyCode() == Keyboard.BACK) {
//			AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA);
//		}
//		return true;
//	}
	
	private var _frame:ImageAA;
	private var _line:ImageAA;
	
	
	
	
	private function onQuit(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA);
	}
	
	private function onObserveB(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new ObserverB_StateAA(true));
	}
}
}