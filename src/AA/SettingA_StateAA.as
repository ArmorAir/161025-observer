package AA
{
	import flash.geom.Point;
	
	import AA.comp.Img2Label_StateAA;
	import AA.comp.Img2_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.FusionAA;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
	import utils.ViewConfig;
	
	public class SettingA_StateAA extends StateAA
	{
		public function SettingA_StateAA( dragX:Number, dragY:Number, isLeft:Boolean )
		{
			super();
			
			_dragX = dragX;
			_dragY = dragY;
			_isLeft = isLeft;
		}
		
		override public function onEnter():void {
			var img:ImageAA;
			var node:NodeAA;
			var fusion:FusionAA;
			
			img = new ImageAA;
			img.textureId = "setting/blurBg.png";
			this.getFusion().addNode(img);
			
			
			img = new ImageAA;
			img.textureId = "setting/mask.png";
			this.getFusion().addNode(img);
			img.eventClick().addListener(onBack);
			
			fusion = new FusionAA;
			this.getFusion().addNode(fusion);
			fusion.x = _dragX;
			fusion.y = _dragY;
			
			node = this.getMorph().createSubMorph(new Img2_StateAA("setting/btn_1.png", "setting/img_1.png")).getNode();
			fusion.addNode(node);
			node.eventClick().addListener(onBack);
			
			
			node = this.getMorph().createSubMorph(new Img2Label_StateAA("setting/btn_3.png", "setting/img_3.png", "setting/text_A.png", _isLeft)).getNode();
			fusion.addNode(node);
			if(_isLeft){
				node.x = 260;
			}
			else {
				node.x = -400;
			}
			node.eventClick().addListener(onReset);
			
		}
		
		
		private var _dragX:Number;
		private var _dragY:Number;
		private var _isLeft:Boolean;
		
		
		private function onBack(e:AEvent):void{
			AAFacade.getInstance().getRoot().switchTo(new ObserverA_StateAA(new Point(_dragX, _dragY)));
		}
		
		private function onReset(e:AEvent):void{
			AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA);
		}
	}
}