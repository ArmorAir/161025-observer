package AA
{
	import flash.geom.Point;
	
	import AA.comp.Img1_StateAA;
	import AA.comp.Img2_StateAA;
	import AA.comp.SettingBtnA_StateAA;
	import AA.comp.SettingBtnB_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.FusionAA;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;

	public class SettingB_StateAA extends StateAA
	{
		public function SettingB_StateAA( dragX:Number, dragY:Number, isLeft:Boolean  )
		{
			super();
			
			_dragX = dragX;
			_dragY = dragY;
			_isLeft = isLeft;
		}
		
		
		private var _dragX:Number;
		private var _dragY:Number;
		private var _isLeft:Boolean;
		
		
		override public function onEnter():void {
			var img:ImageAA;
			var node:NodeAA;
			var fusion:FusionAA;
			
			img = new ImageAA;
			img.textureId = "bg/bg_A.png";
			this.getFusion().addNode(img);
			img.eventClick().addListener(onBack);
			
//			img = new ImageAA;
//			img.textureId = "setting/mask.png";
//			this.getFusion().addNode(img);
//			img.eventClick().addListener(onBack);
			
			
			
			fusion = new FusionAA;
			this.getFusion().addNode(fusion);
			fusion.x = _dragX;
			fusion.y = _dragY;
			
			
			node = this.getMorph().createSubMorph(new Img1_StateAA("observe/btn_2.png")).getNode();
			fusion.addNode(node);
			node.eventClick().addListener(onBack);
			

			node = this.getMorph().createSubMorph(new Img1_StateAA("observe/btn_A.png")).getNode();
			fusion.addNode(node);
			if(_isLeft){
				node.x = 390;
			}
			else {
				node.x = -390;
			}
//			node.y = - 93;
			node.eventClick().addListener(onReset);
			
//			node = this.getMorph().createSubMorph(new Img1_StateAA("observe/btn_B.png")).getNode();
//			fusion.addNode(node);
//			if(_isLeft){
//				node.x = 390;
//			}
//			else {
//				node.x = -390;
//			}
//			node.y = 185;
			
			
		}
		
		private function onBack(e:AEvent):void{
			AAFacade.getInstance().getRoot().switchTo(new ObserverB_StateAA(false, new Point(_dragX, _dragY)));
		}
		
		private function onReset(e:AEvent):void{
			AAFacade.getInstance().getRoot().switchTo(new Entry_StateAA);
		}
	}
}