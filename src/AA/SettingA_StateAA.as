package AA
{
	import flash.geom.Point;
	
	import AA.comp.Img1_StateAA;
	import AA.comp.SettingBtnB_StateAA;
	import AA.observe.ObserveTip_StateAA;
	
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
			img.textureId = "bg/bg_A.png";
			this.getFusion().addNode(img);
			img.eventClick().addListener(onBack);
			
			
//			img = new ImageAA;
//			img.textureId = "setting/mask.png";
//			this.getFusion().addNode(img);
			
//			img = new ImageAA;
//			img.textureId = "connected/tip.png";
//			this.getFusion().addNode(img);
			node = this.getMorph().createSubMorph(new ObserveTip_StateAA).getNode();
			this.getFusion().addNode(node);
			node.y = ViewConfig.TIP_STARY_Y;
			node.touchable =false;
			
//			img = new ImageAA;
//			img.textureId = "connected/text_A.png";
//			this.getFusion().addNode(img);
//			img.x = (this.getWindow().windowWidth - img.getSourceWidth())/2;
//			img.y =  ViewConfig.TIP_STARY_Y + 18;
//			img.touchable = false;
			
			fusion = new FusionAA;
			this.getFusion().addNode(fusion);
			fusion.x = _dragX;
			fusion.y = _dragY;
			
//			node = this.getMorph().createSubMorph(new Img2_StateAA("connected/img_A.png", "connected/img_C.png")).getNode();
			node = this.getMorph().createSubMorph(new Img1_StateAA("observe/btn_2.png")).getNode();
			fusion.addNode(node);
			node.eventClick().addListener(onBack);
			
			
//			node = this.getMorph().createSubMorph(new SettingBtnB_StateAA("setting/frame_A.png", "setting/text_D.png", 0)).getNode();
			node = this.getMorph().createSubMorph(new Img1_StateAA("observe/btn_A.png")).getNode();
			fusion.addNode(node);
			if(_isLeft){
				node.x = 390;
			}
			else {
				node.x = -390;
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