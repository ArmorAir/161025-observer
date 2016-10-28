package AA
{
	import flash.ui.Keyboard;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Key;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.FusionAA;
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.animate.ATween;
	import Lv_3.animate.TweenMachine;
	import Lv_3.animate.easing.Cubic;
	import Lv_3.animate.easing.Quad;
	import Lv_3.display.advanced.Scale9ImageAA;
	
	import utils.ViewConfig;
	
	public class Album_StateAA extends StateAA
	{
		public function Album_StateAA( isA:Boolean )
		{
			super();
			
			m_isA = isA;
		}
		
		override public function onEnter():void{
			var img:ImageAA;
			
			
			
			img = new ImageAA;
			img.textureId = "photo/photo_A.png";
			this.getFusion().addNode(img);
			img.eventClick().addListener(onCheckHide);
			
			s9img = new ImageAA;
			s9img.textureId = "photo/bg_1.png";
			this.getFusion().addNode(s9img);
//			s9img.width = this.getWindow().windowWidth;
//			s9img.height = ViewConfig.PHOTO_COVER;
			
			
			_bottomFN = new FusionAA;
			this.getFusion().addNode(_bottomFN);
			_bottomFN.y = this.getWindow().windowHeight - ViewConfig.PHOTO_COVER_2;
			
			s9imgA = new ImageAA;
			s9imgA.textureId = "photo/bg_2.png";
			_bottomFN.addNode(s9imgA);
//			s9imgA.width = this.getWindow().windowWidth;
//			s9imgA.height = ViewConfig.PHOTO_COVER;
			
			
			img = new ImageAA;
			img.textureId = "photo/btn_1.png";
			_bottomFN.addNode(img);
			img.pivotX = img.getSourceWidth()/2;
			img.pivotY = img.getSourceHeight()/2;
			img.x = ViewConfig.ALBUM_BTN_OFFSET_X;
			img.y = ViewConfig.ALBUM_BTN_Y;
			img.eventClick().addListener(____onQuit);
			
			img = new ImageAA;
			img.textureId = "photo/btn_2.png";
			_bottomFN.addNode(img);
			img.pivotX = img.getSourceWidth()/2;
			img.pivotY = img.getSourceHeight()/2;
			img.x = this.getWindow().windowWidth - ViewConfig.ALBUM_BTN_OFFSET_X;
			img.y = ViewConfig.ALBUM_BTN_Y;
//			img.eventClick().addListener(____onQuit);
		}
		
		override public function onKeyboard(k:Key):Boolean {
			if(k.getKeyCode() == Keyboard.BACK) {
				this.____onQuit();
			}
			
			
			return false;
		}
		
		override public function onExit():void{
			TweenMachine.getInstance().stopAll();
		}
		
		
		
//		private var s9img:Scale9ImageAA;
		private var s9img:ImageAA;
		private var _bottomFN:FusionAA;
//		private var s9imgA:Scale9ImageAA;
		private var s9imgA:ImageAA;
		private var m_isA:Boolean;
		private var m_isHide:Boolean;
		
		
		
		private function onCheckHide(e:AEvent):void{
			var tween:ATween;
			
			m_isHide = !m_isHide;
			
			if(m_isHide) {
				tween = TweenMachine.to(s9img, 0.15, {y:-ViewConfig.PHOTO_COVER_1});
				tween.easing = Quad.easeOut;
				tween = TweenMachine.to(_bottomFN, 0.15, {y:this.getWindow().windowHeight});
				tween.easing = Quad.easeOut;
			}
			else {
				tween = TweenMachine.to(s9img, 0.15, {y:0});
				tween.easing = Quad.easeOut;
				tween = TweenMachine.to(_bottomFN, 0.15, {y:this.getWindow().windowHeight-ViewConfig.PHOTO_COVER_2});
				tween.easing = Quad.easeOut;
			}
		}
		
		private function ____onQuit(e:AEvent=null) : void {
			if(m_isA){
				AAFacade.getInstance().getRoot().switchTo(new ObserverA_StateAA());
			}
			else {
				AAFacade.getInstance().getRoot().switchTo(new ObserverB_StateAA(true));
			}
		}

	}
}