package AA.observe
{
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.animate.ATween;
	import Lv_3.animate.TweenMachine;
	import Lv_3.animate.easing.Cubic;
	import Lv_3.animate.easing.Quad;

	public class ObserverB_alert_StateAA extends StateAA
	{
		public function ObserverB_alert_StateAA()
		{
		}
		
		override public function onEnter():void {
			var tween:ATween;
			
			_alert = new ImageAA;
			_alert.textureId = "observe/text_1.png";
			this.getFusion().addNode(_alert);
			_alert.x = (this.getWindow().windowWidth - _alert.getSourceWidth())/2;
			_alert.y = 1550;
			
			tween = TweenMachine.to(_alert, 0.55, {alpha:0}, 1.85);
			tween.easing = Quad.easeOut;
			tween.onComplete = ____onAlertHide;
			
		}
		
		override public function onExit():void {
			TweenMachine.getInstance().stopTarget(_alert);
			
		}
		
		
		
		
		
		private var _alert:ImageAA;
		
		
		
		private function ____onAlertHide() : void {
			this.getFusion().kill();
		}
			
		
	}
}