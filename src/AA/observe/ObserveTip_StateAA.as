package AA.observe
{
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.animate.ATween;
	import Lv_3.animate.TweenMachine;
	import Lv_3.animate.easing.Quad;
	
	import utils.ViewConfig;
	
	public class ObserveTip_StateAA extends StateAA
	{
		public function ObserveTip_StateAA()
		{
			super();
		}
		
		
		override public function onEnter():void {
			var img:ImageAA;
			
			
			
			img = new ImageAA;
			img.textureId = "observe/bg_A.png";
			this.getFusion().addNode(img);
			
			
			_circle = new ImageAA;
			_circle.textureId = "observe/img_A.png";
			_circle.x = 320;
			_circle.y = 30;
			this.getFusion().addNode(_circle);
			
			
			this.____doblink();
		}
		
		override public function onExit():void{
			TweenMachine.getInstance().stopAll();
		}
		
//		override public function onTick(elapsedTime:int):Boolean {
//			this.____doblink();
//			
//			TweenMachine.to(_circle, 1.0, {alpha:0.0});
//			return false;
//		}
		
		
		
		
		public static const BLINK_DURATION:Number = 0.5;
		
		
		private var _circle:ImageAA;
		
		
		private function ____doblink():void{
			var tween:ATween;
			
			if(_circle.alpha == 1.0){
				tween = TweenMachine.to(_circle, BLINK_DURATION, {alpha:0.0});
				tween.easing = Quad.easeOut;
				tween.onComplete = ____doblink;
			}
			else {
				tween = TweenMachine.to(_circle, BLINK_DURATION, {alpha:1.0});
				tween.easing = Quad.easeOut;
				tween.onComplete = ____doblink;
			}
		}
		
		
	}
}