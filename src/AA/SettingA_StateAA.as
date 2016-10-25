package AA
{
	import AA.comp.Img2Label_StateAA;
	import AA.comp.Img2_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
	import utils.ViewConfig;
	
	public class SettingA_StateAA extends StateAA
	{
		public function SettingA_StateAA()
		{
			super();
		}
		
		override public function onEnter():void {
			var img:ImageAA;
			var node:NodeAA;
			
			
			img = new ImageAA;
			img.textureId = "setting/blurBg.png";
			this.getFusion().addNode(img);
			
			
			img = new ImageAA;
			img.textureId = "setting/mask.png";
			this.getFusion().addNode(img);
			img.eventClick().addListener(onBack);
			
			
			node = this.getMorph().createSubMorph(new Img2_StateAA("setting/btn_1.png", "setting/img_1.png")).getNode();
			this.getFusion().addNode(node);
			node.x = ViewConfig.SETTING_X;
			node.y = ViewConfig.SETTING_Y;
			node.eventClick().addListener(onBack);
			
			
			node = this.getMorph().createSubMorph(new Img2Label_StateAA("setting/btn_3.png", "setting/img_3.png", "setting/text_A.png")).getNode();
			this.getFusion().addNode(node);
			node.x = ViewConfig.SETTING_X + 260;
			node.y = ViewConfig.SETTING_Y;
			node.eventClick().addListener(onReset);
			
		}
		
		private function onBack(e:AEvent):void{
			AAFacade.getInstance().getRoot().switchTo(new ObserverA_StateAA);
		}
		
		private function onReset(e:AEvent):void{
			AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA);
		}
	}
}