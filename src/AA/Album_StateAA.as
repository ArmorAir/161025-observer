package AA
{
	import flash.ui.Keyboard;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Key;
	
	import Lv_2.display.AAFacade;
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
			
			s9img = new Scale9ImageAA;
			s9img.textureId = "photo/s9b.png";
			this.getFusion().addNode(s9img);
			s9img.width = this.getWindow().windowWidth;
			s9img.height = ViewConfig.PHOTO_COVER;
			
			s9imgA = new Scale9ImageAA;
			s9imgA.textureId = "photo/s9b.png";
			this.getFusion().addNode(s9imgA);
			s9imgA.width = this.getWindow().windowWidth;
			s9imgA.height = ViewConfig.PHOTO_COVER;
			s9imgA.y = this.getWindow().windowHeight - ViewConfig.PHOTO_COVER;
		}
		
		override public function onKeyboard(k:Key):Boolean {
			if(k.getKeyCode() == Keyboard.BACK) {
				if(m_isA){
					AAFacade.getInstance().getRoot().switchTo(new ObserverA_StateAA());
				}
				else {
					AAFacade.getInstance().getRoot().switchTo(new ObserverB_StateAA());
				}
			}
			
			
			return false;
		}
		
		override public function onExit():void{
			TweenMachine.getInstance().stopAll();
		}
		
		
		
		private var s9img:Scale9ImageAA;
		private var s9imgA:Scale9ImageAA;
		private var m_isA:Boolean;
		private var m_isHide:Boolean;
		
		
		
		private function onCheckHide(e:AEvent):void{
			var tween:ATween;
			
			m_isHide = !m_isHide;
			
			if(m_isHide) {
				tween = TweenMachine.to(s9img, 0.15, {y:-ViewConfig.PHOTO_COVER});
				tween.easing = Cubic.easeOut;
				tween = TweenMachine.to(s9imgA, 0.15, {y:this.getWindow().windowHeight});
				tween.easing = Cubic.easeOut;
			}
			else {
				tween = TweenMachine.to(s9img, 0.15, {y:0});
				tween.easing = Cubic.easeOut;
				tween = TweenMachine.to(s9imgA, 0.15, {y:this.getWindow().windowHeight-ViewConfig.PHOTO_COVER});
				tween.easing = Cubic.easeOut;
			}
		}

	}
}