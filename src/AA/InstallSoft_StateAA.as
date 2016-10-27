package AA
{
	import flash.ui.Keyboard;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Key;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
public class InstallSoft_StateAA extends StateAA
{
	public function InstallSoft_StateAA()
	{
		super();
	}
	
	override public function onEnter():void {
		var img:ImageAA;
		
		
		img = new ImageAA;
		img.textureId = "entry/install.png";
		this.getFusion().addNode(img);
		
		
		img = new ImageAA;
		img.textureId = "setting/frame.png";
		this.getFusion().addNode(img);
		img.x = -120;
		img.y = 60;
//		img.alpha = 0.3;
		img.visible = false;
		
		img.eventClick().addListener(onBack);
		
	}
	
	override public function onKeyboard(k:Key):Boolean {
		if(k.getKeyCode() == Keyboard.BACK) {
			AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA());
		}
		
		
		return false;
	}
	
	private function onBack(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA());
	}
	
}
}